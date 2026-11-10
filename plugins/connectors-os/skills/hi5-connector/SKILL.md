---
name: hi5-connector
description: Installs, checks, and updates the Hi5 local connectors on a member's Windows computer by conversation, with one installer doing the work. Shows what is installed and any update, asks "Which connector would you like to install?", asks a few plain questions, runs the installer, and tests it. Connectors are the CapCut bridge for editing videos and making transcripts, GHL social posting with media from the computer (token typed into a Windows box, saved encrypted), and the YouTube uploader on the member's own Google project, walked through screen by screen. Never installs by hand, never asks for a token in the chat. Triggers when the user runs /hi5-connector, says "install the CapCut bridge", "connect CapCut", "edit my videos with Claude", "connect GHL social", "connect YouTube", "set up my connectors", "update my connectors", or "is my connector up to date".
---

# Hi5 Connector: Install, Check, and Update Local Connectors

## Purpose
Members edit their videos with Claude Code. Some tools Claude needs run on the member's own computer: the CapCut bridge (so Claude can build CapCut projects), GHL social posting (so Claude can schedule posts with photos and videos from the computer), and the YouTube uploader (so Claude can upload, schedule, and edit videos on the channel the member names). This skill sets them up for a non-technical member in plain words. One installer script does all the work. This skill explains, asks, runs that script, and tests.

## Hard rules
- **Only the installer installs.** Run `hi5-connector.ps1` exactly as shown below. Never run pip, npm, winget, or git yourself, never copy files by hand, and never open or edit Claude's settings files (claude_desktop_config.json or any other). If the installer fails, read its reason to the member in plain words and follow the matching fix in Troubleshooting. Do not improvise another way.
- **Never ask for a token in the chat.** No token, password, or Google client secret ever goes in the chat. The GHL token is typed only into the Windows box the installer opens. If the member pastes a token into the chat anyway, do not use it. Tell them to delete that token in GHL and make a new one, because the chat keeps a copy.
- **Ask before installing other programs.** Python, Node.js, and FFmpeg are installed only after the member says yes.
- **Plain words.** No terminal talk. Say what is happening and what the member will see.
- **Windows only for now.** On a Mac, say: "The Hi5 connectors work on Windows for now. Mac support is coming." Then stop.

## Running the installer
The installer is `install/hi5-connector.ps1` in this plugin. From this skill's base directory it is `../../install/hi5-connector.ps1`. Run it with PowerShell:

```
powershell -NoProfile -ExecutionPolicy Bypass -File "<plugin folder>\install\hi5-connector.ps1" -Action <action> [options]
```

It prints JSON. `result: failed` comes with a `reason` written for the member.

**Give it time.** `install` can take 10 minutes or more on a new computer (it may download Python, Node.js, and FFmpeg), `add-account` waits until the member clicks Save in the token box, and `add-channel` waits until they finish the Google sign-in. Run all three with the longest command timeout your tool allows (10 minutes), or run them in the background and wait for them to finish. Never start a second run while one is still going. `check` is quick.

| Action | What it does |
|---|---|
| `-Action check` | Read only. Shows each connector's state (not installed, up to date, update available, broken), what is new, saved GHL sub-account names (never tokens), and whether Python, Node.js, FFmpeg, and CapCut are ready. |
| `-Action install -Connector capcut` | Installs or updates the CapCut bridge, then makes one test draft (not saved). Add `-InstallMissing` only after the member said yes to installing missing programs. Takes a few minutes. |
| `-Action install -Connector ghl-social` | Installs or updates GHL social posting. Add `-InstallMissing` only after a yes, if Node.js is missing. |
| `-Action add-account -Connector ghl-social -AccountName <name> -LocationId <id>` | Opens a Windows box for the token, checks it with GHL, and saves it encrypted. Run it once per sub-account. |
| `-Action import-accounts` | For members who used the older GHL connector: encrypts the sub-accounts in their old accounts file. |
| `-Action install -Connector youtube` | Installs or updates the YouTube uploader. Needs Node.js (`-InstallMissing` only after a yes). |
| `-Action set-client -ClientFile <path>` | Saves the member's Google client (the JSON file they downloaded), encrypted. |
| `-Action add-channel -ChannelName <name>` | Opens Google sign-in in the browser. The member signs in, picks the channel, and clicks Allow. Saved encrypted under the name they chose. Waits up to 10 minutes. |
| `-Action remove-channel -ChannelName <name>` | Signs that channel out at Google and deletes it from this computer. |

