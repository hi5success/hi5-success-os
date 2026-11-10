# CapCut Recipe

For every industry, not only real estate. Read each capcut tool's description before calling it, and never guess an argument.

## 1. Classify the video first
Look at the footage (a few frames and the transcript) and say the type in one line before editing.

| Type | What it looks like | Edits that fit |
|---|---|---|
| **Talking head** | One person speaking to camera | Tight cuts on silences and retakes, punch-in zooms on key lines (keyframes), captions, B-roll or a graphic on each number or claim, a clean intro hook in the first 3 seconds. |
| **Property tour** (real estate) | Walking through a home or listing | Smooth order (outside, entry, main rooms, best feature last or first), short text labels for rooms and features from the listing facts only, light music, no captions over the room. Fair Housing on every label. |
| **Community tour** | Driving or walking an area, places, amenities | Place-name labels, an animated map or drive-time graphic, B-roll of each place, music. Describe places, never people. |
| **Interview or podcast** | Two or more people talking | Cut to whoever is speaking, name lower thirds the first time each person speaks, captions, pull the strongest answers for clips. |
| **Screen share or tutorial** | Slides or a screen | Trim the start and end, zoom on the part being shown, no color changes, captions only if the member wants them. |
| **Other** | Anything else | Ask the member one question: "What should this feel like?" with A, B, C options. |

## 2. Set up the project
- Canvas with capcut_create_draft: 1920x1080 for a long-form, 1080x1920 for a short or reel. Match the footage frame rate when the tool allows it.
- Media are absolute local paths in the project's folder (Clips, B-Roll). The bridge copies them into the CapCut project. A cloud link does not work: find the file in the synced folder (folders reference).
- Track order, bottom to top: main footage, B-roll and graphics overlay, text and lower thirds, captions. Music and sound on audio tracks.
- Trim with the start and end times on capcut_add_video; place each piece at its time on the timeline.

## 3. Build the edit
Apply, in order: the type's edits from the table, the Style Guide and Brand, Video Preferences, the Edit notes, the Edit Log, then video-defaults.md. Captions come from the saved transcript (.srt) with capcut_add_subtitle.

## 4. Save and export
- Save with capcut_save_draft and a project name: `[Video Title]`, or `Reel N - [hook] - [Video Title]` for a clip. Each clip or short is its own CapCut project, cut from the source video with start and end times.
- Tell the member: "Open CapCut (if it was open, close it and open it again). You'll see [name] in your projects."
- The bridge saves the project but does not render a video. The member exports from CapCut and picks the project's Export folder (Export/Shorts for a clip from a long-form). If the export lands in Videos, Downloads, or the Desktop, move it with capcut_move_export.
- Name a review copy with "-review"; finals have no "-review".
