# Local Bridges

The CapCut bridge, the YouTube manager, and the GHL social bridge run on the member's computer as local MCP servers. This plugin does not install them. Setup only detects them (exact tool names below). For a missing CapCut bridge or GHL social bridge, say: "Run /hi5-connector and it will install it for you." (it is in Connectors OS, Windows only for now). For the YouTube manager, say: "Ask in the Hi5 Success community and we'll walk you through it." Do not write Google Cloud, API key, or developer console steps.

## Where the bridges are set up
The CapCut bridge and GHL social are installed by /hi5-connector (Connectors OS) and work in Claude Code in the desktop app. The YouTube manager is still set up by hand with the community's help. Never hardcode the CapCut drafts folder: the bridge knows it. Never install, repair, or configure a bridge from this plugin.

## Detect by exact tool names
Match on the end of the tool name. A prefix may appear in front (for example mcp__capcut__capcut_save_draft is the tool capcut_save_draft). Do not match on words in a name, only on these tool names.
| Bridge (server) | Tools |
|---|---|
| capcut | capcut_create_draft, capcut_add_video, capcut_add_audio, capcut_add_text, capcut_add_subtitle, capcut_add_image, capcut_add_sticker, capcut_add_effect, capcut_add_keyframe, capcut_get_duration, capcut_save_draft, capcut_move_export |
| youtube-manager | upload_youtube_video, list_youtube_channels, list_youtube_videos, add_youtube_channel |
| ghl-social | create_post, list_posts, list_social_accounts |
A bridge counts as installed when its tools are available in this session. Save what you find in Content Settings (bridges_detected) with the date, and check again only when something fails or the member says they installed one. Say once, in setup, that the desktop app must be running for the bridges to work. Never ask the member to reconfirm a bridge that works. vidIQ is optional: without it, Social uses the transcript and any Producer notes on the row.

## Confirm the account before posting
The tool confirms the account, never the member.
- **Before any YouTube upload:** call list_youtube_channels and check that the channel matches the content system's youtube_channel (saved the first time it was confirmed). If the channel is not connected, offer add_youtube_channel, with the member's OK.
- **Before any post or schedule:** call list_social_accounts and check that an account exists for every platform in the row's Platforms field and matches the content system's social_accounts. If a platform has no account, say which one in a single line and keep the rest of the queue moving.
- Use list_youtube_videos to check whether a long-form is public yet, and list_posts to confirm a scheduled post and for the daily Published check.
If a call succeeds, move on. Do not ask the member to confirm it again.

## Transcript and export
The synced folder is where files live (the folders reference). Footage and finished exports go in the project's folder. The CapCut project itself stays in CapCut's own folder on the computer and is never synced.
- **Transcript, the default:** the Video Editor pulls the transcript from CapCut and exports it as a file (a .txt or .srt) into the same folder as the video. Do not assume a particular CapCut caption export tool, read the tool's description first and use what the bridge or CapCut offers.
- **Fallback:** if the transcript cannot be pulled, ask the member to paste it, and save the pasted text as a file in the same folder.
- **Log which path was used** in the row's Log: "Transcript: pulled from CapCut" or "Transcript: pasted by the member".
- **Exporting a rendered video:** use the bridge's export tool if it has one. Otherwise ask the member to export from CapCut into the row's Exports folder. If the export landed in Videos, Downloads, or the Desktop instead, move it there with capcut_move_export (it checks the copy before deleting the original). The capcut tools above build and save a draft, they do not by themselves produce a rendered file.

## What each bridge does
- **capcut:** create a draft, add video, audio, text, subtitles, images, stickers, effects, and keyframes, get a duration, save the draft into CapCut under a project name, and move a finished export into the project's folder.
- **youtube-manager:** upload a video (with its thumbnail and schedule, as the tool allows), list the connected channels and videos, and add a channel.
- **ghl-social:** create a post (scheduled) on the connected accounts, list posts, and list the social accounts.
Read each tool's description before calling it, and never guess an argument. If the ghl-social bridge is missing and the member's GoHighLevel connector is connected, its social planner create-post operation can schedule posts (describe the operation first).

## If a bridge is missing
Say so in one line and give the manual step, then keep the pipeline moving.
- **capcut missing:** "I can't reach the CapCut bridge, so I can't edit for you. Edit this one in CapCut yourself, drop the finals in the Exports folder, tell me, and I'll continue with the transcript, captions, and cover." If there is no transcript, use the fallback above.
- **youtube-manager missing:** "I can't reach the YouTube manager. Here is the title, description, chapters, tags, and thumbnail to paste into YouTube Studio when you upload. Tell me when it is scheduled."
- **ghl-social missing:** "I can't reach the scheduler. Here is each post with its time to paste into your scheduler. Tell me when they are scheduled."
Mark the matching checklist item only after the member says it is done. Never claim a bridge did something it did not do.

## Browser steps
Claude's built-in browser handles the steps no tool covers: YouTube Studio end screens and cards, linking a related long-form to a Short, and making an image in ChatGPT (cover option C). Ask the member to sign in if needed. Never enter a password for them.
