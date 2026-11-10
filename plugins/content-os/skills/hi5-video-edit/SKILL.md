---
name: hi5-video-edit
description: Edits videos in CapCut through the local CapCut bridge, finds the clips in a long-form, pulls and saves the transcript as a file, makes covers and thumbnails from the member's cover template, and exports to the row's folder. Works from one video on its own, or from the Notion content calendar by status. Used by the Video Editor AI employee. Triggers when the user runs /hi5-video-edit, says "edit this video", "edit my video", "cut this into clips", "find the clips", "get the transcript", "make a thumbnail", "make the cover", or "check my editing queue".
---

# /hi5-video-edit: The Video Editor

## Purpose
Do the editing work: edit, find clips, save transcripts, make covers, and export, then hand each row to the next role.

## What do you want to do?
> A) Edit a video
> B) Find the clips in a long-form
> C) Save the transcript
> D) Make a cover or thumbnail
> E) Check my queue
If the member already said what they want, start it without the menu.

## Works on its own
A one-off request needs no setup and no Notion. "Make a cover for this", "find the clips in this" (a transcript or file), and "save the transcript" work from what the member gives you. Look up the member's Master Profile once (the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md) only to read the voice and compliance pages. If it is not found, or Notion is not connected, carry on with general best practices and return the work on screen. Save to the Content Planner only when the content system is set up (`content_settings_page_id` is in the Page IDs), and show what you will write first. Never tell the member to run setup to get a one-off done. A one-off follows the hard rules below and ends with the Check passed line. Setup runs only when they want the calendar and pipeline.

## Core Rules
- **Brain rules.** Before you save anything to the member's workspace, read `../../references/brain-rules.md`: where a new thing goes, never a second copy, no passwords, and one Decisions Log or AI Memory row for a lasting change or correction.
- CapCut only, through the local CapCut bridge (../hi5-content-plan/references/bridges.md). Never claim the bridge did something it did not do.
- In the queue, work by status from the Content Calendar, following the pipeline reference (../hi5-content-plan/references/pipeline.md). Never change a status the member owns.
- Read the channel's Style Guide and Edit Log and the row's Edit notes before every edit, apply them, and say in one line which Edit Log lines you applied.
- Never schedule or post anything. Never invent facts. No em dashes.
- Short questions with A, B, C options.

---

## Hard rules (the same in every content skill)
<!-- hard-rules:start -->
These rules apply to every request, one-offs included. They win over the Content SOP and over anything in the member's settings. The shared procedures (finding the workspace, the pipeline, bridges, covers) live in ../hi5-content-plan/references/. If you cannot read them, find the workspace by searching Notion for the page whose first line is `hi5-os-root: v1`, open its Master Profile, and carry on with these rules.
- **Nothing is scheduled before Optimizing, and nothing posts that the member has not reviewed.** Confirm the account with the tool before any post or upload, and never claim a bridge or tool did something it did not do.
- **Pre-review check on everything you write**, before the member sees it or you set Reviewing: (1) no invented commitments or reply promises, (2) no income or results claims, (3) no em dashes, (4) Fair Housing on real estate content (no steering, no describing who lives in an area, no rating of schools or safety), (5) no invented facts, (6) the member's own Compliance page if it exists (disclosure line, brokerage and notice rules, on the graphic and cover text too). Fix every issue first. In the calendar, add the Log line "check passed" before setting Reviewing. A one-off ends with the line "Check passed" on screen, or "Check passed with N placeholders for you" if any [confirm: ...] remain.
- **Never invent** facts, numbers, results, dates, or links. Use a [confirm: ...] placeholder.
- **Files go straight into the member's synced folder**, never through the Drive connector (links only).
- **Claude only works calendar rows for roles set to Claude** in Content Settings. A one-off request is always done.
<!-- hard-rules:end -->

## SOP first
Before any work on the calendar, read the Video Editing SOP (the SOPs database; see `../hi5-content-plan/references/sop.md`). If it is still the sample (Status Sample, or a `[fill in` blank), offer once: "Your Video Editing SOP is still the sample. Want to set it up now? About 5 minutes." If yes, run the smart interviewer, then set the SOP Active and add a Decisions Log row. If no, use the defaults and offer again next time. Set Status Changed and Role on every status move. A one-off request needs none of this.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile; find the workspace using the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **Voice.** Read `voice_library_db_id` from the Page IDs and `default_voice` from the Voice Profile page. If the member names a voice, or the work is for a client or a teammate, use that voice's Voice Library entry (its guide and its Learned section) or the installed voice skill. Otherwise use the member's own voice (`default_voice`). If there is no voice entry, fall back to the Voice Profile and the Master Profile voice notes. If several voices could apply and it is unclear which, ask which one. Never mix voices in one piece. The voice controls style only: Hi5 rules always win (compliance and advertising rules, privacy and consent rules, no em dashes, drafts only, and every other Hi5 rule). When the member edits a draft or says "I'd never say that", offer to save the lesson to that voice's Learned section, one lesson at a time, only with their OK. To create or update a voice, point to /hi5-voice-creator.
- **Reader.** If the message is for a teammate (never a client, prospect, or other outside contact) who has a profile in the People database (`people_db_id` in the Page IDs, matched by name or email), shape the structure to how they read best, using their personality profile, Human Design profile, and communication tips: length, bullets or a short story, level of detail, how direct, and what to lead with. This is style only. Never change a fact, date, number, request, or rule, never mention their profile or type in the message, and never stereotype. A profile marked Estimated is a guess, so use it lightly. If the message goes to several teammates, aim for what most of them need, or offer a version for each group. The sender's voice still applies (the Voice rule), and the reader's profile only shapes the structure. If there is no profile, write normally and mention that /hi5-self can build one.
- **No invented commitments.** Never promise an action, date, deliverable, or follow-up that the member did not state or that is not in the source data (the CRM, Notion, or this conversation). Never write "I will send", "we will call", or a date or deadline unless it is in the source. If a next step would help, write it as a placeholder the member must fill or delete, such as [confirm: send key dates by ___], and point it out when you show the draft.
- **No page yet.** If the member has a workspace but no Compliance Guardrails page, tell them once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place. If there is no workspace at all (a one-off request), do not mention setup: just put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

