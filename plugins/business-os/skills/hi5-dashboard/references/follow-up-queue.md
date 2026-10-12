# The Follow-Up Queue Widget

Used by `SKILL.md` (Steps 3, 4, 5, and 7), `widgets.md`, and `build.md`. It shows people in the CRM who need a follow-up or have gone stale, each with a short reason and a recommended text or email ready to send. The member edits the message and sends it from the dashboard. Nothing ever sends automatically, and there is no "Send all" button.

## Settings to collect (add to discovery)
Scan first, then ask only what is missing. Suggest starting points, and the member decides. Say plainly that a suggestion is a starting point to change, not a standard.
1. **What counts as stale,** in days with no contact, for each group the member uses: new leads, active clients, past clients, and sphere (or the member's own group names, such as open quotes or past customers). Suggested starting points the member can change: new leads 3 days, active clients 7, past clients 90, sphere 180.
2. **Which pipelines and stages to include, and which to skip.** Read the CRM first and show what you found, then ask what to leave out (for example lost deals, closed files, do-not-contact lists).
3. **Preferred channel per group:** text or email. Texts are still gated per contact (below).
4. **How many contacts to show at once** (a short list the member can finish, for example 10 to 20), highest priority first.
5. **Logging:** tell the member once, during setup, "When you send from the dashboard, I log the touch as a note in your CRM." Save that they were told. They can turn logging off.
6. **Freshness:** offer the daily scheduled task (see Freshness below) and ask for the time of day.
Save all of this on the Dashboards entry under "Follow-Up Queue settings" (see `notion-trackers.md`): the stale days per group, the included and skipped pipelines and stages, the channel per group, the list length, the logging choice, the scheduled task choice and time, and the Follow-Up Queue database ID.

## How the list is built
Read from the CRM (read only): last contact date, stage, source, open tasks, and the last message. Rank by behavior only:
- time since contact against the group's stale days,
- the stage,
- recent activity (a reply, a form, a showing or appointment request, an open task that is overdue),
- deal value if the member has set one.
Never rank, filter, group, or describe contacts by a protected characteristic or a proxy for one (race, color, religion, sex, disability, familial status, national origin, age, a neighborhood's makeup, or a guess at any of them). Never show those details on the widget. If a note includes one, leave it out.
- **Reuse, do not duplicate.** For real estate members with Real Estate OS installed, follow the ranking signals and the lists in `/hi5-re-daily` (who to call today, who needs attention) and the touch rules in `/hi5-re-sphere` (`references/touch-rules.md`) rather than writing a second version. For everyone else, use the generic rules in this file.
- **One line of reason** for each contact, in plain words from the data, for example "Asked about a showing, no reply in 9 days", "Quote sent 6 days ago, no answer", or "Past client, no contact in 110 days". Never state a reason the data does not show.
- **Groups:** show the queue grouped by the member's groups, with the count in each. Within a group, the oldest need first, then the highest value.
- **Skipped contacts:** never include do-not-disturb, unsubscribed, or "do not contact" people, and never include contacts in skipped stages or pipelines. Say how many were skipped and why, in one line.

## The recommended message
- Written in the member's voice (the voice rule in `SKILL.md`), based on the last conversation and the stage. Short (a text under 40 words, an email under 90), personal, with one clear next step. Never "just checking in". No em dashes.
- Use only facts from the CRM and the last conversation. Never invent a listing, a price, a date, a promise, or a result. Use a [PLACEHOLDER] and say what is missing.
- Follow every other rule that applies (disclosure lines and notices for email, no claims, privacy).
- **Channel and the gate.** Before suggesting a text, run the texting gate in `email-actions.md` ("Texting from the dashboard"): consent from the member's `consent_source` (unknown means no), not do-not-disturb or STOP, and inside 8am to 9pm in the person's time zone. If the text passes, suggest it for groups the member chose text for. Otherwise suggest an email. If neither is allowed (no consent and no usable email, or marked do-not-contact), show "Call or skip" with the reason in one line, and write no draft. A call is the member's own action and needs the member's own scrub confirmation.

## Buttons on each contact
- **Send.** Show the exact text, the channel, and the recipient next to the button, in an editable box. Before enabling Send, check the gate again with a fresh read (consent can change). Clicking Send is the approval for that one message, and it sends only that message. Then log the touch as a note in the CRM (for example "Follow-up sent from the dashboard: [text or email], [date], [one-line summary]"), mark the row Sent, and remove it from the queue.
  - If the send fails, say so, do not send again, and check the conversation first, because a failed call can be an unknown outcome. The member may click Send again.
  - If the send worked but the note failed, say so, and offer to retry only the note, never the message.
- **Snooze.** Hide the contact for 3, 7, or 14 days (the member picks), and bring it back after.
- **Make a task.** Create a follow-up task in the Notion Tasks database (title, a due date the member picks, a link to the contact) and in GoHighLevel too if it is connected and the member wants it, after showing it. Mark the row "Task made".
- **Not now.** Remove it from today's queue only. It can come back tomorrow if it is still stale.
- **Any other CRM change** (a stage move, mark lost, change an owner) is shown first and made only after the member's OK. The logged note is the only CRM write the member has agreed to in advance.
- **Never** a "Send all" button, a bulk send, an overnight or scheduled send, or an automatic send. Never send on a retry. Never send without the member's click on that one message.

## Freshness: which approach to use
Check the artifact runtime contract (`artifact-capabilities`) and this session before you choose, and explain the choice in the plan.
- **Drafting live for the whole list when the dashboard opens (a) is a poor fit.** The runtime's Claude call is memoryless, asks the viewer for consent on first use, is rate limited, and is meant for a click or one stable prompt. One call per contact on every open is slow, hard to keep consistent, and repeated on every open. Reading data from the CRM or Notion is cheap and live through `watchTool`.
- **(b) A daily scheduled task is the default when the member's Claude can run scheduled tasks.** The task builds the queue and drafts and writes them to a Notion "Follow-Up Queue" database. The dashboard reads that database live and shows "Last updated" from the data's own time stamp. Offer it during setup and create it only with the member's OK (use the scheduling feature available in the session, for example Cowork scheduled tasks or a routine, and say which one). Show the schedule and what it does before creating it. Never claim to have scheduled anything you did not.
- **(a-lite) is the fallback when the member skips scheduling or it is not available.** The dashboard reads the CRM live (ranking and reasons), shows the list with reasons, and drafts one message at a time when the member clicks "Draft message" (one `sample` call on a click). It also offers "Refresh queue", which means running /hi5-dashboard again if the runtime cannot read the CRM.
- If the runtime has no live connector access (the snapshot case), the queue is a snapshot with the banner from `build.md`, and Send copies the text for the member to send in the chat.

## The daily scheduled task (prompt to schedule)
Give the scheduler this prompt, with the member's own settings filled in from the Dashboards entry. It must run read only against the CRM and must never send anything.
> Build today's Follow-Up Queue. Read the Follow-Up Queue settings on the Dashboards entry "[dashboard name]" (stale days per group, included and skipped pipelines and stages, channel per group, list length). Read the CRM read only for contacts in the included stages: last contact date, stage, source, open tasks, and the last message. Rank by behavior only (time since contact, stage, recent activity, deal value if set), never by a protected characteristic. For each of the top [N] contacts, write a one-line reason from the data. Run the texting gate for any text (consent from `consent_source`, not do-not-disturb or STOP, 8am to 9pm in their time zone, unknown means no). Draft a short message in the member's voice (the Voice Library entry [skill name], else the Voice Profile) with one next step, using only facts from the CRM, and no em dashes. If neither text nor email is allowed, set the channel to "Call or skip" with the reason and write no draft. Write one row per contact to the Follow-Up Queue database: replace yesterday's rows that are still Open, keep rows that are Snoozed until their date, and keep rows the member marked Sent, Task made, or Not now. Set Updated to now. Never send a message, never change the CRM, never delete a row, and never store phone numbers, emails, or private notes.
When the member runs /hi5-dashboard and chooses "Refresh queue", do the same steps in the chat.

## The Notion "Follow-Up Queue" database (new, only with the member's OK on the fields)
Create it only if the member chose the scheduled task (b), after showing these fields and getting their OK. It is a display and workflow store, so it keeps only what the widget needs, and never the CRM's contact details.

| Property | Type | Notes |
|---|---|---|
| Contact | title | The name as the member uses it |
| CRM link | url | The contact or opportunity in the CRM |
| Group | select | The member's groups (for example New leads, Active clients, Past clients, Sphere) |
| Pipeline | text | |
| Stage | text | |
| Reason | text | One line, from the data |
| Days since contact | number | |
| Last message | text | A one-line summary, not the full text |
| Channel | select | Text, Email, Call or skip |
| Gate result | text | One line, for example "Consent found" or "No consent source, email instead" |
| Draft | text | The recommended message |
| Status | select | Open, Sent, Snoozed, Not now, Task made, Archived |
| Snooze until | date | |
| Priority | number | The order the list was ranked in |
| Updated | date | When the task built it |
- Resolved rows (Sent, Task made, Not now) are marked Archived after 14 days. Never delete a row.
- If a Notion data source update errors when adding select options, use the seed-row workaround (create a row that uses the new option, then trash it).
- Record the database ID on the Dashboards entry under "Notion databases used".

## The widget
- A header with "Last updated [time]" taken from the data's own time stamp, never the page clock, and the count of contacts waiting.
- Groups with counts. Each contact: the name, the group, the reason line, the channel and the gate result in one short line, the editable draft, and the buttons Send, Snooze, Make a task, and Not now. "Call or skip" shows the reason and Snooze, Make a task, and Not now only.
- An empty queue says so ("Nothing is waiting"), and a missing data source says what is needed (the CRM connection, or the scheduled task) with one clear action.
- One failing connector shows one "Reconnect [app]" message on this widget and the rest keeps working.
- One column on a phone, large buttons, no em dashes.

## Never
Never send without a click on that one message, never send in bulk, never rank or filter by a protected characteristic, never change the CRM beyond the logged note without showing it and getting an OK, and never show phone numbers, emails, or private notes on the widget unless the member asked.
