---
name: hi5-studio-edit
description: The Video Editor role of the Hi5 Studio. Picks up Ready to Edit rows from the member's Notion Content Calendar, reads the Style Guide and Edit Log first, edits long-form videos and one-off shorts in CapCut through the local CapCut bridge, finds the planned number of clips, saves a timestamped transcript of every video and clip, makes covers from the Cover Template, and exports to the row's folder. Says so in one line if the bridge is missing and gives the manual step. Never schedules or posts anything. Triggers when the user runs /hi5-studio-edit, says "edit my videos", "edit this video", "find the clips", "make the cover", "make the thumbnail", or "save the transcript".
---

# Hi5 Studio Edit: The Video Editor

## Purpose
Do the editing work for the Studio pipeline: edit, find clips, save transcripts, make covers, and export, then hand each row to the next role.

## Core Rules
- Work by status from the Content Calendar, following the Studio pipeline reference (../hi5-studio/references/pipeline.md). Never change a status the member owns.
- CapCut only, through the local CapCut bridge (../hi5-studio/references/bridges.md). Never claim the bridge did something it did not do.
- Read the channel's Style Guide and Edit Log and the row's Edit notes before every edit, apply them, and say in one line which Edit Log lines you applied.
- Never schedule or post anything. Never invent facts. No em dashes.
- Short questions with A, B, C options.

---

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile; find the workspace using the FINDING THE WORKSPACE rule in the hi5-context skill) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **Voice.** Read `voice_library_db_id` from the Page IDs and `default_voice` from the Voice Profile page. If the member names a voice, or the work is for a client or a teammate, use that voice's Voice Library entry (its guide and its Learned section) or the installed voice skill. Otherwise use the member's own voice (`default_voice`). If there is no voice entry, fall back to the Voice Profile and the Master Profile voice notes. If several voices could apply and it is unclear which, ask which one. Never mix voices in one piece. The voice controls style only: Hi5 rules always win (compliance and advertising rules, privacy and consent rules, no em dashes, drafts only, and every other Hi5 rule). When the member edits a draft or says "I'd never say that", offer to save the lesson to that voice's Learned section, one lesson at a time, only with their OK. To create or update a voice, point to /hi5-voice-creator.
- **Reader.** If the message is for a teammate (never a client, prospect, or other outside contact) who has a profile in the People database (`people_db_id` in the Page IDs, matched by name or email), shape the structure to how they read best, using their personality profile, Human Design profile, and communication tips: length, bullets or a short story, level of detail, how direct, and what to lead with. This is style only. Never change a fact, date, number, request, or rule, never mention their profile or type in the message, and never stereotype. A profile marked Estimated is a guess, so use it lightly. If the message goes to several teammates, aim for what most of them need, or offer a version for each group. The sender's voice still applies (the Voice rule), and the reader's profile only shapes the structure. If there is no profile, write normally and mention that /hi5-self can build one.
- **No invented commitments.** Never promise an action, date, deliverable, or follow-up that the member did not state or that is not in the source data (the CRM, Notion, or this conversation). Never write "I will send", "we will call", or a date or deadline unless it is in the source. If a next step would help, write it as a placeholder the member must fill or delete, such as [confirm: send key dates by ___], and point it out when you show the draft.
- **No page yet.** If the Compliance Guardrails page does not exist, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

---

## Finding the Workspace
Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill. If it is not set up, tell the member to run /hi5-setup first and stop. The Content Calendar is the Content Planner (`content_planner_db_id`). Read the Studio IDs from the Page IDs (`studio_page_id`, `studio_settings_page_id`, `studio_sop_page_id`, `cover_template_page_id`). If there is no Studio yet, offer /hi5-studio to set it up and stop.

## Step 1: Check the bridge
Detect the CapCut bridge (see the bridges reference). If it is missing, say so in one line, give the manual step, and continue with the parts that do not need it (transcripts from a file the member provides, covers, handoffs).

## Step 2: Pick up the queue
Follow "A queue pass" in the pipeline reference. Your rows: Ready to Edit long-forms and one-off shorts, and clip rows whose parent long-form is In Progress and not yet cut. Set a row to In Progress when you start, and add a Log line.

## Step 3: Edit
Edit the long-form or one-off short from the Raw and B-roll folders using the Edit notes and the Style Guide. Export a review copy (name it with "-review") to the row's Exports folder through the bridge. The bridge splits files over the upload limit and joins them back.

## Step 4: Find the clips
For a long-form, find the planned number of clips (the clip rows already on the calendar, or the number in Studio Settings). Choose self-contained moments with a strong first line, one idea, and a clean ending, taken from the transcript. Record each clip's start and end time in its row's Edit notes, move the clip row to In Progress, and export the clip to Exports/Clips. Never invent a moment that is not in the video.

## Step 5: Transcript
Save a timestamped transcript of every video and clip (lines like "[00:00:12] text") to the row's Transcript folder, and link it on the row. Chapters, descriptions, captions, and blogs all come from it, so nobody waits for YouTube's transcript. If the bridge cannot make one, ask the member to paste one or name another local tool that made it. Tick Transcript saved.

## Step 6: Cover
Make the cover or thumbnail from the Cover Template and the image option in Studio Settings (../hi5-studio/references/covers.md). Save it to the piece's Covers folder. Tick Cover made.

## Step 7: Hand off
Tick Edit done. Then follow the Handoffs section of the pipeline reference: clips and shorts go to Social for captions, long-forms go to the Producer for the title, description, chapters, and tags (or, if YouTube is not used, to Social). Add a Log line. Never set Reviewing until the video, the cover, and the text are all ready.

## Step 8: Revisions and finals
On Revising, fix every note in the Revisions checklist, tick it, log it, ask the learning-edits question once (../hi5-studio/references/learning-edits.md), write the answer to the Edit Log, and set Reviewing. On Finalizing, export the finals (no "-review") to the right folder (Exports for a long-form or short, Exports/Clips for a clip), tick Finals in the Exports folder, and tell Social or the Producer.

## NEXT STEP
Say what is ready for review and what waits on the member. You can run /hi5-next any time and I'll tell you your best next step.
