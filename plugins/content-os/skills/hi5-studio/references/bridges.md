# Local Bridges

The CapCut bridge, the YouTube manager, and the GHL social bridge run on the member's computer as local MCP servers and are bundled with the plugin install notes. Setup points to the install notes and the install video: [BRIDGE INSTALL VIDEO LINK: add before release]. Do not write Google Cloud, API key, or developer console steps. Point to the video and the install notes.

## Detect by exact tool names
Match on the end of the tool name. A prefix may appear in front (for example mcp__capcut__capcut_save_draft is the tool capcut_save_draft). Do not match on words in a name, only on these tool names.
| Bridge (server) | Tools |
|---|---|
| capcut | capcut_create_draft, capcut_add_video, capcut_add_audio, capcut_add_text, capcut_add_subtitle, capcut_add_image, capcut_add_sticker, capcut_add_effect, capcut_add_keyframe, capcut_get_duration, capcut_join_parts, capcut_save_draft |
| youtube-manager | upload_youtube_video, list_youtube_channels, list_youtube_videos, add_youtube_channel |
| ghl-social | create_post, list_posts, list_social_accounts |
A bridge counts as installed when its tools are available in this session. Save what you find in Studio Settings (bridges_detected) with the date, and check again only when something fails or the member says they installed one. Say once, in setup, that the desktop app must be running for the bridges to work. Never ask the member to reconfirm a bridge that works. vidIQ is optional: without it, Social uses the transcript and any Producer notes on the row.

## Confirm the account before posting
The tool confirms the account, never the member.
- **Before any YouTube upload:** call list_youtube_channels and check that the channel matches the Studio's youtube_channel (saved the first time it was confirmed). If the channel is not connected, offer add_youtube_channel, with the member's OK.
- **Before any post or schedule:** call list_social_accounts and check that an account exists for every platform in the row's Platforms field and matches the Studio's social_accounts. If a platform has no account, say which one in a single line and keep the rest of the queue moving.
- Use list_youtube_videos to check whether a long-form is public yet, and list_posts to confirm a scheduled post and for the daily Published check.
If a call succeeds, move on. Do not ask the member to confirm it again.

## Transcript and export: use the real tools
Do not assume a CapCut caption export. The bridge files and docs in the repo name the export and transcript tools, so read them and use those tools. Until the docs say otherwise, get the transcript in this order:
1. The bridge, if it has a tool for it (read the tool's description first).
2. A local tool on the member's computer (name the tool you used).
3. Ask the member to paste it.
Say which one you used in the row's Log, for example "Transcript: via the capcut bridge tool [name]", "Transcript: via local tool [name]", or "Transcript: pasted by the member". Do the same for exporting a rendered video: use the bridge's export tool if it has one, and otherwise ask the member to export from CapCut into the row's Exports folder. The capcut tools above build and save a draft, they do not by themselves produce a rendered file.

## What each bridge does
- **capcut:** create a draft, add video, audio, text, subtitles, images, stickers, effects, and keyframes, get a duration, join parts, and save the draft.
- **youtube-manager:** upload a video (with its thumbnail and schedule, as the tool allows), list the connected channels and videos, and add a channel.
- **ghl-social:** create a post (scheduled) on the connected accounts, list posts, and list the social accounts.
Read each tool's description before calling it, and never guess an argument. If the ghl-social bridge is missing and the member's GoHighLevel connector is connected, its social planner create-post operation can schedule posts (describe the operation first).

## If a bridge is missing
Say so in one line and give the manual step, then keep the pipeline moving.
- **capcut missing:** "I can't reach the CapCut bridge, so I can't edit for you. Edit this one in CapCut yourself, drop the finals in the Exports folder, tell me, and I'll continue with the transcript, captions, and cover." If there is no transcript, use the transcript order above.
- **youtube-manager missing:** "I can't reach the YouTube manager. Here is the title, description, chapters, tags, and thumbnail to paste into YouTube Studio when you upload. Tell me when it is scheduled."
- **ghl-social missing:** "I can't reach the scheduler. Here is each post with its time to paste into your scheduler. Tell me when they are scheduled."
Mark the matching checklist item only after the member says it is done. Never claim a bridge did something it did not do.

## Browser steps
Claude's built-in browser handles the steps no tool covers: YouTube Studio end screens and cards, linking a related long-form to a Short, and making an image in ChatGPT (cover option C). Ask the member to sign in if needed. Never enter a password for them.
