---
name: hi5-yt-plan
description: Run your monthly planning session — review your Ideas, select and approve videos, assign publish dates, and build your Notion Content Calendar.
---

# /hi5-yt-plan — Monthly Planning Session

You are running a monthly planning session. By the end, the member will have
an approved set of videos scheduled in their Notion Content Calendar with
Publish Dates and Edit Due Dates set.

## Step 1 — Read the Master Profile

Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill. If it is not set up, tell the member to run /hi5-setup first and stop. If the member has more than one channel, ask which one first. You need:
- `posting_frequency` and `weekly_rhythm`
- `recording_schedule` and `edit_turnaround_days`
- `content_categories`
- Operator preferences (`output_format`, `number_of_options`)

## Step 2 — Pull the Ideas

Query the Content Planner (`content_planner_db_id`) for all rows where Status = "Idea". For each idea,
retrieve: Title, Hook / Angle, Target Keyword, Content Category, Goal, Trend
Score, Source.

If there are no Ideas, say: "You have no ideas in your Content Planner yet — run /hi5-yt-research first
to generate ideas before planning."

## Step 3 — Present the Ideas

Display the ideas grouped by Content Category, sorted by Trend Score descending
within each group. For each idea show: Title, Hook / Angle, Trend Score, Goal.

Say: "Here are your ideas. Tell me which ones you want to schedule
this month — you can name them, number them, or say 'all of them.'"

## Step 4 — Determine the Publishing Window

Ask: "What date range are we planning for? For example: June 1 through June 30."

Using their posting frequency and weekly content rhythm from the Master Profile,
calculate the available publish dates in that window. For example: if they post
3x per week on Monday, Wednesday, and Friday, list every Monday, Wednesday, and
Friday in the range.

Show the available dates and how many slots that gives them. Say: "You have
[X] publish slots in that window based on your [frequency] schedule. You've
selected [Y] videos. Does that work, or do you want to adjust?"

## Step 5 — Assign Publish Dates

If they have more ideas than slots, ask which to prioritize or defer.
If they have fewer ideas than slots, note the open slots and ask if they want
to run /hi5-yt-research to fill them before scheduling.

Once the lineup is set, present a draft schedule:

| Video Title | Publish Date | Content Category |
|---|---|---|
| [title] | [date] | [category] |

Ask: "Does this schedule look right? Say yes to lock it in, or tell me what
to move."

## Step 6 — Calculate Edit Due Dates

For each scheduled video, calculate Edit Due Date as 7 days before the Publish
Date. Do not use a Notion formula — calculate the date yourself and write it
explicitly.

If the member provided an editing turnaround in their Master Profile, use that
number of days instead of the default 7.

Example: Publish Date = June 16 → Edit Due Date = June 9.

## Step 7 — Write to Notion Content Calendar

Once the member confirms the schedule, update each approved idea row in
the Content Planner (`content_planner_db_id`):
- Status → "Scheduled"
- Publish Date → assigned date
- Edit Due Date → calculated date (7 days before Publish Date, or their
  custom turnaround)

Write each row one at a time and confirm as you go. After all rows are updated:

"Your content calendar is set. Here's the full schedule:"

Display the final schedule as a clean table with Title, Publish Date, Edit Due
Date, and Content Category.

"Run /hi5-yt-script any time you're ready to write a script for one of these videos."
