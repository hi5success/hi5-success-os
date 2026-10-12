---
name: hi5-org-chart
description: Builds, shows, and edits the org chart of the member's humans and AI employees from the People and AI Employees databases. Scans the workspace first, then interviews for roles, who reports to whom, and the AI tools or assistants already in use. Every AI employee has exactly one human manager, and each human is shown with their AI team beneath them. Outputs a clean mobile friendly Claude artifact with Notion as the source of truth, edits by chat after the member's OK, and highlights humans with no AI help, overloaded humans, AI employees with no manager or review date, and roles nobody owns. Triggers when the user runs /hi5-org-chart, says "org chart", "who reports to whom", "my team structure", or "add an AI employee to the chart".
---

# Hi5 Org Chart: Humans and AI Employees in One Picture

## Purpose
Show who is on the team, who reports to whom, and which AI employees work for which human, so nobody and nothing is left without an owner. The People and AI Employees databases in Notion are the source of truth. The chart is a picture of them.

## Core Rules
- **Scan first, then ask.** Read the People database, the AI Employees database, the Master Profile, and (if it exists) the Bottlenecks database before asking anything. Say in one or two lines what you found. Ask only about what is missing.
- **Every AI employee has exactly one human manager.** Never zero, never two. If a manager leaves or is retired, every AI employee under them must be given a new manager before the change is saved.
- **Notion is the source of truth.** The chart is rebuilt from the databases. Never keep a fact only in the chart.
- **Nothing changes without the member's OK.** Show every add, move, rename, or retire as a before and after, and write it to Notion only after a yes. Never delete a row. Retire it (Status Former for a person, Retired for an AI employee) so history is kept.
- **The chart shows work, not people's profiles.** Name, role, human or AI, status, and flags only. Never put a personality profile, a Human Design profile, an email address, or private notes on the chart.
- **Highlights are prompts, not judgments.** They point at gaps in the structure. They never rate a person, and never feed a decision about hiring, pay, promotion, or discipline.
- **Never invent.** Never make up a person, a role, a manager, or an AI employee. Use only what the member and the databases give you.
- **Profiles are separate.** If someone has no profile, mention /hi5-self once. Never build profiles here.
- **No em dashes.** Before you send anything, scan your message for em dashes and replace each with a comma, a colon, or a new sentence.
- **Pronouns.** Use the person's name or "they". Never guess a pronoun from a name.

## Finding the Member's Workspace
Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`people_db_id`, `ai_employees_db_id`, `bottlenecks_db_id`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### People and AI Employees safety net
This skill reads and writes the People and AI Employees databases, so make sure both exist before you start.
1. If `people_db_id` or `ai_employees_db_id` is missing, or that database cannot be opened, search under the root page for a database with that exact title. If you find one, save its ID in the Page IDs section and continue.
2. If there is none, say: "Your [name] isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database with that name inside the root page, using the properties in `hi5-setup/templates/workspace-build.md`, and save its ID in Page IDs. People: Name (title); Role (text); Email (email); Reports to (text); Human or AI (select: Human, AI); Personality profile (text); Human Design profile (text); Communication tips (text); Status (select: Active, Waiting for answers, Former); Profile source (select: Own answers, Estimated); Profile date (date). AI Employees: Name (title); Role (text); Human manager (text); Status (select: Draft, Active, Paused, Retired); Review cadence (select: Monthly, Quarterly, Twice a year); Review date (date); Claude Project link (url); Created (date).
3. If they say no, or it cannot be created, give the member the chart as text and say "Run /hi5-setup and it will offer to add the databases, then ask me to save it." Never create a second copy of a database, and never create any other database.

## Step 1: Scan
Read every row of People (Name, Role, Reports to, Human or AI, Status) and AI Employees (Name, Role, Human manager, Status, Review date), the Master Profile (business name, how the member operates, team notes), and the Bottlenecks database if `bottlenecks_db_id` opens. Match "Reports to" and "Human manager" to People names exactly. Say what you found in one or two lines ("I found 4 people and 1 AI employee, and one person has no manager listed"), then choose the path:
> 1. Build my org chart (first time, or the databases are mostly empty)
> 2. Show my org chart
> 3. Change it (add, move, rename, or retire someone)

If the databases are filled in, offer 2 first. If they are empty or have only the member, offer 1.

## Step 2: First run interview (path 1)
Follow `references/interview.md`. A few questions at a time, skipping what the scan answered: who is on the team and what each person does, who reports to whom, the AI tools or assistants already in use and which human owns each, and which jobs nobody owns. Show the rows you would create as a table (People rows and AI Employees rows) and wait for the member's OK before writing anything.

## Step 3: Build the chart
Follow `references/chart-artifact.md`. Build a clean, mobile friendly Claude artifact from the databases, with humans and AI employees visually distinct (by shape and a text tag, never by color alone) and every human shown with their AI team beneath them. Publish it as a private artifact. If artifacts are not available, give the same tree as text and a Notion page under the workspace.

## Step 4: Highlights
Follow `references/highlights.md`. Show four kinds of highlights on the chart and say them again in the chat in plain words: humans with no AI help yet, overloaded humans (from the Bottlenecks data), AI employees with no manager or no review date, and roles nobody owns. After the highlights, offer ONE next step, never a list.

## Step 5: Edits by chat (path 3)
Follow `references/edits.md`. Add, move, rename, and retire, each shown as a before and after, written to Notion after the member's OK, then the chart is republished at the same address.

## AI Operations role (optional, never pushed)
When the team is large enough to need it (see `references/highlights.md`), offer once: "Some teams give one human the job of building and managing the AI employees, often called AI Operations. Want to see how that role would look on your chart?" If they say no, never offer again. If they say yes, add it as a role on a human they choose, with their OK.

## Industry examples
Roles differ by business. Never assume a role list. If the member asks what roles other businesses have, give two or three as suggestions and say they are only examples.

## NEXT STEP
Recommend ONE next step. If an AI employee has no full job description, suggest /hi5-bottleneck to write it and to find what else should be handed off. If a person has no profile, suggest /hi5-self for them. Otherwise suggest running /hi5-bottleneck to find what is slowing the team down.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
