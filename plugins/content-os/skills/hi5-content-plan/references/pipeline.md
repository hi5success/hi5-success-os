# The Content Pipeline

Used by every role. The member's Notion Content Calendar (the Content Planner database, `content_planner_db_id`) is the single queue. Status and the handoff checklist on each row tell every role what to do next. The pipeline only exists for a member who set up the content calendar. Every skill also works on its own for one-off requests, with no setup and no Notion.

## Roles and who does them
Setup asks once per role who does it: Claude, a person (their name), or nobody. The answers are saved in Content Settings.
| Role | Skill | Rows it works | Setting |
|---|---|---|---|
| Content Manager | /hi5-content-plan | The monthly plan, scripts, production notes, rows, folders. Always Claude with the member | none |
| Video editing | /hi5-video-edit | Long Form, Clip, Short Form | role_video_editing |
| Social media | /hi5-social | Clip, Short Form, Static Post, Carousel, and the non-YouTube platforms of a long-form | role_social |
| YouTube long-form | /hi5-youtube | The YouTube text and upload of a Long Form | role_youtube |
| Blog | /hi5-blog | Blog rows from Published long-forms | role_blog |
- **Claude only works rows for roles set to Claude.** "Check my queue" in a skill lists only that skill's own rows, oldest first.
- **A person does the role:** the row waits for them. They drop the file in the row's folder and set the next status in Notion, and Claude picks up from there. Setup tells the member to share the Content Planner with that person (Claude does not share it). The next status each person sets is in "When a person does the role" below.
- **Nobody does the role:** no rows, folders, or steps for that role. No video editing means no Long Form or Short Form rows and no Clips, B-Roll, or Exports folders. No social media means no Static Post, Carousel, or Clip rows and no caption steps. No YouTube means no YouTube text, upload, or YouTube platform. No blog means no Blog rows.
- A one-off request in a skill ("write captions for this") is always done, whoever does the role in the queue.

## Skill vs SOP
Every role reads its SOP first (`sop.md`) and falls back to the defaults here only when a field is missing.
- **Hard rules (these skills, never overridden by an SOP):** nothing is scheduled before Optimizing, nothing posts that the member has not reviewed, the pre-review check, no invented facts or commitments, no income or results claims, the member's Compliance page, Fair Housing, no em dashes, confirm the account before posting, files go straight into the synced folder, folders are never renamed, and the Content Manager never writes captions.
- **Process (the SOP, editable by the member):** the clip count, folders and naming, Edit Due, script style, posting days and times, who does each step, edit likes and dislikes, and the stuck threshold. The tables and defaults in this reference are the fallback text.
- **Default lines:** "Edit Due is 48 hours before the publish date." "Clips post daily after the long-form. Change this here if you skip weekends." "Record at least 48 hours before Edit Due, so the editor has time to cut the video, clips, and posts before your review. Everything waits for your approval."
- If an SOP and a hard rule conflict, tell the member in one line which rule won.

## Every status move
- Set **Status Changed** to today every time you move a Status. This is how the dashboard finds stuck rows. A row is stuck when Status Changed is older than the SOP's threshold (default 3 days in the same status), excluding Scheduled and Published.
- Set **Role** to the role that owns the next step (Content Manager, Video Editor, Social Media, YouTube Producer, Blog Writer).
- Feedback can come to the Content Manager or the editor, and it lands in **Review Notes** either way.
- Write **Published Links** (one live link per platform) only when the scheduler or bridge confirms a post, at Published.
- Add a Log line for the move.
- Use the status names exactly: Not Started, Brainstorming, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published. Older workspaces may still have Idea, Planned, Scripted, or Draft: treat Idea and Planned as Brainstorming, leave the member's options alone, and never remove or rename one.

## Statuses
| Status | Set by | Role that works it | What happens |
|---|---|---|---|
| Brainstorming | Content Manager | Content Manager | The row, folder, and notes exist, and the script is being planned and written. The member approved the topic live in the planning session, so there is no approval click. |
| Not Started | Content Manager | Content Manager | The script is ready and the video is not recorded yet. A clip row stays Not Started until its long-form is Finalizing. |
| Ready to Edit | The member, or a scheduled task that sees footage in Clips | Video Editor | The member says "it is recorded", or the files are in the Clips folder. Role becomes Video Editor. Long-forms and one-off shorts only. |
| In Progress | The role starting work | Editor, Social, YouTube | Editing, or making a static post or carousel. |
| Reviewing | The role that finished, after the pre-review check passes | The member | The Content Manager notifies the member and updates the dashboard. One review of the video or graphic, the cover, and the text together. |
| Revising | The member | The role named in Review Notes | The feedback is in Review Notes (and the Revisions checklist). The role fixes it and sets Reviewing again. |
| Finalizing | The member (approved) | Editor, Social, YouTube | Approved. Final exports go to the row's Exports folder. For a long-form, the editor cuts the clips now. |
| Optimizing | The role when finals are in the folder | Social or YouTube Producer | A long-form is Optimizing when it and all its clips are approved. The YouTube Producer prepares the title, description, chapters, and thumbnail. Social writes the clip captions and gets approval. Nothing is scheduled before this status. |
| Scheduled | The publishing role | Daily check | In the scheduler on every platform in the row, or copy and paste if the member has no scheduler. |
| Published | Daily check | Blog | Marked only when the scheduler or bridge confirms it posted. Published Links are saved. |

