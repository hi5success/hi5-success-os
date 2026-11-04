# The Content Dashboard

Used by `SKILL.md` Step 5 when the member picks the Content dashboard. It reads the Content Planner (`content_planner_db_id`) and nothing else. It never reads local bridges (CapCut, YouTube, or social posting tools). Status comes from Notion. It is its own dashboard, built and updated on its own, with only the Notion connector.

## Scan first
Read the Content Planner's properties and the Status options. If the content calendar is set up (Content Settings exists, statuses include Reviewing, Finalizing, and Revising, and the property Needs from member exists), use the statuses below. If it is not, say so once, show what you can do with the member's own statuses, and offer /hi5-content-plan to set up the calendar.

## Sections (each passes "If you saw this, what would you do?")
1. **Posting today.** Rows whose Publish Date is today, with the title, platforms, and status (Scheduled, Optimizing, or any earlier status that is a problem, flagged). Action: open the row.
2. **Scheduled this week.** Rows with Status Scheduled and a Publish Date in the next 7 days, in date order. Action: open the row.
3. **Needs my review.** Rows with Status Reviewing, oldest first. Each shows how long it has waited. Actions: open the row, approve, add a revision note.
4. **Waiting on me.** Rows where Needs from member is not empty, with that text. Action: open the row.
5. **Stuck.** Rows not Published and not Scheduled whose Status Changed date is older than the threshold in the channel's Content SOP (default: 3 days in the same status). Status Changed is a property every content skill sets to today each time it moves a Status, so one query is enough and no row is fetched one at a time. A row with no Status Changed date uses its created time and is labeled "no status date". Never use the last edited time. Action: open the row.
Counts go on the card the Command Center shows ("2 to review, 1 waiting on you").

## Actions (each from a click, each says what it will do)
- **Open the row.** Opens the Notion page.
- **Approve.** Shows "This sets Finalizing", then sets Status to Finalizing, sets Status Changed to today, and adds one Log line to the row's page: the date and time, "Member: approved from the dashboard." Never edit past Log lines. The role that owns the next step picks it up from the status.
- **Add a revision note.** An editable box. On click it adds one checkbox item to the row's Revisions section with the member's text, adds a Log line, and sets Status to Revising (and Status Changed to today) only if the member ticks "send it back now". The role that owns the row reads the note.
- Nothing else writes. No scheduling, no posting, no publishing.

## Rules
- Dates come from the row, and a date shown with a time uses the member's time zone.
- Keep titles and notes as the member wrote them. Never show a row's private notes beyond the section the widget needs.
- An empty section says what it would show ("Nothing waiting on you.").
- Declare only the Notion connector and its query, fetch, and update tools. No other connector.
