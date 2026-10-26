# The Studio Pipeline

Used by every Studio role. The member's Notion Content Calendar (the Content Planner database, `content_planner_db_id`) is the single queue. Status and the handoff checklist on each row tell every role what to do next.

## Statuses
| Status | Set by | Who works | What happens |
|---|---|---|---|
| Planned | Content Manager | Content Manager, Social (statics) | Row, folder, and notes exist. The member approved the topic live in the planning session, so there is no approval click. |
| Ready to Edit | The member | Video Editor | The member recorded and dropped the files in the row's Raw folder. Videos only. Clips follow their long-form, so only long-forms and one-off shorts get this status. |
| In Progress | The role starting work | Video Editor, Social, Producer | Editing, or making a static post or carousel. Captions and long-form title text are drafted here too. |
| Reviewing | The role that finished, after the pre-review check passes | The member | One review of the video or graphic, the cover, and the captions together (plus title and description for a long-form). |
| Revising | The member | The role named in the notes | The member's notes are in the Revisions checklist. The role fixes them and sets Reviewing again. |
| Finalizing | The member (approved) | Editor, Social, Producer | Final exports go to the row's Exports folder. |
| Optimizing | The role when finals are in the folder | Social or Producer | The publishing role schedules. Nothing is scheduled before this status. |
| Scheduled | The publishing role | Daily check | Scheduled on every platform in the row's Platforms field. |
| Published | Daily check | Blog Writer (for long-form) | Marked only when the scheduler or bridge confirms it posted. |
Legacy statuses (Idea, Scripted, Draft) from older flows are left alone. Never remove or rename a status.

## Rows by type (Deliverable Type)
- **Long Form:** Planned, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published. Skipped publishing steps if YouTube is not used.
- **Clip:** one row per planned clip, a child of its long-form (Related To holds the parent title, Clip Number holds the order). Created at Planned, staggered one a day by default. The Editor moves each to In Progress as it cuts it from the long-form. No notes needed, the Editor finds the clips.
- **Short Form (one-off short):** like a long-form, with its own Raw folder and a script from the Content Manager. Social writes the captions.
- **Static Post and Carousel:** skip Ready to Edit. Social takes a Planned row to In Progress, makes the graphic, and sets Reviewing.
- **Blog:** created by the Blog Writer when the long-form is Published.

## The page layout of every row
Sections in this order: Script and production notes, Edit notes, Captions, Title and description, YouTube notes, Revisions (a checkbox list), Handoff checklist, Log.
- **Handoff checklist** (checkboxes, only the ones that apply to the type): Transcript saved, Edit done, Cover made, Captions drafted, Title and description drafted (long-form), Finals in the Exports folder, Scheduled.
- **Log:** one dated line for every action, in the form "2026-10-26 14:05 Editor: set In Progress, started the edit." Never edit past lines.

## Who picks up what (queue rules)
- **Content Manager:** the monthly session only. Creates rows, folders, notes, clip rows, and starting statuses, then hands off.
- **Video Editor:** Ready to Edit rows (long-form, one-off short), and clip rows whose parent long-form is In Progress and not yet cut. When the edit and transcript are done, tick Edit done and Transcript saved, make the cover, and hand off (see below).
- **Social Media:** clip, short, and one-off short rows where Edit done is ticked and Captions drafted is open. Planned statics and carousels. At Optimizing, clips, shorts, statics, and the non-YouTube platforms of a long-form.
- **YouTube Producer:** long-form rows where Transcript saved is ticked and Title and description drafted is open. At Optimizing, the YouTube upload and schedule.
- **Blog Writer:** Published long-form rows with no blog row yet.

## Who makes the cover
The Video Editor makes the cover for long-forms, clips, and one-off shorts. Social makes the cover for statics and carousels as part of the graphic.

## Handoffs
1. The Editor finishes a long-form: it ticks Edit done and Transcript saved and makes the cover. The Producer drafts the title, description, chapters, and tags. When every box for the row is ticked the last role sets Reviewing.
2. The Editor finishes a clip or short: it ticks Edit done and Transcript saved, and makes the cover. Social writes the captions, ticks Captions drafted, and sets Reviewing.
3. For a static or carousel, Social does everything and sets Reviewing.
4. A row is never set to Reviewing until the video or graphic, the cover, and the text are all ready and the pre-review check has passed.

## Pre-review check
Before any role sets Reviewing, it runs this self-check on everything it wrote on the row: captions, titles, descriptions, tags, post text, cover text, and notes the member will read. Fix every issue before the member sees it.
1. **No invented commitments or reply promises.** No "I will send", "comment X and I will reply", "DM me and I'll send it", and no date or action the member did not give. Use a [confirm: ...] placeholder or drop the line.
2. **No income or results claims.** No earnings claims, no promised or implied outcomes, no unsupported numbers.
3. **No em dashes.**
4. **Fair Housing on real estate content.** No steering, no preference or limitation, no describing who lives in an area, no rating of schools or safety, and no wording that points to a protected class. Listing content uses only facts the member gave.
5. **No invented facts.** Nothing the transcript, the notes, or the member did not supply.
6. **The disclosure line** is on public text that needs it.
Then add the Log line "check passed" (add "with N placeholders for the member" if any [confirm: ...] remain), and only then set Reviewing. If something cannot be fixed without the member, leave the placeholder, write it in Needs from member, and say so in the Log.

## Reviewing and revising
- The member reviews in Notion and puts notes in the Revisions checklist, then sets Revising. Each note names what to change.
- The role fixes every item, ticks it, logs it, and sets Reviewing again.
- On any revision, ask the learning-edits question once (see the learning edits reference) and write the answer to the Edit Log right away.

## Needs from the member
If a row needs a photo, screenshot, or answer, write it in the row's Needs from member field (or as the first line of the page if the property is missing), add a Log line, skip the row, and keep working the rest of the queue. When the member clears it, the row returns to the queue.

## A queue pass
1. Read the Style Guide and the Edit Log for the row's channel first. Detect the bridges by their exact tool names (the bridges reference).
2. List the rows for your role in publish-date order. Say how many you found in one line.
3. Work one row at a time. Update the checklist, the Log, and the status as you go.
4. Never block the queue on one row.
5. End with one line: what is done, what waits on the member, and what is next.

## Never
Nothing is scheduled before Optimizing. Nothing posts that the member has not reviewed. Nothing is invented: no numbers, results, claims, or facts the member did not give. No em dashes. No income or results claims. Run the Fair Housing check on all real estate content.