## Rows by type (Deliverable Type)
- **Long Form:** Deliverable Type Long Form, Role Content Manager, Status Brainstorming. Then Not Started, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published. Skip the publishing steps if YouTube is not used.
- **Clip rows (the long-form plus its clips).** Create them right away with the video row, in the number the SOP says (default 5). Reel 1 is always the intro hook, and Reels 2 to 5 are the best moments. Titles: "Reel 1 - Intro Hook - [Video Title]", then "Reel 2 - [Video Title]", and so on. Each clip row: Clip Number 1 to 5, Deliverable Type Short Form, Content Type Repurpose, Role Video Editor, Status Not Started, the Parent long-form relation set to the video, and the same Channel as the video. The relation is Parent long-form on the clip and Clips on the video. Clip publish dates come from the Clip Publish Date formula, not from the skill. The editor replaces "Reel N" in the title with the hook and keeps the Clip Number. Each clip's file goes in Export / Deliverables URL.
- **Blog, newsletter, or carousel from the video:** a child row of the video with no Clip Number.
- **Short-form made from scratch (a one-off short or reel):** no parent. Like a long-form, with a script from the Content Manager. Social writes the captions.
- **Static Post and Carousel:** skip Ready to Edit. Content Manager plans (Brainstorming, then Not Started), Social takes it to In Progress, makes the graphic, and sets Reviewing.
- **Blog:** created by the Blog role when the long-form is Published, or on request.
- **Clips follow the long-form:** Not Started until the parent is Finalizing, then the same loop (In Progress, Reviewing, Revising, Finalizing). At Optimizing Social writes captions and gets approval. Scheduled in the scheduler (or copy and paste), then Published with the links saved.

## The page layout of every row
Sections in this order: Script and production notes, Edit notes, Captions, Title and description, YouTube notes, Revisions (a checkbox list), Handoff checklist, Log.
- **Handoff checklist** (checkboxes, only the ones that apply to the type and to the roles in use): Transcript saved, Edit done, Cover made, Captions drafted, Title and description drafted (long-form), Finals in the Exports folder, Scheduled.
- **Log:** one dated line for every action, in the form "2026-10-26 14:05 Editor: set In Progress, started the edit." Never edit past lines. Lines say who acted (Claude or the person's name).

## When a person does the role
The person works in the row's folder and in Notion. Claude picks up from what they leave.
- **Video editing (a person):** they drop the finished export in the row's Exports folder (short-form files in Exports/Short Form) and, if they have one, the transcript as a file in the same folder. They tick Edit done (and Transcript saved if they saved one), and set Reviewing. Claude never edits. If no transcript file is there, Claude writes "Needs from member: the transcript file, or paste it" and skips the text steps for that row.
- **Social media (a person):** they write the captions in the row's Captions section, make the graphics, drop them in the row's Exports folder, tick Captions drafted, and set the next status. At Optimizing they schedule and set Scheduled.
- **YouTube long-form (a person):** they write the title, description, chapters, and tags in the row's Title and description section, tick it, upload and schedule in YouTube, and set Scheduled.
- **Blog (a person):** they write the post in a Blog row and set it ready for review.
- **When a person set Reviewing before Claude's own parts are done** (for example the editor sets Reviewing and Claude writes the captions): Claude picks up Reviewing rows where its own boxes are still open, does its part, runs the pre-review check, and adds the Log line "check passed, ready for your review". The member reviews after that line.

## Who picks up what (queue rules, for roles set to Claude)
- **Content Manager:** the monthly session only. Creates rows, folders, notes, clip rows, and starting statuses, then hands off. Its own queue is rows that need a script or production notes.
- **Video editing:** Ready to Edit rows (long-form, one-off short), and clip rows whose parent long-form is Finalizing and not yet cut. When the edit is done, pull the transcript from CapCut and export it as a file into the same folder as the video (if that fails, the member pastes it, and the Log says which path was used), tick Edit done and Transcript saved, make the cover, and hand off (see below).
- **Social media:** clip, short, and one-off short rows where Edit done is ticked and Captions drafted is open, and long-form rows with Transcript saved ticked, a non-YouTube platform, and Captions drafted open. Not Started statics and carousels (script ready). At Optimizing, clips, shorts, statics, and the non-YouTube platforms of a long-form.
- **YouTube long-form:** long-form rows where Transcript saved is ticked and Title and description drafted is open. At Optimizing, the YouTube upload and schedule.
- **Blog:** Published long-form rows with no blog row yet.

## Who makes the cover
Video editing makes the cover for long-forms, clips, and one-off shorts. Social makes the cover for statics and carousels as part of the graphic. Both follow the covers reference. If a person edits, they drop the cover or thumbnail in the Exports folder with the export, named like the file with " - Cover.png". If none is there, the next role set to Claude makes it from the Cover Template (Social for clips and shorts, YouTube for a long-form thumbnail), and if no role is Claude, write Needs from member.

## Where files go
Every role writes files straight into the member's synced folder (`file_storage` in the Master Profile Tools, or Content Settings `synced_folder_path`), never through the Drive connector. The folder layout is in the folders reference, and a folder is never renamed after it is created. The connector is only for share links. The CapCut bridge exports into that folder and splits large files, so no role adds export or split steps.

## Dates (defaults from the Content SOP)
- The Content Manager sets the publish date, then the record dates from the member's recording days (see the plan reference). It does not assign one record date per video.
- **Edit Due = 48 hours before the publish date** (the SOP's default, the member can change it). There is no other date rule.
- Record at least 48 hours before Edit Due, so the editor has time to cut the video, clips, and posts before the member's review.
- Clip publish dates come from the Clip Publish Date formula in the Content Planner, daily after the long-form, weekends included. Set only the long-form's publish date, never calculate clip dates, and never make the formula skip days. A member who skips weekends changes the SOP line.
- If a record date leaves less than 48 hours before Edit Due, flag it and offer A) move the publish date, B) record earlier, or C) keep it as a rush.