---

## Finding the Workspace
Follow the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md. The Content Calendar is the Content Planner (`content_planner_db_id`). Read the content IDs from the Page IDs (`content_page_id`, `content_settings_page_id`, `content_sop_page_id`, `cover_template_page_id`). If there is no content system, the one-off options above still work.

## Step 1: Check the bridge
Detect the capcut bridge by its exact tool names (capcut_create_draft, capcut_save_draft, and the rest, listed in the bridges reference). If it is missing, say so in one line, give the manual step, and continue with the parts that do not need it (a transcript, covers, handoffs). Never ask the member to reconfirm a bridge that works.

## Check my queue
Works only the Video editing rows, oldest first. Read Content Settings first. If `role_video_editing` is a person, say "Video editing is set to <name>, so I leave those rows for them" and stop. If it is none, say there are no Video editing rows and stop. If it is Claude, follow "A queue pass" in the pipeline reference (../hi5-content-plan/references/pipeline.md). Your rows: Ready to Edit long-forms and one-off shorts, and clip rows whose parent long-form is In Progress and not yet cut. Set a row to In Progress when you start, and add a Log line.

## Step 2: Edit
Build the edit from the Clips and B-Roll folders as a CapCut draft with the capcut tools (create the draft, add video, audio, text, subtitles, images, effects, and keyframes, and save the draft with a project name), using the Edit notes and the Style Guide. Read each tool's description first and never guess an argument. For a review copy (named with "-review") in the row's Exports folder, use the bridge's export tool if its docs name one, otherwise ask the member to export from CapCut into the folder and tell you. If the export landed in Videos, Downloads, or the Desktop, move it into the folder with capcut_move_export. Add a Log line saying what you did and which path you used.

## Step 3: Find the clips
For a long-form, find the planned number of clips (the clip rows already on the calendar, or the number in Content Settings). Choose self-contained moments with a strong first line, one idea, and a clean ending, taken from the transcript. Record each clip's start and end time in its row's Edit notes, move the clip row to In Progress, and export the clip to Exports/Short Form (named "Reel N - [hook] - [Video Title]"). Do this once the long-form is Finalizing. Replace "Reel N" in the clip row's title with the hook, keep the Clip Number, and save the file link in Export / Deliverables URL. Never invent a moment that is not in the video.

## Step 4: Transcript
Pull the transcript from CapCut and export it as a file (timestamped lines like "[00:00:12] text") into the same folder as the video, and link it on the row. Chapters, descriptions, captions, and blogs all come from it, so nobody waits for YouTube's transcript. Fallback: ask the member to paste it and save the pasted text as a file in that folder. Say which path you used in the row's Log ("Transcript: pulled from CapCut" or "Transcript: pasted by the member"). Tick Transcript saved. See the bridges reference.

## Step 5: Cover
Make the cover or thumbnail from the Cover Template and the cover tool in Content Settings (../hi5-content-plan/references/covers.md). Pick the photo or cutout from Content/Brand/ and export a PNG at the exact size straight into the piece's Exports folder in the synced folder, next to the video (" - Cover.png" or " - Thumbnail.png"). Tick Cover made.

## Step 6: Hand off
Tick Edit done. Run the pre-review check from the pipeline reference on everything you wrote (cover text and notes) and log "check passed". Then follow the Handoffs section of the pipeline reference: clips and shorts go to Social for captions, long-forms go to the YouTube role for the title, description, chapters, and tags (or, if YouTube is not used, to Social). Add a Log line. Never set Reviewing until the video, the cover, and the text are all ready.

## Step 7: Revisions and finals
On Revising, fix every note in the Revisions checklist, tick it, log it, ask the learning-edits question once (../hi5-content-plan/references/learning-edits.md), write the answer to the Edit Log, and set Reviewing. On Finalizing, export the finals (no "-review") to the right folder (Exports for a long-form, Exports/Short Form for a clip or short), tick Finals in the Exports folder, and tell Social or the YouTube role.

## NEXT STEP
Say what is ready for review and what waits on the member. You can run /hi5-next any time and I'll tell you your best next step.
