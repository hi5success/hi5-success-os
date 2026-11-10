# Transcript

Every edited video gets its transcript saved as files in the project's Export folder, every time: `[Video Title] - Transcript.txt` (timestamped lines like `[00:00:12] text`) and, when the path gives one, `[Video Title] - Transcript.srt`. The YouTube title, description, chapters, captions, and the blog are written from it, so nobody waits hours for YouTube's captions. For a clip or short, save it next to that video.

Use the first path that is available, in this order. Detect each by its exact tool name, never by asking the member.

| # | Path | What it needs | Notes |
|---|---|---|---|
| 1 | **capcut_transcribe** (Connectors OS, CapCut connector 1.1.0 or later) | The CapCut connector installed with /hi5-connector. Runs on the computer, free, nothing uploaded. | Long videos take a while (roughly a third to a half of the video's length on a normal laptop). The tool runs in the background: call it again with the same file to check progress. It writes the .txt and .srt itself. |
| 2 | **Descript** (transcribe_audio_video, export_transcript) | The member's own Descript account connected in Claude. The video is uploaded to Descript. | Ask once before uploading a member's video to Descript. Use export_transcript to get the text and save it as the files above. |
| 3 | **CapCut auto-captions** | CapCut on the computer. | Ask the member: "In CapCut, open the project, choose Captions, Auto captions, then export the captions as SRT into the Export folder, and tell me." Then make the .txt from the .srt. |
| 4 | **The member pastes it** | Nothing. | Save the pasted text as the .txt file. |

- **Not a transcript source:** vidIQ's video transcript tool and YouTube's own captions only work after the video is on YouTube (and not while it is private or scheduled), which is the wait this step exists to avoid. Use them only to check an already-public video.
- Runway is for generating video, not transcripts.
- A machine transcript mishears names, brands, and numbers. Read it against the script and the row, fix what you are sure of, and put [confirm: ...] on anything you are not. Never invent a word.
- Log which path was used in the row's Log: "Transcript: CapCut connector", "Transcript: Descript", "Transcript: CapCut captions export", or "Transcript: pasted by the member". Tick Transcript saved.
