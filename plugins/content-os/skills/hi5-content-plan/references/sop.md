# SOPs: How Each Role Works

Used by every content skill, before any work. The member's SOPs (the SOPs database, `sops_db_id`) hold how each role works for each channel. The skill holds the hard rules and the defaults. The SOP holds the member's choices. Plugin updates replace skill files but never the member's SOPs.

## Which SOP
One row per role: Content Management (/hi5-content-plan), Video Editing (/hi5-video-edit), Social Media Scheduling (/hi5-social), YouTube Publishing (/hi5-youtube), Blog Writing (/hi5-blog). A channel can have its own row (the Channel property). Read the channel's row first, then the role's general row. If there is no SOPs database (an older workspace), use the Content SOP page (`content_sop_page_id`) and offer the SOPs database once through the workspace check. If a SOP field is missing, use the default in the pipeline reference.

## What the SOP holds, and what the skill holds
- **The SOP holds:** the clip count, folders and naming, Edit Due timing, script style, posting days and times, who does each step, edit likes and dislikes, and the stuck threshold (days in the same status, default 3).
- **The skill holds:** the hard rules (nothing scheduled before Optimizing, nothing posts unreviewed, files only in the synced folder, never rename folders), plus the default layout, naming, and status flow as fallbacks.
- If the SOP and a hard rule conflict, the hard rule wins. Say which in one line.
- **How the SOP changes:** the member tells Claude. Claude shows the change, updates the SOP (bump Version, set Last Reviewed to today), and adds a Decisions Log row (Decision, Date, Area "Content", Why, Decided By, Changes, Status Active).

## Sample detection (every content skill, before work)
1. Read the SOP for the role.
2. If its Status is Sample, or its body contains `[fill in`, say: "Your [Video Editing] SOP is still the sample. Want to set it up now? About 5 minutes."
   - **Yes:** run the interview below, fill every blank, and adjust steps that do not fit. Then set Status Active, Version 1, Last Reviewed today, remove "(Sample)" from the title, and add a Decisions Log row. Save learnings in AI Memory (one or two sentences, after checking for an Active duplicate).
   - **No:** do the task with the defaults, and offer the setup again next time. Do not ask twice in one session.
3. "Set up my content SOPs" runs all five, one after another, skipping roles marked nobody.
4. Never delete Sample rows. An unused role's row can be set to Retired.

## The smart interviewer
Assume the member has never written a process.
- One question at a time, in plain words, with A/B/C options and a recommended pick.
- Explain why a choice matters.
- Suggest the most efficient, highest-impact option for their goal, and name the time it costs.
- When an answer is vague, offer a default.
- Read the brain first (Master Profile, Content Settings, Style Guides) and never ask what it already holds.
- Log the choices in the SOP and the learnings in AI Memory. A real learning is a preference or correction that applies beyond this one SOP (for example "never use stock music"). Choices that only fill the SOP's own blanks stay in the SOP and the Decisions Log row, not in AI Memory.
- If the brain has no channel yet (an empty Master Profile), set the SOP's Channel to "All channels" and say so. If Decided By is unknown, use "Member".
- When the SOP says who does a step, also set the matching role in Content Settings (`role_video_editing`, `role_social`, `role_youtube`, `role_blog`) and `content_roles` in the Master Profile, after showing the change, so the SOP and the settings never disagree. If Content Settings does not exist yet, offer the calendar setup once.
