# Content Calendar Setup

Used by `SKILL.md` option D, only when the member wants the calendar and pipeline, or asks to set it up. Scan first. Skip any question the profile or an existing content system already answers. One short question at a time, with A, B, C options. Never ask the member to reconfirm what you already know. If the Content Profile is missing, run `setup.md` first (the brand, audience, and voice questions), then continue here.

## Questions (only what is missing)
1. **Where do you post?** A) Instagram B) Facebook C) TikTok D) LinkedIn E) YouTube (optional) F) Other. They can pick several. Read `distribution` and `primary_platform` from the Content Profile first.
2. **Who does each role?** Ask once per role, with A, B, C:
   - **Video editing:** A) Claude (CapCut) B) A person (their name) C) I don't do video
   - **Social media:** A) Claude B) A person (their name) C) Skip
   - **YouTube long-form:** A) Claude B) A person (their name) C) I don't use YouTube
   - **Blog:** A) Claude B) A person (their name) C) Skip
   Save each answer in Content Settings (role_video_editing, role_social, role_youtube, role_blog) as claude, person: <name>, or none, and as `content_roles` in the Master Profile Tools (`Role = Claude`, `Role = <name>`, or `Role = nobody`). If a person does any role, tell the member: "Share your Content Planner in Notion with <name> so they can see their rows and set the next status. I can't share it for you." Skipped roles create no rows, folders, or steps. If the member wants it done for them, save the Hi5 Biz Solutions flag and tell them in one line.
3. **Clips per long-form video?** (only if video editing and social are in use) A) 3 B) 5 (recommended) C) 8 D) Another number. It can be changed per video later.
4. **Working hours?** A) Weekdays, business hours B) Mornings only C) My own hours (ask the days, hours, and time zone).
5. **Where is your synced folder?** Ask for the path once, for the Google Drive, Dropbox, or OneDrive desktop app, or a plain folder on the computer (look for the app's folder first and offer what you find). Save it as `file_storage` in the Master Profile Tools and in Content Settings as synced_folder_path. Every role writes files straight into it.
6. **Where do posts get scheduled?** (only if social is in use) A) The Hi5 scheduler (GoHighLevel) B) Another scheduler (name it) C) I schedule them myself.
7. **Cover tool?** (only if covers are made) A) Claude Design or a Claude artifact (default) B) Canva. Save it in Content Settings as cover_tool. **Cover images?** Say the default (Claude picks an approved photo or cutout from Content/Brand/ and builds the cover from the Cover Template). Ask only if they want a still from the video or new images made in ChatGPT instead.
8. **What's different in how you work?** (open) Use the answer to edit the SOP.
9. **Examples for each channel's Style Guide.** Ask for these, one at a time, with A/B/C where possible, and accept "skip for now":
   - **Edits they like** (pacing, captions on screen, b-roll style): A) paste links B) share files from the synced folder C) describe it. Skip for now.
   - **Social posts and covers they like:** A) paste links B) put images in Content/Brand/Cover examples C) describe it. Skip for now.
   - **Captions that sound like them:** A) paste a few B) point me to where they live (a page or a post) C) use my Voice Profile. Skip for now.
   Save what they give, as links or file names with a one-line note, in each picked channel's Style Guide under "Examples". If they skip, save "examples: skipped" in Content Settings. The first review reminds them once (the pipeline reference).

## What setup creates (in this order, only for the roles and channels in use)
1. The Hi5 Content page under the workspace root.
2. Content Settings, from the answers above.
3. The SOPs: if the workspace has the SOPs database, the five Sample rows are already there, so offer "Want to set up your content SOPs now?" and run `sop.md` for the roles in use (skip roles marked nobody). If there is no SOPs database, write the Content SOP page from the pipeline reference (Skill vs SOP), edited to match answer 8, and offer the SOPs database through the workspace check. The SOP holds the process, so the skills read it and follow it.
4. The Content Calendar changes (append only), following the notion structure reference. This includes the Parent long-form relation, the Parent publish date rollup, and the Clip Publish Date formula if the Content Planner does not have them.
5. A Style Guide (with the examples from question 9) and an Edit Log for each channel picked.
6. The Cover Template page, plus a cover example the member likes if they have one.
7. The top-level folders inside the synced folder (the folders reference), only for the roles in use. Ask the member to drop approved photos and cutouts into Content/Brand/.
8. Save the page IDs in the Master Profile Page IDs.

## Compliance page
Check that the member's Compliance page exists. If it does not, skip the disclosure and brokerage line in the pre-review check and tell the member once: "I could not find your Compliance page, so the pre-review check will skip the disclosure and brokerage lines until it exists." Never hardcode a brokerage or a disclosure.

## Bridges
Setup only detects them by exact tool names (the bridges reference), and only for roles set to Claude. If any are missing, point to the install guide and the install video. Do not install anything and do not write Node, Google Cloud, or API key steps. Say once: "The bridges run in the Claude desktop app, which has to be open for them to work."

## Scheduled tasks
Offer them (the tasks reference): one task per role set to Claude, plus the daily Published check. Only with the member's OK.

## Finish
Tell the member in a few lines what was created, which bridge is missing (if any), who they need to share the Content Planner with (if a person does a role), and the next step: the first monthly plan (option A in /hi5-content-plan).
