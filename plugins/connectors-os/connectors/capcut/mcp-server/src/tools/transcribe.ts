// capcut_transcribe: make a transcript of a video on this computer (faster-whisper in the bridge's Python, nothing uploaded).
// Long videos take minutes, so it runs in the background: call again with the same file to see progress or the result.
import { z } from "zod";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import fs from 'node:fs';
import path from 'node:path';
import { spawn } from 'node:child_process';
import { allowedDest } from './move.js';

const PY = process.env.CAPCUT_PYTHON || '';
const MODELS = process.env.CAPCUT_MODELS || '';
const SCRIPT = PY ? path.join(path.dirname(path.dirname(path.dirname(PY))), 'transcribe.py') : '';  // venv\Scripts\python.exe -> bridge\
const alive = (pid: number) => { try { process.kill(pid, 0); return true; } catch { return false; } };

const TranscribeSchema = z.object({
    file: z.string().min(3).describe('Absolute path of the video or audio file on this computer, e.g. G:\\My Drive\\Content\\<Project>\\Clips\\take1.mp4'),
    output_folder: z.string().min(3).optional().describe("Folder for the transcript files, normally the project's Export folder. Defaults to the video's folder"),
    output_name: z.string().regex(/^[^\\/:*?"<>|]+$/).optional().describe("File name without extension, e.g. '<Video Title> - Transcript'. Defaults to '<video name> - Transcript'"),
    model: z.enum(['small.en', 'base.en', 'small', 'base']).default('small.en').describe("small.en (English, best), base.en (English, faster, less memory), small or base for other languages")
}).strict();

const ok = (o: object) => ({ content: [{ type: 'text' as const, text: JSON.stringify(o, null, 2) }], structuredContent: o as Record<string, unknown> });

export function registerTranscribeTool(server: McpServer): void {
    server.registerTool('capcut_transcribe', {
        title: 'Transcribe a video on this computer',
        description: `Make a timestamped transcript (.txt with [hh:mm:ss] lines, and .srt captions) of a local video, on this computer, free, nothing uploaded.
Runs in the background: the first call starts it and returns state "running". Call again with the same file and output to get progress, then state "done" with the file paths. Then read the .txt.
Roughly a third to half of the video's length on a normal laptop. Machine transcripts mishear names and numbers: check them against the script.`,
        inputSchema: TranscribeSchema,
        annotations: { readOnlyHint: false, destructiveHint: false, idempotentHint: true, openWorldHint: false }
    }, async (params: z.infer<typeof TranscribeSchema>) => {
        try {
            if (!PY || !fs.existsSync(PY) || !fs.existsSync(SCRIPT)) throw new Error('Transcripts need CapCut connector 1.1.0 or later. Run /hi5-connector and update the CapCut bridge.');
            const video = path.resolve(params.file);
            if (!fs.existsSync(video)) throw new Error(`File not found: ${video}`);
            const dir = path.resolve(params.output_folder || path.dirname(video));
            if (!allowedDest(dir)) throw new Error(`Output folder not allowed (system folder or AppData): ${dir}`);
            const base = path.join(dir, params.output_name || `${path.parse(video).name} - Transcript`);
            const txt = base + '.txt', srt = base + '.srt', statusFile = base + '.transcribing.json';

            if (fs.existsSync(statusFile)) {
                const st = JSON.parse(fs.readFileSync(statusFile, 'utf8'));
                if (st.state === 'running' && st.pid && alive(st.pid)) return ok({ state: 'running', progress_percent: st.progress, model: st.model, next: 'Call again in a minute or two.' });
                if (st.state === 'failed') { fs.rmSync(statusFile, { force: true }); throw new Error(`The last try failed: ${st.error}. Calling again starts over.`); }
                fs.rmSync(statusFile, { force: true });  // the process stopped (computer slept or restarted): start over
            } else if (fs.existsSync(txt)) {
                const lines = fs.readFileSync(txt, 'utf8').split('\n').filter(Boolean).length;
                return ok({ state: 'done', txt, srt: fs.existsSync(srt) ? srt : null, lines });
            }

            fs.mkdirSync(dir, { recursive: true });
            const child = spawn(PY, [SCRIPT, video, base, params.model, MODELS], { detached: true, windowsHide: true, stdio: 'ignore' });
            child.unref();
            // Written now so a quick second call sees the job instead of starting another one.
            fs.writeFileSync(statusFile, JSON.stringify({ state: 'running', progress: 0, model: params.model, pid: child.pid }));
            return ok({ state: 'running', progress_percent: 0, model: params.model, next: 'Started. Call again in a minute or two with the same file to see progress.' });
        }
        catch (error) {
            return { content: [{ type: 'text', text: `Error: ${error instanceof Error ? error.message : String(error)}` }], isError: true };
        }
    });
}
