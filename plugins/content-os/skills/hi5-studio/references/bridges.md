# Local Bridges

The CapCut bridge, the YouTube uploader, and the GHL social bridge run on the member's computer and are bundled with the plugin install notes. Setup points to the install notes and the install video: [BRIDGE INSTALL VIDEO LINK: add before release]. Do not write Google Cloud, API key, or developer console steps. Point to the video and the install notes.

## Detect, never nag
- At the start of any Studio session, check which bridge tools are available in this session. A CapCut tool has capcut in its name. The YouTube uploader has youtube and upload in its name. The GHL social bridge has ghl and social in its name. If the member's GoHighLevel connector is connected, it can also schedule social posts through its social planner (look for a create post operation with a schedule date).
- Save what you find in Studio Settings (bridges_detected). Check again only when something fails or the member says they installed one.
- Never ask the member to reconfirm a bridge that works.
- Say once, in setup, that the desktop app must be running for the bridges to work.
- vidIQ is optional. If it is not connected, Social uses the transcript and any Producer notes on the row.

## What each bridge must provide
- **CapCut bridge:** open a project, edit and cut clips, add captions, export a file to a folder (the bridge splits files over the upload limit and joins them back), and export a timestamped transcript of a video or clip.
- **YouTube uploader:** upload a video with a title, description, chapters, tags, and a thumbnail, and schedule it.
- **GHL social bridge (or the GoHighLevel connector):** schedule one piece on every platform in the Platforms field at the same time.
The exact tool names and arguments come from the bridge files. Read each tool's description in the session before calling it, and never guess an argument.

## If a bridge is missing
Say so in one line and give the manual step, then keep the pipeline moving.
- **CapCut missing:** "I can't reach the CapCut bridge, so I can't edit for you. Edit this one in CapCut yourself, drop the finals in the Exports folder, tell me, and I'll continue with the transcript, captions, and cover." If there is no transcript, ask the member to paste one or name another local tool that made it.
- **YouTube uploader missing:** "I can't reach the YouTube uploader. Here is the title, description, chapters, tags, and thumbnail to paste into YouTube Studio when you upload. Tell me when it is scheduled."
- **GHL social missing:** "I can't reach the scheduler. Here is each post with its time to paste into your scheduler. Tell me when they are scheduled."
Then mark the matching checklist item only after the member says it is done. Never claim a bridge did something it did not do.

## Browser steps
Claude's built-in browser handles the steps no API covers: YouTube Studio end screens and cards, linking a related long-form to a Short, and making an image in ChatGPT (cover option C). Ask the member to sign in if needed. Never enter a password for them.
