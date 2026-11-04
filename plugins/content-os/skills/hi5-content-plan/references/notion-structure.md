# What Lives in the Member's Notion

The core rule: skills hold the craft, the member's Notion holds everything about the member. Plugin updates replace skill files, so nothing member-specific is ever written into a skill.

## Hi5 Content page
A page under the workspace root called "Hi5 Content" holds the content system pages below. Save these IDs in the Master Profile Page IDs: `content_page_id`, `content_settings_page_id`, `content_sop_page_id`, `cover_template_page_id`. The Content Calendar is the existing Content Planner (`content_planner_db_id`), so never create a second one.

## Content Settings (one page, a bullet per field)
- platforms_in_use: Instagram, Facebook, TikTok, LinkedIn, YouTube (optional), other
- role_video_editing, role_social, role_youtube, role_blog: claude, person: <name>, or none (who does each role; a role set to none creates no rows, folders, or steps)
- who_does_the_work: me, VA, team, or done-for-you
- done_for_you_lead: yes or no, with the date (a flag for Hi5 Biz Solutions, nobody is contacted by this skill)
- clips_per_long_form: default 5
- working_hours: days, hours, and time zone for scheduled roles
- synced_folder_path: the path to the member's synced folder (the Google Drive, Dropbox, or OneDrive desktop app folder, or a plain local folder). Asked once in setup, and every role writes files straight into it
- scheduler: Hi5 scheduler or GoHighLevel (default), or another named scheduler
- cover_tool: Claude Design or a Claude artifact (default), or Canva
- batch_record_day: the day the member batch records, if any (the default for next month)
- examples: added, or skipped. examples_reminder: done once the member has been reminded after their first review
- cover_image_option: default (Claude picks a photo or cutout from Content/Brand/ and builds the cover from the Cover Template), a still from the video, or a new image made in ChatGPT
- bridges_detected: capcut, youtube-manager, ghl-social (matched by exact tool names), with the date they were last seen working
- youtube_channel: the connected YouTube channel, saved the first time list_youtube_channels confirms it (YouTube members only)
- social_accounts: the connected social accounts per platform, saved the first time list_social_accounts confirms them
- scheduled_tasks: which role tasks the member turned on
- channel pages: one Style Guide page and one Edit Log page per channel (names and IDs)

## SOPs (the SOPs database, `sops_db_id`)
Process lives in the SOPs database: one row per role (Content Management, Video Editing, Social Media Scheduling, YouTube Publishing, Blog Writing), optionally one per channel. The template ships them as Sample rows. Every content skill reads its SOP first and runs the sample setup when the SOP is still Sample (`sop.md`). The older Content SOP page below is used only when the workspace has no SOPs database.

## Content SOP (one page, older workspaces)
The default pipeline from the pipeline reference, written in plain language, edited to match the member's answer to "what's different in how you work?" Keep the statuses and the order. Record the differences as short bullets at the top under "How we work here". The SOP is where the member's process lives, as editable defaults: when each status moves, who does what, Edit Due (48 hours before publish), clip cadence ("Clips post daily after the long-form. Change this here if you skip weekends."), recording guidance, and approval habits. Every role reads it and follows it. Hard rules stay in the skills and win if the SOP conflicts. Anyone who joins (a VA or a team member) reads this page first.

## Content Calendar changes (append only)
Add to the Content Planner. Never rename or remove anything.
- Status options, exactly: Not Started, Brainstorming, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published. Keep every older option the member has.
- New properties: Role (select: Content Manager, Video Editor, Social Media, YouTube Producer, Blog Writer), Channel (select, options created as used), Review Notes (text), Published Links (text, one live link per platform), Status Changed (date, set to today by every skill that moves a Status).
- Primary Platform is no longer part of the template. Never delete it if the member has it.
- Deliverable Type options: Clip, Static Post, Carousel (Long Form, Short Form, and Blog already exist). Short Form is a one-off short.
- Distribution is the Platforms field (multi-select). Add options as used.
- New properties: Clip Number (number), Needs from member (text).
- Clip dates come from the calendar, not from the skill: a relation Parent long-form (to the Content Planner itself, with the reverse Clips), a rollup Parent publish date (the Publish Date of the Parent long-form), and a formula Clip Publish Date (the parent publish date plus the Clip Number in days). Roles set only the long-form's publish date, and the formula sets the clips'. Setup adds these if the Content Planner does not have them (the template has them).
- Record Date, Publish Date (with a time), Related To (the parent long-form title), and Asset Folder URL (the folder link) already exist.
To add options and properties, use the Notion connector's data source update with SQL statements (ALTER COLUMN "Status" SET SELECT(...) listing every existing option to keep plus the new ones, ADD COLUMN ...). Listing every option keeps the old ones, so nothing is removed. If a property cannot be added (the connector refuses), put it as the first line of each row's page ("Clip Number: 2", "Needs from member: ...") and say so once. If adding a select option errors, create a row that uses the new option and then trash it (the seed row workaround).

## Per channel
- **Style Guide** (one page per channel): hook habits, pacing, caption voice and length, hashtag rules, edit style (cuts, captions, music, b-roll), cover style, and things to never do. Start from what the Master Profile and Voice Profile already say, then add the member's answers and an "Examples" section (edits, social posts and covers, and captions they like, as links or file names with a one-line note).
- **Edit Log** (one page per channel): a dated list of every correction (see the learning edits reference).

## Cover Template page
Layout notes (size, text position, fonts, colors, how the face or image is placed, the logo), plus a link to the last cover made, so every cover matches. Update the link whenever a cover is finished.

## Only build for the channels picked
Create Style Guides, Edit Logs, rows, folders, and role steps only for the platforms and roles in use. No YouTube means no YouTube rows or notes. A role set to none creates nothing.

## If a content system already exists
Find "Hi5 Content" under the workspace. If it exists, skip setup, read Content Settings and the SOP, save the IDs in the Master Profile, ask the member which role they are (me, VA, editor, team), and connect. Never recreate pages that exist.
