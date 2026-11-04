# Where Tasks Live

Used by `SKILL.md` (discovery and the plan), `widgets.md`, `email-actions.md`, `email-tasks.md`, and `follow-up-queue.md`. Every task the dashboard makes goes to one place, the member's task home. Never split tasks across two places.

## Ask once, in discovery
"Where do you keep your tasks?"
> A) GoHighLevel B) Asana, ClickUp, Todoist, or another app C) Notion
Skip the question if the Dashboards entry or the scan already answers it. Save the answer on the Dashboards entry as "Task home".

## Scan that tool, then write there
Learn the tool before the plan, with read-only calls, and say in one or two lines what you found:
- **GoHighLevel:** the sub-account's task operations (a task is tied to a contact), its fields (title, body, due date, assignee, contact, status), and who the assignees are.
- **Asana, ClickUp, Todoist, or another app:** its projects or lists, its fields (title, description, due date, assignee, status or section), and which list new tasks should go in. Ask which list once, and save it.
- **Notion:** the Tasks database in the workspace (reuse it, never duplicate it). Its properties are the fields. If there is none, propose one for the member's OK (see `notion-trackers.md`).
Verify the exact tool names and arguments in the session before you build (see `build.md`), and never guess.

## If their tool has no connector
Say once, in one line: "I can't reach [tool] from here, so I'll keep your dashboard tasks in Notion." Use the Notion Tasks database for every task, and note on the Dashboards entry that the member's own tool was skipped, so a later update can offer it once if a connector appears. Do not ask again.

## What a task holds
- A title from the source (an email subject, a contact's name and the stage, a deal), a due date the member picks (or the tool's default, shown first), a link back, and the owner.
- **The link back.** For an email task, the link opens that thread inside the dashboard (the dashboard's address with the thread in the hash), never the mail app. For a CRM contact, the link opens the contact in the CRM. For a content row, the Notion row.
- **A hidden key.** Put a plain key in the task's notes (`source: email thread <id>`) so the same item never makes a second task, and so a task can be found and closed later.

## Rules
- A task is shown first and created only from a click, or by the automatic email to task job the member approved (see `email-tasks.md`). Nothing else makes a task on its own.
- Never write a task to a second place "as a backup".
- Closing a task is a status change in the same tool, never a delete.
- If the tool's write fails, say so in that widget, keep the rest working, and let the member click again. Never retry a write by itself.
