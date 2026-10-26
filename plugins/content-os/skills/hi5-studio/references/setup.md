# Studio Setup

Used by `SKILL.md` mode A. Scan first. Skip any question the profile or an existing Studio already answers. One short question at a time, with A, B, C options. Never ask the member to reconfirm what you already know.

## Questions (only what is missing)
1. **Where do you post?** A) Instagram B) Facebook C) TikTok D) LinkedIn E) YouTube (optional) F) Other. They can pick several. Read `distribution` and `primary_platform` from the Content Profile first.
2. **Who does the work?** A) Me B) A VA C) My team D) I want it done for me. If D, save the Hi5 Biz Solutions flag and tell the member in one line.
3. **Clips per long-form video?** A) 3 B) 5 (recommended) C) 8 D) Another number. It can be changed per video later.
4. **Working hours?** A) Weekdays, business hours B) Mornings only C) My own hours (ask the days, hours, and time zone).
5. **Where is your synced folder?** Ask for the path once, for the Google Drive, Dropbox, or OneDrive desktop app, or a plain folder on the computer (look for the app's folder first and offer what you find). Save it in Studio Settings as synced_folder_path. Every role writes files straight into it.
6. **Where do posts get scheduled?** A) The Hi5 scheduler (GoHighLevel) B) Another scheduler (name it) C) I schedule them myself.
7. **Cover tool?** A) Claude Design or a Claude artifact (default) B) Canva. Save it in Studio Settings as cover_tool. **Cover images?** Say the default (Claude picks an approved photo or cutout from Content/Brand/ and builds the cover from the Cover Template). Ask only if they want a still from the video or new images made in ChatGPT instead.
8. **What's different in how you work?** (open) Use the answer to edit the SOP.
9. **Examples for each channel's Style Guide.** Ask for these, one at a time, with A/B/C where possible, and accept "skip for now":
   - **Edits they like** (pacing, captions on screen, b-roll style): A) paste links B) share files from the synced folder C) describe it. Skip for now.
   - **Social posts and covers they like:** A) paste links B) put images in Content/Brand/Cover examples C) describe it. Skip for now.
   - **Captions that sound like them:** A) paste a few B) point me to where they live (a page or a post) C) use my Voice Profile. Skip for now.
   Save what they give, as links or file names with a one-line note, in each picked channel's Style Guide under "Examples". If they skip, save "examples: skipped" in Studio Settings. The first review reminds them once (the pipeline reference).

## What setup creates (in this order, only for the channels picked)
1. The Hi5 Studio page under the workspace root.
2. Studio Settings, from the answers above.
3. The Studio SOP: the default pipeline and process lines from the pipeline reference (Skill vs SOP), edited to match answer 8. The SOP holds the process, so the skills read it and follow it.
4. The Content Calendar changes (append only), following the notion structure reference.
5. A Style Guide (with the examples from question 9) and an Edit Log for each channel picked.
6. The Cover Template page, plus a cover example the member likes if they have one.
7. The top-level folders inside the synced folder (the folders reference). Ask the member to drop approved photos and cutouts into Content/Brand/.
8. Save the Studio page IDs in the Master Profile Page IDs.
9. The Content Planner fields for clip dates (the notion structure reference): add the Parent long-form relation, the Parent publish date rollup, and the Clip Publish Date formula if the Content Planner does not have them.

## Compliance page
Check that the member's Compliance page exists. If it does not, skip the disclosure and brokerage line in the pre-review check and tell the member once: "I could not find your Compliance page, so the pre-review check will skip the disclosure and brokerage lines until it exists." Never hardcode a brokerage or a disclosure.

## Bridges
Setup only detects them by exact tool names (the bridges reference). If any are missing, point to the install guide and the install video. Do not install anything and do not write Node, Google Cloud, or API key steps. Say once: "The bridges run in the Claude desktop app, which has to be open for them to work."

## Scheduled tasks
Offer them (the tasks reference), only with the member's OK.

## Finish
Tell the member in a few lines what was created, what bridge is missing (if any), and the next step: the first planning session with /hi5-yt-plan.
