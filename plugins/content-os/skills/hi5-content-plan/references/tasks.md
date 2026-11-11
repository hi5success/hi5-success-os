# Optional Scheduled Tasks

Two ways to run the pipeline: the member says "check my queue", or optional scheduled tasks during working hours. Setup offers the tasks and never forces them. Create a task only with the member's OK, using a scheduling feature that is available in this session (say which one). Show the schedule and the prompt first. Never claim to have scheduled something you did not.

## One hourly task per role set to Claude (during working hours from Content Settings)
Each task prompt: "Read the Content Settings, the SOP for the role (the SOPs database, or the Content SOP page), and the brand's Style Guide and Edit Log. Check the Content Calendar for rows that need the [role]. Do the [role] steps for each, one at a time, in publish-date order. Update the status, the handoff checklist, and the Log. Never schedule before Optimizing. Never post anything the member has not reviewed. Skip any row that needs something from the member and note it. Stop and report one line when done."
- Content Manager: no hourly task (it runs in the monthly session).
- Video editing: Ready to Edit rows and clips of an In Progress long-form.
- Social media: captions, statics, carousels, and scheduling at Optimizing.
- YouTube long-form: title, description, chapters, tags, and the upload and schedule at Optimizing (only if YouTube is used).
- Blog: Published long-forms with no blog draft.

## One daily task: the Published check
"Read the Content Calendar. For each Scheduled row whose publish time has passed, call list_posts (ghl-social) or youtube_list_videos (youtube, naming the channel the row was scheduled on) and check whether it posted. If it confirms, set the row to Published and log it. If it cannot confirm, leave the row Scheduled, add the Log line 'past due, not confirmed', and put it in the report. Never mark a row Published on a guess."

## Rules
- Only roles set to Claude get a task. A role set to a person or to nobody gets none.
- Tasks run only inside the member's working hours.
- A task never changes a status the member owns (Ready to Edit, Revising, Finalizing approval).
- Turning tasks on or off is recorded in Content Settings (scheduled_tasks).
