---
name: hi5-bottleneck
description: Finds what is slowing a business owner down and fixes it with the lightest right tool, in this order, simplify the step, an existing Hi5 skill or dashboard widget, platform automation, AI help, an AI employee, or keep it human. Works on one task ("this takes me 5 hours a week") or the whole business, owner only or the whole team. Scans the Master Profile, the personality profile, People, the org chart, connected apps, dashboards, AI employees, and past bottlenecks first, ranks what it finds by hours, pain, and how automatable it is, builds the safe Claude side pieces with the member's OK, gives exact steps for platforms it never touches, and writes AI employee job descriptions. Triggers when the user runs /hi5-bottleneck, says "bottleneck", "this takes too long", "automate this", "AI employee", "I'm stuck on", or "where do I start with AI".
---

# Hi5 Bottleneck: Find What Slows You Down and Fix It

## Purpose
Help any business owner find the few tasks that cost the most time, and fix each with the lightest tool that works: remove the step, use something Hi5 already does, use a platform's own automation, use AI help, or hire an AI employee. It works in any project or conversation, on one task or on the whole business. Fix one thing first, then plan the rest.

## Core Rules
- **Scan first, then ask.** Before asking anything, read what exists (Step 1). Say in one or two lines what you found, and ask only about what is missing or unclear.
- **The lightest fix that works wins.** Use the fix ladder in `references/fix-ladder.md` in order. Never recommend an AI employee for something a skill, a widget, or a platform setting already does.
- **Check Hi5 first.** Before recommending anything new, check the installed Hi5 skills and the dashboard widgets. If one already does the job, point to it and stop. Never rebuild what exists.
- **Estimates are estimates.** Show hours saved as a range, built from the member's own numbers and the steps the fix covers, and label it as an estimate. Never use a standard percentage or a benchmark. Never promise a result.
- **Keep the human parts human.** Work the member loves, work that needs judgment, and work that is about relationships stay with a person, with the reason. Use the member's profile only as a hint for better questions, and let the member decide.
- **Build what is safe, guide the rest.** With the member's OK, build the Claude side pieces (Project instructions as text to paste, skills, scheduled tasks, Notion databases and pages). For GoHighLevel and any other platform, give exact step by step instructions and never change their CRM or platform from this skill.
- **AI employees follow every Hi5 rule.** An AI employee never sends, publishes, spends money, or changes a record without the approvals the Hi5 rules require. Drafts first, one approved send at a time, consent gates, and compliance rules always apply. Every AI employee has exactly one human manager.
- **Nothing is saved without the member's OK.** Show each row, page, or file before you write it. Reuse existing databases before creating one.
- **Never invent.** Never make up hours, tools, or results. If you do not know a number, ask or leave a blank.
- **No em dashes.** Before you send anything, scan your message for em dashes and replace each with a comma, a colon, or a new sentence.
- **Pronouns.** Use the person's name or "they". Never guess a pronoun from a name.
- **Voice.** Anything you draft for the member to send follows the member's voice (the Voice Library entry or their Voice Profile). Job descriptions and instructions are plain working language, not a voice piece.

## Finding the Member's Workspace
Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`people_db_id`, `ai_employees_db_id`, `bottlenecks_db_id`, `dashboards_db_id`, `marketing_hub_db_id`). Use those IDs directly. If a field this skill needs is missing after the scan, ask for it once, save it as a `- field_name: value` bullet in the matching section of the Master Profile (never at the end of the page), and continue.

### Starting from scratch
If there is no marked workspace, or the Master Profile is nearly empty, say: "The quickest way to get a good result is a short setup first: /hi5-setup for the basics, and /hi5-self so I know how you work. I won't repeat those here. Want to do them now and come back? Or I can go on with what you tell me." If they choose setup, hand off to those skills and stop. When they come back, scan again and continue. If they decline, continue with what they give you, save nothing to Notion, and give the results in the chat (offer to save them once the workspace exists).

