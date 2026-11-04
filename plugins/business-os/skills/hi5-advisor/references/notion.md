# Advisory Board: Where Everything Lives in Notion

/hi5-advisor, /hi5-board, and /hi5-library all read this file. Keep them in step with it.

## Finding the member's workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else. Use those IDs directly and do not search again in the same session. If a field this skill needs is missing, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

## IDs these skills use (Page IDs section)

Each database has two IDs. Save them side by side:
- `advisory_board_db_id` and `advisory_board_ds_id`
- `board_meetings_db_id` and `board_meetings_ds_id`
- `coach_library_db_id` and `coach_library_ds_id`

The `_db_id` opens the database. The `_ds_id` is its data source ID (the `collection://` ID), and it is the one to use for querying rows and for creating rows. When a database is created, its data source ID comes back in the result: save both. If a `_ds_id` is missing (a database made earlier), fetch the database once, read the data source ID from the result, and write it back to the Page IDs section before you go on.

- `compliance_page_id` (added by Stage 2 of /hi5-setup): the member's Compliance Guardrails page. Read it when it exists, wherever the member's compliance rules matter (an Industry Expert's lens, a board meeting).

## Writing to Notion (rules for every save)
- **Column names:** write the Coach Library link column as `Link`. Only a column named exactly url or id needs the `userDefined:` prefix, so `Link` does not.
- **Dollar signs:** write every `$` as `\$` in page content and in text properties. An unescaped `$` can turn into a math block.
- **Dates with time:** write Saved (Coach Library) and Date (Advisory Board) as a date with a time, in the member's time zone (`date:Saved:is_datetime` set to 1). You have no clock tool, so the time is your best estimate and can be a few minutes off.
- **Counting what is new:** never decide what is new from those estimated times alone. Use Notion's own timestamps: a Coach Library row's created time (the `createdTime` column in a query) against the last edited time of the Master Coach page (`page_last_edited_at` in its fetch result). For a declined refresh, use the post count saved with the decline (see Board Updates).
- **New select options:** a row cannot use an option the database does not have. To add one, update the database's column and list every option to keep plus the new one (anything left out is removed).

## The three databases

**Advisory Board** (one row per advisor; the row's page body is the advisor's brain, see `brain-spec.md`)
- Name (title): the advisor's display name, such as "Industry Expert", "Listing Strategist", or "[Creator name] (simulated)"
- Key (text): lower case with hyphens, unique, such as `industry-expert`, `listing-strategist`, or `creator-name`
- Kind (select): Role, Mentor, Public figure, Master Coach
- Seat (text): the one question this advisor owns, such as "Will this bring in more new clients?"
- On Board (checkbox): sits at the table by default
- Status (select): Active, Draft, Retired
- Sources (number): how many sources the brain was built from (0 for a role)
- Version (number)
- Date (date with time): last built or refreshed

**Board Meetings** (one row per meeting; the page body holds the full meeting notes, see `../../hi5-board/references/meeting-notes.md`)
- Name (title): the decision in a few words
- Date (date with time)
- Call (select): Go, No go, Go with changes, Need more info
- Advisors (text): the names of the advisors who sat
- Follow-up (date): when to check how it turned out
- Outcome (select): Not reviewed, Worked, Mixed, Didn't work, Didn't do it
- Report (url): the link to the detailed report, if one was made

**Coach Library** (one row per saved post; fields are described in `../../hi5-library/SKILL.md`)
- Title (title); Creator (text); Platform (select: Instagram, TikTok, Facebook, YouTube, LinkedIn, X, Podcast, Web); Link (url); Posted (date); Saved (date with time)
- Use (multi-select: Hook, Content idea, Business advice, Sales pitch, Story); Topics (multi-select, see below); Folder (text)
- Hook, Main point, Lesson, Pitch, Why I liked it (text)
- Words read (checkbox): checked when the post's words were read or pasted, or when the post has no words at all (visual only). Unchecked when the row is marked "words not read", so the member can find those rows and fix them
- Status (select: New, Used)

## Exact create syntax (use these, so every member's databases match)

Create each database with the Notion database tool, under the root page, with a CREATE TABLE statement. Escape the apostrophe in "Didn't" the way the tool needs.

Advisory Board:
```
CREATE TABLE ("Name" TITLE, "Key" RICH_TEXT, "Kind" SELECT('Role':blue, 'Mentor':green, 'Public figure':purple, 'Master Coach':orange), "Seat" RICH_TEXT, "On Board" CHECKBOX, "Status" SELECT('Active':green, 'Draft':yellow, 'Retired':gray), "Sources" NUMBER, "Version" NUMBER, "Date" DATE)
```

Board Meetings:
```
CREATE TABLE ("Name" TITLE, "Date" DATE, "Call" SELECT('Go':green, 'No go':red, 'Go with changes':yellow, 'Need more info':gray), "Advisors" RICH_TEXT, "Follow-up" DATE, "Outcome" SELECT('Not reviewed':gray, 'Worked':green, 'Mixed':yellow, 'Didn''t work':red, 'Didn''t do it':default), "Report" URL)
```

Coach Library:
```
CREATE TABLE ("Title" TITLE, "Creator" RICH_TEXT, "Platform" SELECT('Instagram':pink, 'TikTok':gray, 'Facebook':blue, 'YouTube':red, 'LinkedIn':blue, 'X':default, 'Podcast':purple, 'Web':green), "Link" URL, "Posted" DATE, "Saved" DATE, "Use" MULTI_SELECT('Hook':orange, 'Content idea':yellow, 'Business advice':green, 'Sales pitch':blue, 'Story':purple), "Topics" MULTI_SELECT('Marketing':blue, 'Sales':green, 'Pricing':yellow, 'Hiring':orange, 'Money':brown, 'Systems':gray, 'Content':pink, 'Mindset':purple, 'Leadership':red, 'Customer service':default, 'Offers':blue, 'Partnerships':green), "Folder" RICH_TEXT, "Hook" RICH_TEXT, "Main point" RICH_TEXT, "Lesson" RICH_TEXT, "Pitch" RICH_TEXT, "Why I liked it" RICH_TEXT, "Words read" CHECKBOX, "Status" SELECT('New':blue, 'Used':green))
```

After creating a database, save its `_db_id` and `_ds_id` (see above). The create result gives the data source ID and the database URL. The database ID is the 32 characters at the end of that URL, written with hyphens as 8-4-4-4-12. Check it by fetching the database before you save it.

## Words read (Coach Library)
A Coach Library made before this column existed will not have it. On first use, add it (`ADD COLUMN "Words read" CHECKBOX` on the data source), then check it on every existing row except the ones whose Main point starts with "Words not read".

## Topics (Coach Library)
- The starting Topics are Marketing, Sales, Pricing, Hiring, Money, Systems, Content, Mindset, Leadership, Customer service, Offers, and Partnerships.
- **On first use** of the library (right after creating it, or the first time it is opened if the industry topics are missing), add topics for the member's industry from the Master Profile (Setup Status `industry`, and `niche`). For real estate add Listings, Buyers, Sellers, and Recruiting. For any other industry add three to five of the industry's own topics, for example Patients, Appointments, and Insurance for a dental office, or Estimates, Seasonal work, and Service agreements for a home services business.
- **Before saving a row with a new Topic**, add that option to the database first (update the Topics column and list every existing option plus the new one), then save the row. Prefer an existing topic when one fits.

## Master Profile entries these skills write
Each goes in its own section of the Master Profile, above the Linked pages heading, never at the end of the page.
- **Library Folders:** one bullet per saved folder: `- platform | folder name | folder URL | last synced <date and time>`. "Sync my folders" opens the URL. If an older bullet has no URL, ask the member for it once and write it in.
- **Board Updates:** one bullet per piece of news about an advisor: `- advisor key | what's new | found <date>`. Add `| declined <date>` to a line the member said no to. A refresh of that advisor clears its lines. Also here: `- master_coach_refresh_declined: <date and time> | <n> posts`, saved when the member declines a Master Coach refresh offer, where n is the number of Business advice, Sales pitch, and Story posts in the library at that moment. If the section does not exist yet, create it above Linked pages.

## Safety net

Before the first read or save in a session, make sure the database you need exists.
1. If its ID is missing or cannot be opened, search under the root page for a database with that exact title. If you find one, save its IDs in the Page IDs section and continue.
2. If there is none, say: "Your [Advisory Board / Board Meetings / Coach Library] isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" On a yes, create ONE database with that title inside the root page, using the exact syntax above. Save its IDs in the Page IDs section and continue.
3. If they say no, or it cannot be created, do not lose the work. Give the member the result in the chat, say "I couldn't save this to your Notion. Run me again once your workspace is ready and I'll save it," and stop trying to save. Never create a second copy of any of these databases, and never create any other database.