Everything goes into the member's `.hi5-connector` folder in their user folder. Running install again is how updates and repairs happen.

## Step 1: Scan first
Run `-Action check` before asking anything. Then tell the member in two or three lines what you found, for example: "CapCut bridge: not installed. GHL social: installed, up to date, one sub-account (smith-realty). CapCut is installed and has been opened." If any connector says **update available**, read the `whats_new` lines and ask: "Want me to update it now? It takes a few minutes." If it says **broken**, offer to install again to repair it.

## Step 2: The menu
Ask: **"Which connector would you like to install?"**
1. **CapCut bridge.** Claude builds your CapCut projects (clips, text, images, and music) and makes transcripts of your videos on your computer.
2. **GHL social posting.** Claude schedules posts, reels, carousels, and stories in GoHighLevel with photos and videos from your computer.
3. **YouTube uploader.** Claude uploads, schedules, and edits videos and thumbnails on the channel you name, and reads your YouTube Analytics. Uses your own free Google project (about 20 minutes the first time).

Before starting, say once: "You need the Claude desktop app on Windows. It takes about 15 minutes, and at the end you will fully quit Claude and open it again."

## Step 3a: CapCut bridge
1. From the check: if CapCut is not installed, say: "Install CapCut for Windows from capcut.com, open it once, then tell me." If it is installed but never opened, say: "Open CapCut once and close it, then tell me." Stop until they confirm, then run check again.
2. If Python, Node.js, or FFmpeg is missing, name them in plain words ("two free programs the bridge needs: Python and FFmpeg") and ask: "Can I install them for you? Windows may ask you to allow it." Only on a yes, add `-InstallMissing`.
3. Tell the member what they may see: "A Windows box may ask to allow an install, click Yes. If Windows Firewall asks about Python, click Allow for private networks." Then run the install.
4. On success, go to Step 4.

## Step 3b: GHL social posting
1. Run the install for `ghl-social`. If the member used the older GHL connector (the check shows no accounts, but they say they posted with Claude before), offer `-Action import-accounts` instead of adding the sub-account again.
2. Ask for two things, one at a time: the name they will call this sub-account (for example "smith-realty"), and the GHL Location ID. Read `references/ghl-token.md` and walk them through where to find the Location ID and how to make the Private Integration Token, with the exact scopes.
3. Say: "A small Windows box called GHL token will open. Paste your token there and click Save. Don't paste it here in the chat. If you don't see it, look for it on the taskbar at the bottom of the screen." Then run `add-account`. On success, say which GHL business it connected to (`ghl_business`). Repeat for each extra sub-account.
4. Media folders: the result lists the folders Claude may upload from (Documents, Videos, Pictures, Desktop, Downloads, Google Drive, Dropbox, OneDrive). If their content lives somewhere else, run the install again with `-MediaFolder "<folder>"`.