### Bottlenecks and AI Employees safety net
This skill saves to two databases, so make sure they exist before you save.
1. If `bottlenecks_db_id` or `ai_employees_db_id` is missing, or that database cannot be opened, search under the root page for a database with that exact title. If you find one, save its ID in the Page IDs section and continue.
2. If there is none, say: "Your [name] isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database with that name inside the root page, using the properties in `hi5-setup/templates/workspace-build.md`, and save its ID in Page IDs. Bottlenecks: Task (title); Owner (text); Hours per week (number); Pain (number, 1 to 5); Automatable (number, 1 to 5); Fix type (select: Remove or simplify, Existing Hi5 skill or widget, Platform automation, AI help, AI employee, Keep human); Status (select: Found, Planned, In progress, Fixed, Dropped, Kept human); AI employee (text); Estimated hours saved (text); Actual hours saved (number); Date (date). AI Employees: Name (title); Role (text); Human manager (text); Status (select: Draft, Active, Paused, Retired); Review cadence (select: Monthly, Quarterly, Twice a year); Review date (date); Claude Project link (url); Created (date).
3. If they say no, or it cannot be created, keep the results in the chat and as a downloadable file, and say "Run /hi5-setup and it will offer to add the database, then ask me to save it." Never create a second copy, and never create any other database.

## Step 1: Scan
Read, without asking: the Master Profile (industry, how the member operates, tools, goals, biggest blocker), the Self Profile and the member's People page (how they work, what drains and energizes them), the People database and the org chart link on the member's People page, the connected apps (which connectors you can see this session), the Dashboards database (which dashboards and widgets exist), the AI Employees database, the Bottlenecks database (past findings), and the installed Hi5 skills (read `hi5-next/references/path.md`, the live rows). Say what you found in one or two lines ("I found your profile, 3 people, one dashboard with an email widget, and no bottlenecks saved yet").
If this is a re-run (the Bottlenecks database has rows), go to "Re-running".

## Step 2: Mode
Ask which one:
> 1. One task ("this takes me hours a week")
> 2. A full audit, owner only
> 3. A full audit of the whole team
Do not ask if the member already told you.

## Step 3: Interview
Follow `references/interview.md`. A few questions at a time, skipping what the scan answered: recurring tasks (who does them, hours per week, how often, which tools), what slips or causes errors, what drains and what energizes them, and what they would do with the time back. For a whole team audit, offer the copy-paste set so each person lists their own tasks.

## Step 4: Rank
Follow `references/ranking.md`. Score each bottleneck by hours per week times pain times how automatable it is, show the arithmetic, and show the top 3 to 5 with the reason for each. Tasks that should stay human are listed separately, with the reason.

## Step 5: Recommend the lightest fix
Follow `references/fix-ladder.md`. For each of the top bottlenecks, recommend one fix from the ladder, say why the lighter rungs do not work, and show the estimated hours saved as a range, labeled as an estimate.

## Step 6: Start with one quick win
Pick the single fix that is easiest and saves the most (usually a rung 1 to 4 fix) and build or guide it now, following `references/quick-win.md` and, for platforms, `references/platform-instructions.md`. Then show the plan for the rest, in order, as a short list.

## Step 7: AI employees
When a bottleneck is a role with several recurring duties, follow `references/ai-employees.md` to pick the right build, write the job description, save it to the AI Employees database, and put the employee on the org chart under its human manager.

## Step 8: Save and track
Show the Bottlenecks rows you would save (Task, Owner, Hours per week, Pain, Automatable, Fix type, Status, AI employee, Estimated hours saved, Date) and write them after the member's OK. Offer the next step.

## Re-running
Read the Bottlenecks and AI Employees databases. Show a short table: what got fixed, what is in progress, what is next, and for each fixed one the estimate against what the member says it saved (Actual hours saved), plus whether the estimates held. Be honest if they did not. Update the rows after the member's OK, re-rank what is open, and start the next fix. Ask once whether anything new is slowing them down. Check each AI employee's review date and say which are due.

## Industry examples
If `industries/*.md` fits the member's business (read `industry_flow` in the Setup Status), use it for suggestions only. Never assume a task is a bottleneck because it is on the list. If there is no match, use `industries/generic.md`.

## NEXT STEP
Recommend ONE next step. After the first AI employee is saved, suggest /hi5-org-chart to see it on the chart. After a quick win, suggest the next bottleneck in the plan. If the member has no profile, you can mention /hi5-self as optional, but do not block on it.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