## Handoffs
1. The editor finishes a long-form: it ticks Edit done and Transcript saved, makes the cover, and sets Reviewing (after the pre-review check). The Content Manager tells the member it is ready.
2. On approval (Finalizing) the editor exports the finals and cuts the clips from the transcript. Each clip goes through the same loop as a short-form row.
3. When the long-form and all its clips are approved, the long-form moves to Optimizing. The YouTube Producer drafts the title, description, chapters, and tags, and Social writes the captions for the clips and any non-YouTube platform. Each goes to the member for approval.
4. For a static or carousel, Social does everything and sets Reviewing.
5. A role set to Claude never sets Reviewing until the video or graphic, the cover, and the text are all ready and the pre-review check has passed.

## Pre-review check
Before any role sets Reviewing, it runs this self-check on everything it wrote on the row: captions, titles, descriptions, tags, post text, cover text, and notes the member will read. Fix every issue before the member sees it.
1. **No invented commitments or reply promises.** No "I will send", "comment X and I will reply", "DM me and I'll send it", and no date or action the member did not give. Use a [confirm: ...] placeholder or drop the line.
2. **No income or results claims.** No earnings claims, no promised or implied outcomes, no unsupported numbers.
3. **No em dashes.**
4. **Fair Housing on real estate content.** No steering, no preference or limitation, no describing who lives in an area, no rating of schools or safety, and no wording that points to a protected class. Listing content uses only facts the member gave.
5. **No invented facts.** Nothing the transcript, the notes, or the member did not supply.
6. **The member's own Compliance page.** Read it and apply whatever disclosure and brokerage lines it lists, to captions, descriptions, graphics, and cover text (check the graphic itself, not only the caption). Never hardcode a brokerage or a disclosure into a skill. If the page does not exist, skip this line (setup already told the member once).
Then add the Log line "check passed" (add "with N placeholders for the member" if any [confirm: ...] remain), and only then set Reviewing. If something cannot be fixed without the member, leave the placeholder, write it in Needs from member, and say so in the Log.

## Reviewing and revising
- After the member's first review, if the Style Guide has no examples (the member skipped them in setup), remind them once: "You can add examples of edits, posts, covers, and captions you like to the Style Guide any time, and I will match them." Note in Content Settings (examples_reminder: done) so it is never repeated.
- The member reviews in Notion and puts notes in the Revisions checklist, then sets Revising. Each note names what to change.
- The role fixes every item, ticks it, logs it, and sets Reviewing again.
- On any revision, ask the learning-edits question once (see the learning edits reference) and write the answer to the Edit Log right away.

## Needs from the member
If a row needs a photo, screenshot, or answer, write it in the row's Needs from member field (or as the first line of the page if the property is missing), add a Log line, skip the row, and keep working the rest of the queue. When the member clears it, the row returns to the queue.

## A queue pass
1. Read the SOP for your role (`sop.md`, with the sample check), then the Style Guide and the Edit Log for the row's channel. Follow the SOP for process. Detect the bridges by their exact tool names (the bridges reference).
2. List only the rows for your role, oldest first (earliest publish date first). Skip the role entirely if Content Settings sets it to a person or to nobody, and say so in one line. Say how many rows you found in one line.
3. Work one row at a time. Update the checklist, the Log, and the status as you go.
4. Never block the queue on one row.
5. End with one line: what is done, what waits on the member, and what is next.

## Never
Nothing is scheduled before Optimizing. Nothing posts that the member has not reviewed. Nothing is invented: no numbers, results, claims, or facts the member did not give. No em dashes. No income or results claims. Run the Fair Housing check on all real estate content.