## Step 3c: YouTube uploader
1. Run the install for `youtube` (Node.js only).
2. **Google client.** Ask: "Do you already have a Google client file for YouTube (for example your team gave you one), or do we make your own? Making your own is free and takes about 15 minutes." A team member points to the file their team keeps (for example in the team Drive); skip to step 4. Everyone else makes their own Google Cloud project: follow `references/youtube-google-cloud.md`.
3. **How we do the Google Cloud steps.** Default: one screen at a time, and the member sends a screenshot after each so you can check it before the next. Offer once: "If you like, I can do the clicking in Google Cloud for you in the browser. I cannot sign in, accept Google's terms, or click Allow on consent screens. I'll tell you each time you need to click one of those yourself." Only on a yes, use the browser, and stop at every sign-in, terms, consent, or Allow step and hand it to the member.
4. Run `set-client -ClientFile "<the downloaded JSON file's path>"`. The file is never read into the chat.
5. **Channels.** Ask what to call the channel ("main", "team-listings", or any short name). Say: "A Google sign-in page will open in your browser. Sign in, pick the channel (Google may ask you to choose the account or brand account), and click Allow. If Google says it hasn't verified the app, click Advanced, then Go to (your app name): it's your own app." Then run `add-channel -ChannelName <name>`. On success, say which YouTube channel it connected (`youtube_channel`). Repeat for each channel. There is no default channel: every upload and report names one.
6. If their videos live outside the listed media folders, run the install again with `-MediaFolder "<folder>"`.

## Step 4: Restart and test
Say: "Last step. Fully quit Claude: right-click the Claude icon by the clock (it may be under the ^ arrow) and choose Quit. Then open Claude again and start a new chat." Then give the test to paste into the new chat:
- CapCut: "Make a test CapCut project called Hi5 Test with the words Hello in the middle." Then: "Open CapCut. If CapCut was already open, close it and open it again. You should see Hi5 Test in your projects."
- GHL: "List my GHL social accounts." They should see their sub-account and its connected social accounts. Nothing is posted.
- YouTube: "List my YouTube channels." They should see each channel by the name they chose. Nothing is uploaded. An upload test, only if they want one: a short video as **private** or **unlisted**, which they delete afterwards.

## How the folders work (tell CapCut members once)
- Footage and finished videos live in the project's folder (Google Drive, Dropbox, or Documents).
- The CapCut project itself stays in CapCut's own folder on the computer. Never move CapCut's drafts folder into Google Drive: syncing a project while CapCut has it open can damage it.
- Transcripts: Claude can make a transcript of any video on the computer (the capcut_transcribe tool), free and without uploading it. The install downloads a speech model once (about 500 MB). A long video takes a while, and Claude checks on it.
- When you export in CapCut, pick the project's folder as the export location. If a video lands in Videos, Downloads, or the Desktop, Claude can move it with the capcut_move_export tool. With Google Drive set to stream, the file still has to upload, so leave the computer on for a few minutes after a big video.

## Troubleshooting
| What happened | What to do |
|---|---|
| Claude has no CapCut, GHL, or YouTube tools after the restart | Make sure Claude was fully quit from the icon by the clock, not just closed. Then run check. |
| "CapCut has not been opened yet" | Open CapCut once, close it, then install again. |
| "not installed on this computer yet" in a tool error | Run the install for that connector. |
| A new project doesn't show in CapCut | Close CapCut and open it again. |
| "CapCut already has a project named ..." | Pick a different project name. The bridge never replaces a project the member made. |
| "GHL did not accept that token" | Make a new token in GHL with all the scopes in `references/ghl-token.md`, then add the sub-account again. |
| "That client is a Web application" | In Google Cloud, Clients, create a new client with Application type: Desktop app, download it, and run set-client again. |
| "Access blocked" or the sign-in stops working after a week | The app is still in Testing. In Google Cloud, Audience, click Publish app, then add the channel again. |
| "This channel's sign-in expired" | Run add-channel again with the same name. |
| The channel is not in Google's list | The member must be an Owner or Manager of that channel (or its brand account). |
| "YouTube's daily limit ... is used up" | Try again tomorrow. Each Google project has its own daily limit. |
| The bridge stopped working | It starts by itself when Claude needs it. Its log is `bridge.log` in `.hi5-connector\capcut`. Run install again to repair. |
| Anything else | Run check, then install again. If it still fails, read the reason to the member and suggest asking in the Hi5 Success community. |

## NEXT STEP

Recommend ONE next step. After the CapCut bridge, suggest /hi5-video-edit to edit the next video. After GHL social, suggest /hi5-social to write and schedule posts. After YouTube, suggest /hi5-youtube to write the title and description and schedule the next video.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
