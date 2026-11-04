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

## GoHighLevel: finding the contact
A GoHighLevel task is tied to a contact, so find one before you write the task.
1. Search the sub-account by the sender's email first, then by phone. Exact matches only. A thread that comes "via" a group or list address shows only that address, so skip the email search for it (it would match nothing real), and search by a phone number in the signature or the sender's name instead.
2. If there is no contact, ask the member once: "[Name] is not a contact in GoHighLevel. A) Create the contact (I will show the name and email first, and create it only on your OK) B) Attach the task to a contact you pick C) Make it a Notion task instead."
3. In a scheduled or unattended run, choose C, make the Notion task, and flag it in the run summary so the member can move it. Never create a contact without an OK.
Option C puts a task in Notion for that one item. Say so, and note that the task home is still GoHighLevel (this is the only allowed exception, and the member chose it).

## Listing tasks
Before the build, use `search_operations` and `describe_operation` to look for a real task search or list operation in the member's tool. GoHighLevel normally has one (a location task search, `task-search`, and a per-contact task list), so look first and use it when it exists: the Tasks widget then shows every task, including ones made outside Claude, and needs no extra line. Only if no such operation exists, the Tasks widget lists the tasks this plugin made: the Notion Tasks database, plus the GoHighLevel tasks the plugin created. Save each GoHighLevel task's link in the Notes of its Notion row, so the widget can find it. In that fallback only, say once on the widget: "Tasks made in GoHighLevel outside Claude don't show here yet." Never claim a full list you cannot get.

## The Notion Tasks database ID
When Notion is the task home, find the Tasks database by `tasks_db_id` in the Master Profile Page IDs, then by the title "Tasks" under the workspace root. Whoever creates a Tasks database writes its ID to `tasks_db_id` in the Page IDs section right away, and also records it on the Dashboards entry.

## A connector that is not signed in
If the member's tool has a connector but it is not authorized in this session, say once: "[App] is connected but not signed in. Open Settings, then Connectors, and reconnect it. Want me to use Notion for now?" Do not retry the call. Do not put the data in a second place unless the member says yes. If the profile's own `tasks` line names that app, leave it as it is when Notion is used "for now". If the Notion Tasks database exists under the root but `tasks_db_id` is not saved, find it by the title "Tasks", save the ID, and say nothing technical. This is different from a tool with no connector (above).

## What a task holds
- A title from the source (an email subject, a contact's name and the stage, a deal), a due date the member picks (or the tool's default, shown first), a link back, and the owner.
- **The link back.** For an email task, the link opens that thread inside the dashboard (the dashboard's address with the thread in the hash), never the mail app. For a CRM contact, the link opens the contact in the CRM. For a content row, the Notion row.
- **A hidden key.** Put a plain key in the task's notes (`source: email thread <id>`) so the same item never makes a second task, and so a task can be found and closed later.

## Rules
- A task is shown first and created only from a click, or by the automatic email to task job the member approved (see `email-tasks.md`). Nothing else makes a task on its own.
- Never write a task to a second place "as a backup".
- Closing a task is a status change in the same tool, never a delete.
- If the tool's write fails, say so in that widget, keep the rest working, and let the member click again. Never retry a write by itself.
