# Widget Library

Used by `SKILL.md` Step 4. Offer a widget only when the member's discovery answers call for it, and every widget must lead to an action. Each entry gives the data source, what it shows, and the actions. Data in an app is read from the app. Data with no app lives in a Notion database (see `notion-trackers.md`). Every widget handles its own failure: if its connector fails, show one "Reconnect [app]" message on that widget and keep the rest of the page working.

## CRM summary
- **Data source:** the CRM or GoHighLevel connector. For GoHighLevel, list the sub-accounts first and show one summary per sub-account (a tab or a card each), so a member with several sub-accounts sees them all.
- **Shows:** new leads (created within the window the member chose), active leads (in an open stage), and needs follow-up (no activity for the number of days the member chose). Thresholds come from the member, never from a standard.
- **Actions:** open the record in the CRM; make a task (shown first, then created after the member's OK); a text only after the consent and do-not-contact check (see `email-actions.md` for the gate).
- **Notes:** never show protected-class details or private notes. Show the source and the stage only.

## Email
- **Data source:** the email connector. See `email-actions.md` for the filter, the drafted reply, and the four buttons (Send, Make a task, No reply needed, Spam).
- **Shows:** emails that need a reply, newest need first, with who, the subject, how long it has waited, one line on why it needs a reply, and a drafted reply in the member's voice. Obvious spam and low-priority mail are filtered out.

## Messages (optional)
- **Data source:** the Slack or Google Chat connector, only if the member uses it.
- **Shows:** unread messages that need a reply (direct messages and mentions), with the channel or person and the message.
- **Actions:** reply (one message on click), turn into a task (Notion, and the CRM if connected), and No reply needed (removes it from the dashboard).

## Today
- **Data source:** the calendar connector (and the CRM calendar if connected).
- **Shows:** today's appointments in order, with the time, who, and where or the link, and the next free block.
- **Actions:** open the event; a prep note field the member can fill; add a task.

## Important dates
- **Data source:** deadlines from the CRM, the calendar, or a Notion "Important Dates" tracker (see `notion-trackers.md`). If a date lives in the CRM or the calendar, read it there. If it lives nowhere, the member adds it to the Notion tracker.
- **Shows:** the next dates in order, the item, how many days away, and the action to take for that kind of date (a field in the tracker, written by the member: "call the client", "confirm with the vendor", "send the invoice").
- **Actions:** mark done; snooze; make a task.
- **Notes:** dates come only from the source (the CRM, the calendar, or the document the member entered). Never compute a date from a rule.

## Tasks
- **Data source:** the Tasks database in Notion, and GoHighLevel tasks if connected.
- **Shows:** due today, overdue, and next 7 days, by priority, with the owner.
- **Actions:** mark done; change the due date; add a task (written to the Notion Tasks database, and to GoHighLevel if connected and the member wants it, after showing it).

## Pipeline or deal tracker
- **Data source:** the CRM for stage and value, and a Notion tracker for what the CRM does not hold (the checklist, documents needed, key dates). See `notion-trackers.md`.
- **Shows:** each open deal with its stage, what is missing (from the Notion checklist), and the next step. A board or a list.
- **Actions:** mark a document received; change a checklist status; add a note; make a task. A change to a CRM record is shown first and made only after the member's OK.

## Money snapshot
- **Data source:** the `/hi5-bizplan` and `/hi5-goals` numbers (Business Numbers, Quarterly Goals), a finance connector if connected, or a Notion tracker.
- **Shows:** the quarter's targets against actual (only numbers that exist), cash in this month if a finance tool is connected, and one headline the member chose (for example take-home).
- **Notes:** never show account numbers or full card numbers. Use only the member's own split, cap, and fees. Never fill in a number that is not in the source.

## Marketing snapshot
- **Data source:** the Marketing Hub (content, email sequences, SEO audits, funnels) and the Content Planner.
- **Shows:** counts by Type and Status, the last audit date, what is scheduled, and what is waiting for approval.
- **Actions:** open the row; change a Status (written back to the Marketing Hub).

## Custom tracker
- **Data source:** any Notion database the member asks for (an existing one, or a new one they approved).
- **Shows:** a list, a board grouped by a status field, or counts, as the member chooses.
- **Actions:** add a row, change a status, mark done, all written back to that Notion database.

## Summary cards
- **Data source:** the other widgets and pages.
- **Shows:** one card per page on the Command Center home page, each with the one or two numbers that matter and a link to the full page.
- **Actions:** the card opens its page. A card that has an overdue or urgent item says so in one line.

## Rules for every widget
- Show freshness ("updated 4 minutes ago") from the data's own time stamp, never from the page clock.
- An empty widget says what it would show and what is needed to fill it. It never shows made-up sample data.
- Every action says exactly what it will do before it does it, and a write to the CRM or the mailbox is only from a click.
- No em dashes, and the layout works in one column on a phone.
