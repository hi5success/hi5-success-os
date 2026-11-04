# Email to Task, Automatic

Used by `SKILL.md` (Steps 5 and 6), `email-actions.md`, and `build.md`. Every email that needs a reply becomes one task in the member's task home (`tasks.md`), linked to the thread. The task closes when the thread is handled. This job only makes and closes tasks. It never sends, drafts into the mailbox, labels, archives, or deletes anything.

## What becomes a task
The same filter as the email widget (see `email-actions.md`): the latest message is from someone else and needs an answer. Not promotions or social updates, not automated no-reply senders, not newsletters, not receipts, and not the member's always-hide senders. A thread that already has an open task (same thread key) is skipped, never duplicated.

## What the task holds
- Title: the subject, with the sender's name.
- Due: the member's default from setup (for example today, or the next business day), shown in the plan.
- A link that opens the thread inside the dashboard (the dashboard's address with the thread in the hash), never the mail app.
- A note with the key `source: email thread <id>`, and one line on why it needs a reply.
- No message body beyond that one line.

## When the task closes
- **The member replied:** the latest message in the thread is from the member (from the dashboard's Send, or from anywhere else). Read the thread to check.
- **They clicked No reply needed** in the dashboard.
- **A newer message arrives after a close:** a new task opens only if the new message needs a reply.
Closing sets the task's status to done in the same tool. It never deletes the task.

## How it runs (say which in the plan)
Ask once at setup and show the plan before creating anything.
1. **A scheduled task the member approves (preferred).** Offer it when this session can create scheduled tasks. Show the exact prompt and the schedule first (for example every 30 minutes during working hours), and create it only after the member's OK. Say which scheduling feature you used. The prompt reads recent inbox threads (read only), makes tasks for new ones that need a reply, closes tasks for handled threads, writes only to the task home, and reports one line.
2. **On open (when scheduled tasks are not available).** The dashboard runs the same make and close pass when it opens and when the member refreshes. Say plainly that tasks update only when the dashboard is opened.
Either way, record the choice on the Dashboards entry (the Command Center's "Email to task" setting).

## Guard rails
- Read the inbox read only. The only writes are task creates and task closes.
- A cap per pass (for example 20 new tasks) so a first run on a full inbox does not flood the member. Say what was skipped.
- If the task tool fails, say so in one line on the widget and keep the rest working. Never retry a write by itself. Never fall back to a second task place.
- No em dashes in any task text.
