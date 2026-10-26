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
- **Nobody does the role:** no rows, folders, or steps for that role. No video editing means no Long Form, Clip, or Short Form rows and no Raw, B-roll, or Exports/Clips folders. No social media means no Static Post, Carousel, or Clip rows and no caption steps. No YouTube means no YouTube text, upload, or YouTube platform. No blog means no Blog rows.
- A one-off request in a skill ("write captions for this") is always done, whoever does the role in the queue.

## Skill vs SOP
- **Hard rules (these skills, never overridden by the Content SOP):** nothing is scheduled before Optimizing, nothing posts that the member has not reviewed, the pre-review check, no invented facts or commitments, no income or results claims, the member's Compliance page, Fair Housing, no em dashes, confirm the account before posting, files go straight into the synced folder, and the Content Manager never writes captions.
- **Process (the Content SOP in Notion, editable by the member):** when each status moves, who does what, Edit Due, approval habits, and clip cadence. The tables and defaults in this reference are the starting text setup writes into the SOP. After that, roles follow what the SOP says.
- **Default SOP lines to write at setup:** "Edit Due is 48 hours before the publish date." "Clips post daily after the long-form. Change this here if you skip weekends." "Record at least 48 hours before Edit Due, so the editor has time to cut the video, clips, and posts before your review. Everything waits for your approval."
- If the SOP and a hard rule conflict, tell the member in one line which rule won.

## Statuses
| Status | Set by | Who works | What happens |
|---|---|---|---|
| Planned | Content Manager | Content Manager, Social (statics) | Row, folder, and notes exist. The member approved the topic live in the planning session, so there is no approval click. |
| Ready to Edit | The member | Video editing | The member recorded and dropped the files in the row's Raw folder. Videos only. Clips follow their long-form, so only long-forms and one-off shorts get this status. |
| In Progress | The role starting work | Editing, Social, YouTube | Editing, or making a static post or carousel. Captions and long-form title text are drafted here too. |
| Reviewing | The role that finished, after the pre-review check passes | The member | One review of the video or graphic, the cover, and the captions together (plus title and description for a long-form). |
| Revising | The member | The role named in the notes | The member's notes are in the Revisions checklist. The role fixes them and sets Reviewing again. |
| Finalizing | The member (approved) | Editing, Social, YouTube | Final exports go to the row's Exports folder. |
| Optimizing | The role when finals are in the folder | Social or YouTube | The publishing role schedules. Nothing is scheduled before this status. |
| Scheduled | The publishing role | Daily check | Scheduled on every platform in the row's Platforms field. |
| Published | Daily check | Blog | Marked only when the scheduler or bridge confirms it posted. |
Legacy statuses (Idea, Scripted, Draft) from older flows are left alone. Never remove or rename a status. Topic ideas from research are saved as Idea.

## Rows by type (Deliverable Type)
- **Long Form:** Planned, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published. Skip the publishing steps if YouTube is not used.
- **Clip:** one row per planned clip, a child of its long-form (the Parent long-form relation and Related To hold the parent, Clip Number holds the order). Created at Planned. Its publish date comes from the Clip Publish Date formula in the Content Planner, not from the skill. The editor moves each to In Progress as it cuts it from the long-form. No notes needed, the editor finds the clips.
- **Short Form (one-off short or reel):** like a long-form, with its own Raw folder and a script from the Content Manager. Social writes the captions.
- **Static Post and Carousel:** skip Ready to Edit. Social takes a Planned row to In Progress, makes the graphic, and sets Reviewing.
- **Blog:** created by the Blog role when the long-form is Published.

