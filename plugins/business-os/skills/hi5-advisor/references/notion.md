# Advisory Board: Where Everything Lives in Notion

/hi5-advisor, /hi5-board, and /hi5-library all read this file. Keep them in step with it.

## Finding the member's workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else. Use those IDs directly and do not search again in the same session. If a field this skill needs is missing, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

These skills use three IDs from the Page IDs section:
- `advisory_board_db_id`: the Advisory Board database
- `board_meetings_db_id`: the Board Meetings database
- `coach_library_db_id`: the Coach Library database

## The three databases

**Advisory Board** (one row per advisor; the row's page body is the advisor's brain, see `brain-spec.md`)
- Name (title): the advisor's display name, such as "Listing Strategist" or "Ryan Serhant (simulated)"
- Key (text): lower case with hyphens, unique, such as `listing-strategist` or `ryan-serhant`
- Kind (select): Role, Mentor, Public figure, Master Coach
- Seat (text): the one question this advisor owns, such as "Will this bring in listings?"
- On Board (checkbox): sits at the table by default
- Status (select): Active, Draft, Retired
- Sources (number): how many sources the brain was built from (0 for a role)
- Version (number)
- Date (date): last built or refreshed

**Board Meetings** (one row per meeting; the page body holds the full meeting notes, see `../../hi5-board/references/meeting-notes.md`)
- Name (title): the decision in a few words
- Date (date)
- Call (select): Go, No go, Go with changes, Need more info
- Advisors (text): the names of the advisors who sat
- Follow-up (date): when to check how it turned out
- Outcome (select): Not reviewed, Worked, Mixed, Didn't work, Didn't do it
- Report (url): the link to the detailed report, if one was made

**Coach Library** (one row per saved post; fields are described in `../../hi5-library/SKILL.md`)
- Title (title); Creator (text); Platform (select: Instagram, TikTok, Facebook, YouTube, LinkedIn, X, Podcast, Web); Link (url); Posted (date); Saved (date)
- Use (multi-select: Hook, Content idea, Business advice, Sales pitch, Story); Topics (multi-select); Folder (text)
- Hook, Main point, Lesson, Pitch, Why I liked it (text)
- Status (select: New, Used)

## Safety net

Before the first save in a session, make sure the database you need exists.
1. If its ID is missing or cannot be opened, search under the root page for a database with that exact title. If you find one, save its ID in the Page IDs section and continue.
2. If there is none, say: "Your [Advisory Board / Board Meetings / Coach Library] isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" On a yes, create ONE database with that title inside the root page, with the properties above. Save its ID in the Page IDs section and continue.
3. If they say no, or it cannot be created, do not lose the work. Give the member the result in the chat, say "I couldn't save this to your Notion. Run me again once your workspace is ready and I'll save it," and stop trying to save. Never create a second copy of any of these databases, and never create any other database.
