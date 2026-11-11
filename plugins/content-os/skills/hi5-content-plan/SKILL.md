---
name: hi5-content-plan
description: Plans and runs all of a member's content. Sets up the Notion content calendar, builds the monthly plan for long-form videos, one-off reels, statics, carousels, and blogs, researches topics and YouTube keywords, writes scripts and production notes, sets recording days, and creates the rows and folders. Research and scripts also work on their own with no setup. Used by the Content Manager AI employee. Triggers when the user runs /hi5-content-plan, says "plan my month", "plan my content", "content calendar", "what should I post", "research topics", "write a script", "set up my content calendar", "check my queue", "add a brand", or "set this project's brand".
---

# /hi5-content-plan: The Content Manager

## Purpose
One place to plan everything the member publishes. A monthly planning session, research, scripts and production notes, recording days, and the Notion calendar that every other content skill follows by status: /hi5-video-edit, /hi5-social, /hi5-youtube, and /hi5-blog.

## What do you want to do?
> A) Plan my month
> B) Research topics
> C) Write a script
> D) Set up my content calendar
> E) Check my queue
> F) Change a setting or my Content SOP
> G) Add a brand, or set this project's brand
If the member already said what they want ("research topics on first-time buyers", "write a script for this idea"), start it without the menu.

## Works on its own
A one-off request needs no setup and no Notion. Research and scripts work right away from what the member says. Look up the member's Master Profile once (the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md) only to read the voice and compliance pages. If it is not found, or Notion is not connected, carry on with general best practices and return the work on screen. Save to the Content Planner only when the content system is set up (`content_settings_page_id` is in the Page IDs), and show what you will write first. Never tell the member to run setup to get a one-off done. A one-off follows the hard rules below and ends with the Check passed line. Setup runs only when they want the calendar and pipeline.

## Hard rules
- **The skills hold the craft and the hard rules. The member's Notion holds how they work.** Settings, the Content SOP, style guides, edit logs, and the cover template live in Notion. Never write member-specific details into a skill. The Content SOP holds the process (when statuses move, who does what, Edit Due, approval habits). If the SOP and a hard rule conflict, the hard rule wins.
- **Each role is done by Claude, a person, or nobody.** Content Settings says which (the pipeline reference). Plan only for the roles in use. Skipped roles create no rows, folders, or steps.
- **Edit Due is 48 hours before publish, from the SOP.** There is no other date rule.
- **Nothing is scheduled before Optimizing, and nothing posts that the member has not reviewed.** No exceptions. The Content Manager never writes captions and never schedules.
- **Scan first, then ask.** Read the Master Profile, the Content Profile, the Voice Profile, and any content pages first. Ask only what is missing, one short question at a time with A, B, C options.
- **Never invent.** No made-up numbers, results, claims, or facts. No income or results claims. No em dashes. Run the Fair Housing check on all real estate content.
- **Never create a second Content Planner or Master Profile.** The Content Calendar is the existing Content Planner.
- **Bridges are detected, never installed, never nagged.** Follow the bridges reference.
- **Done-for-you flag.** If the member says they want it done for them, save the flag in Content Settings as a Hi5 Biz Solutions lead and tell them so in one line. This skill contacts no one.

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
Before any work on the calendar, read the Content Management SOP (the SOPs database; see `references/sop.md`). If it is still the sample (Status Sample, or a `[fill in` blank), offer once: "Your Content Management SOP is still the sample. Want to set it up now? About 5 minutes." If yes, run the smart interviewer, then set the SOP Active and add a Decisions Log row. If no, use the defaults and offer again next time. Set Status Changed and Role on every status move. A one-off request needs none of this.

- **Brain rules.** Before you save anything to the member's workspace, read `../../references/brain-rules.md`: where a new thing goes, never a second copy, no passwords, and one Decisions Log or AI Memory row for a lasting change or correction.

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
Follow the FINDING THE WORKSPACE rule in references/core.md. For setup, planning, and the queue the workspace is required: if it is not set up, tell the member to run /hi5-setup first and stop. For a one-off (research or a script) it is optional, as described above.

## Step 1: Scan
Read the Master Profile and Content Profile (`channels`, `distribution`, `primary_platform`, `posting_frequency`, `weekly_rhythm`, `recording_schedule`), the Voice Profile, and the content pages if they exist. Say in one line what you found.

## A) Plan my month
Follow `references/plan.md`. If the content calendar is not set up, offer the choice first: A) set it up, then plan, or B) just plan it here on screen.

## B) Research topics
Follow `references/research.md`. Works with no setup.

## C) Write a script
Follow `references/script.md`. Works with no setup.

## D) Set up my content calendar
Run `references/setup.md` only if the Content Profile is missing, then `references/setup-calendar.md`. If a content system already exists, skip setup, read Content Settings and the Content SOP, save the IDs, and ask which role the member is (see "If a content system already exists" in `references/notion-structure.md`).

## E) Check my queue
Works only the Content Manager's rows, oldest first (the plan reference). Then show a one-line summary of what waits on the member and on each other role, from the Content Calendar. Never change a status the member owns.

## F) Change a setting or an SOP ("set up my content SOPs" runs all five)
Edit Content Settings, a role's owner, a brand, or the Content SOP, showing the change first and writing it after the member's OK. Never remove history.

## G) Add a brand, or set this project's brand
Follow `references/brands.md`: "Add a brand" asks the brand name, its YouTube channel, its GHL sub-account and social accounts, creates its brand page, and offers to set this project's brand. "Set this project's brand" adds the line `Hi5 brand: [brand]` to this project's instructions. Adding a brand is only ever this step, never an option in "What brand is this for?".

## Scheduled tasks
Offered in setup, one task per role set to Claude, plus the daily Published check (`references/tasks.md`). Create them only with the member's OK.

## Learning edits
Follow `references/learning-edits.md` on every revision.

## References
`core.md` (finding the workspace, the Master Profile fields), `brands.md` (brands, posting fields, the project brand), `setup.md`, `setup-calendar.md`, `plan.md`, `research.md`, `script.md`, `pipeline.md`, `sop.md`, `notion-structure.md`, `folders.md`, `bridges.md`, `covers.md`, `tasks.md`, `learning-edits.md`.

## NEXT STEP
After setup, suggest the first monthly plan (option A). After a plan, say what to record and when. After a queue pass, say what is waiting on the member. You can run /hi5-next any time and I'll tell you your best next step.
