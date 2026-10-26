---
name: hi5-studio
description: Sets up and runs the Hi5 Studio content pipeline from the member's Notion Content Calendar. Builds Studio Settings, the Studio SOP, style guides, edit logs, a cover template, the calendar fields, and the folders, then runs the queue by status so each role (content manager, editor, social, YouTube producer, blog writer) follows the calendar. Reads the profile first, asks short A/B/C questions, connects to an existing Studio for a VA or team, and never schedules before Optimizing or posts anything the member has not reviewed. Triggers when the user runs /hi5-studio, says "set up my studio", "content pipeline", "check my queue", "connect to my studio", "what is in my queue", or "run my content calendar".
---

# Hi5 Studio: The Content Pipeline

## Purpose
A simple, status-based content pipeline the member runs from their Notion Content Calendar. One planning session a month with the Content Manager, and after that every role follows the calendar. The member sees short questions and a clear queue, and the complexity stays out of sight.

## Core Rules
- **Skills hold the craft. The member's Notion holds everything about the member** (settings, SOP, style guides, edit logs, the cover template). Never write member-specific details into a skill.
- **Skill vs SOP.** The skills hold only hard rules and craft defaults the member should never have to prompt for. How the member works (when each status moves, who does what, Edit Due, approval habits, clip cadence) lives in the Studio SOP in Notion as editable defaults, and every role reads the SOP and follows it. If the SOP and a skill conflict, the hard rules win and process follows the SOP. See the pipeline reference.
- **Reuse the Content OS skills.** The Content Manager is /hi5-yt-plan, Social is /hi5-social, the Blog Writer is /hi5-blog, the Editor is /hi5-studio-edit, and the YouTube Producer is /hi5-studio-producer.
- **Nothing is scheduled before Optimizing, and nothing posts that the member has not reviewed.** No exceptions.
- **Scan first, then ask.** Read the Master Profile, the Content Profile, the Voice Profile, and any Studio pages first. Ask only what is missing, one short question at a time with A, B, C options.
- **Only build for the channels the member picked.** No rows, folders, or roles for the rest.
- **Detect bridges, never nag.** Follow the bridges reference. Say once in setup that the desktop app must be running. Never ask the member to reconfirm a bridge that works.
- **Never invent.** No made-up numbers, results, claims, or facts. No income or results claims. No em dashes. Run the Fair Housing check on all real estate content.
- **Done-for-you flag.** If the member says they want it done for them, save the flag in Studio Settings as a Hi5 Biz Solutions lead and tell them so in one line. This skill contacts no one.

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

## Step 1: Scan
Read the Master Profile and Content Profile (`channels`, `distribution`, `primary_platform`, `posting_frequency`, `weekly_rhythm`, `recording_schedule`), the Voice Profile, and the Studio pages if they exist. Say in one line what you found.

## Step 2: What do you want to do?
> A) Set up my Studio
> B) Connect to my team's Studio (it already exists)
> C) Check my queue
> D) Change a setting, a channel, or the SOP
If a Studio exists, offer B or C first. If not, offer A.

## Set up my Studio (A)
Follow `references/setup.md`. It creates the Hi5 Studio page, Studio Settings, the Studio SOP, the Content Calendar fields, a Style Guide and an Edit Log for each channel, the Cover Template, and the top-level folders, then detects the bridges and offers the scheduled tasks.

## Connect (B)
Follow the "If a Studio already exists" section of `references/notion-structure.md`. Skip setup, read the settings and the SOP, save the IDs, and ask which role the member is.

## Check my queue (C)
1. Read `references/pipeline.md`. Read the Style Guide and Edit Log for each channel first.
2. Read the Content Calendar and group the rows by who should act: Content Manager, Video Editor, Social Media, YouTube Producer, Blog Writer, and "waiting on you" (Ready to Edit, Reviewing, Revising approval, Needs from member).
3. Show a short summary, for example "Editor: 2 rows. Social: 3. Producer: 1. Waiting on you: 2 to review."
4. Ask which role to act as, or run them in the order the pipeline gives. To act as a role, read that role's skill file and follow its Studio queue steps: /hi5-studio-edit, /hi5-social, /hi5-studio-producer, /hi5-blog, or /hi5-yt-plan for the monthly session.
5. Never change a status the member owns.

## Change something (D)
Edit Studio Settings, add or remove a channel, or update the SOP, showing the change first and writing it after the member's OK. Never remove history.

## Scheduled tasks
Offer the optional role tasks and the daily Published check from `references/tasks.md`. Create them only with the member's OK.

## Learning edits
Follow `references/learning-edits.md` on every revision.

## NEXT STEP
After setup, suggest the first planning session (/hi5-yt-plan). After a queue pass, say what is waiting on the member. You can run /hi5-next any time and I'll tell you your best next step.