## The page layout of every row
Sections in this order: Script and production notes, Edit notes, Captions, Title and description, YouTube notes, Revisions (a checkbox list), Handoff checklist, Log.
- **Handoff checklist** (checkboxes, only the ones that apply to the type and to the roles in use): Transcript saved, Edit done, Cover made, Captions drafted, Title and description drafted (long-form), Finals in the Exports folder, Scheduled.
- **Log:** one dated line for every action, in the form "2026-10-26 14:05 Editor: set In Progress, started the edit." Never edit past lines. Lines say who acted (Claude or the person's name).

## When a person does the role
The person works in the row's folder and in Notion. Claude picks up from what they leave.
- **Video editing (a person):** they drop the finished export in the row's Exports folder (clips in Exports/Clips) and, if they have one, the transcript as a file in the same folder. They tick Edit done (and Transcript saved if they saved one), and set Reviewing. Claude never edits. If no transcript file is there, Claude writes "Needs from member: the transcript file, or paste it" and skips the text steps for that row.
- **Social media (a person):** they write the captions in the row's Captions section, make the graphics, drop them in the row's Exports folder, tick Captions drafted, and set the next status. At Optimizing they schedule and set Scheduled.
- **YouTube long-form (a person):** they write the title, description, chapters, and tags in the row's Title and description section, tick it, upload and schedule in YouTube, and set Scheduled.
- **Blog (a person):** they write the post in a Blog row and set it ready for review.
- **When a person set Reviewing before Claude's own parts are done** (for example the editor sets Reviewing and Claude writes the captions): Claude picks up Reviewing rows where its own boxes are still open, does its part, runs the pre-review check, and adds the Log line "check passed, ready for your review". The member reviews after that line.

## Who picks up what (queue rules, for roles set to Claude)
- **Content Manager:** the monthly session only. Creates rows, folders, notes, clip rows, and starting statuses, then hands off. Its own queue is rows that need a script or production notes.
- **Video editing:** Ready to Edit rows (long-form, one-off short), and clip rows whose parent long-form is In Progress and not yet cut. When the edit is done, pull the transcript from CapCut and export it as a file into the same folder as the video (if that fails, the member pastes it, and the Log says which path was used), tick Edit done and Transcript saved, make the cover, and hand off (see below).
- **Social media:** clip, short, and one-off short rows where Edit done is ticked and Captions drafted is open, and long-form rows with Transcript saved ticked, a non-YouTube platform, and Captions drafted open. Planned statics and carousels. At Optimizing, clips, shorts, statics, and the non-YouTube platforms of a long-form.
- **YouTube long-form:** long-form rows where Transcript saved is ticked and Title and description drafted is open. At Optimizing, the YouTube upload and schedule.
- **Blog:** Published long-form rows with no blog row yet.

## Who makes the cover
Video editing makes the cover for long-forms, clips, and one-off shorts. Social makes the cover for statics and carousels as part of the graphic. Both follow the covers reference. If a person edits, they drop the cover or thumbnail in the Covers folder with the export. If none is there, the next role set to Claude makes it from the Cover Template (Social for clips and shorts, YouTube for a long-form thumbnail), and if no role is Claude, write Needs from member.

## Where files go
Every role writes files straight into the member's synced folder (Content Settings, synced_folder_path), never through the Drive connector. The connector is only for share links. The CapCut bridge exports into that folder and splits large files, so no role adds export or split steps.

## Dates (defaults from the Content SOP)
- The Content Manager sets the publish date, then the record dates from the member's recording days (see the plan reference). It does not assign one record date per video.
- **Edit Due = 48 hours before the publish date** (the SOP's default, the member can change it). There is no other date rule.
- Record at least 48 hours before Edit Due, so the editor has time to cut the video, clips, and posts before the member's review.
- Clip publish dates come from the Clip Publish Date formula in the Content Planner, daily after the long-form, weekends included. Set only the long-form's publish date, never calculate clip dates, and never make the formula skip days. A member who skips weekends changes the SOP line.
- If a record date leaves less than 48 hours before Edit Due, flag it and offer A) move the publish date, B) record earlier, or C) keep it as a rush.

## Handoffs
1. The editor finishes a long-form: it ticks Edit done and Transcript saved and makes the cover. The YouTube role drafts the title, description, chapters, and tags. If the long-form also goes to non-YouTube platforms, Social writes those captions from the transcript and ticks Captions drafted. When every box for the row is ticked the last role sets Reviewing, so the member reviews the video, cover, title, description, and captions together.
2. The editor finishes a clip or short: it ticks Edit done and Transcript saved, and makes the cover. Social writes the captions, ticks Captions drafted, and sets Reviewing.
3. For a static or carousel, Social does everything and sets Reviewing.
4. A role set to Claude never sets Reviewing until the video or graphic, the cover, and the text are all ready and the pre-review check has passed.

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
1. Read the Content SOP, then the Style Guide and the Edit Log for the row's channel. Follow the SOP for process. Detect the bridges by their exact tool names (the bridges reference).
2. List only the rows for your role, oldest first (earliest publish date first). Skip the role entirely if Content Settings sets it to a person or to nobody, and say so in one line. Say how many rows you found in one line.
3. Work one row at a time. Update the checklist, the Log, and the status as you go.
4. Never block the queue on one row.
5. End with one line: what is done, what waits on the member, and what is next.

## Never
Nothing is scheduled before Optimizing. Nothing posts that the member has not reviewed. Nothing is invented: no numbers, results, claims, or facts the member did not give. No em dashes. No income or results claims. Run the Fair Housing check on all real estate content.
