"""Hi5: transcribe a video on this computer with faster-whisper (no upload).

  python transcribe.py --download MODEL MODELS_DIR       fetch the model once (run by the installer)
  python transcribe.py VIDEO OUT_BASE MODEL MODELS_DIR   write OUT_BASE.txt and OUT_BASE.srt

While it runs, OUT_BASE.transcribing.json holds {state, progress, model, error}; it is removed on success.
"""
import json
import os
import sys
import time

os.environ.setdefault("HF_HUB_DISABLE_SYMLINKS_WARNING", "1")


def stamp(seconds, srt=False):
    ms = int(round(seconds * 1000))
    h, ms = divmod(ms, 3_600_000)
    m, ms = divmod(ms, 60_000)
    s, ms = divmod(ms, 1000)
    return f"{h:02}:{m:02}:{s:02},{ms:03}" if srt else f"{h:02}:{m:02}:{s:02}"


def load(model, models_dir):
    from faster_whisper import WhisperModel
    try:
        return WhisperModel(model, device="cpu", compute_type="int8", download_root=models_dir), model
    except RuntimeError as e:
        # Seen on a busy laptop: "mkl_malloc: failed to allocate memory". The base model needs far less.
        if "alloc" not in str(e).lower() or model.startswith("base"):
            raise
        small = "base.en" if model.endswith(".en") else "base"
        return WhisperModel(small, device="cpu", compute_type="int8", download_root=models_dir), small


def decode(video):
    # ffmpeg (already required by the bridge) instead of faster-whisper's PyAV decoder, which breaks with newer PyAV releases.
    import subprocess
    import numpy as np
    raw = subprocess.run(["ffmpeg", "-nostdin", "-v", "error", "-i", video, "-vn", "-ac", "1", "-ar", "16000", "-f", "s16le", "-"],
                         capture_output=True, check=True, creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0)).stdout
    return np.frombuffer(raw, np.int16).astype(np.float32) / 32768.0


def write_status(path, **kw):
    tmp = path + ".tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(kw, f)
    os.replace(tmp, path)


def transcribe(video, out_base, model, models_dir):
    status = out_base + ".transcribing.json"
    write_status(status, state="running", progress=0, model=model, pid=os.getpid(), started=time.time())
    try:
        whisper, used = load(model, models_dir)
        segments, info = whisper.transcribe(decode(video), vad_filter=True, beam_size=5)
        total = info.duration or 0
        rows = []
        last = 0
        for seg in segments:
            text = seg.text.strip()
            if text:
                rows.append((seg.start, seg.end, text))
            pct = int(seg.end * 100 / total) if total else 0
            if pct >= last + 2:
                last = pct
                write_status(status, state="running", progress=min(pct, 99), model=used, pid=os.getpid())
        with open(out_base + ".txt", "w", encoding="utf-8") as f:
            f.writelines(f"[{stamp(a)}] {t}\n" for a, _, t in rows)
        with open(out_base + ".srt", "w", encoding="utf-8") as f:
            f.writelines(f"{i}\n{stamp(a, True)} --> {stamp(b, True)}\n{t}\n\n" for i, (a, b, t) in enumerate(rows, 1))
        os.remove(status)
    except Exception as e:  # leave the reason for the tool to read back
        write_status(status, state="failed", progress=0, model=model, error=str(e)[:500])
        raise


if __name__ == "__main__":
    a = sys.argv[1:]
    if len(a) == 3 and a[0] == "--download":
        load(a[1], a[2])
        print("model ready")
    elif len(a) == 4:
        transcribe(*a)
    else:
        sys.exit(__doc__)
