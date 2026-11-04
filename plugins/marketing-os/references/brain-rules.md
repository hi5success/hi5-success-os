# Brain Rules

Every Hi5 skill that saves anything to the member's workspace reads this file first. The workspace is the member's brain: one place that holds everything true about their business, so any AI or teammate can work without the member re-explaining it. (This file is copied into each plugin so a plugin installed alone still has it. The copies must match.)

## Finding things
- Use the root marker lookup, then the Page IDs in the Master Profile. Never search by title more than once per session.

## Where a new thing goes (decide in this order)
1. **It is one more of something that already has a database.** Add a row. The detail goes in the row's page body. This is the default.
2. **It is a section of an existing page.** Update that field inside its section.
3. **It is a new kind of thing that will repeat.** Ask the member first. Then create ONE database under the root, with a title, an icon, a one-line description, a Status and a Date. Add it to the Brain Index map and to the matching group under "Your Workspace" on the dashboard. Save its ID in Page IDs.
4. **It is a one-off document.** It goes in the Marketing Hub or Business OS, never loose at the root.

## Never
- Create a second copy of anything.
- Rename or delete anything the member made.
- Leave bracketed placeholders.
- Store passwords, card or account numbers, or ID numbers.

## Logging changes
- **Decisions Log.** A business or process change gets one row. Then update the page it changes and name it in "Changes".
- **AI Memory.** A correction or lasting preference gets one row of one or two sentences, with Type, Area, Applies To and Source AI. Check for an Active duplicate first. If a new row replaces an old one, mark the old row Replaced. Facts that have a home elsewhere stay there. The memory row may link to them.
- Never log sensitive personal details about clients.

## Reading order before work
1. Brain Index
2. Master Profile
3. Compliance and Voice, before anything public
4. The SOP for the job
5. Active AI Memory rows for that area

## Industry overlays
Industry files can add sections. Real estate adds the Objection Bank and neighborhood pages. A GHL agency adds a client brain per client. Each overlay adds its pages to the Brain Index map.

## Drive brain (same structure)
A member who keeps the brain in Google Drive instead of Notion uses the same structure: top-level folders `01 Company` to `11 History`, plus `Brain Index.md` at the root. Each page becomes one .md file. Each database becomes a folder with one .md per row (properties as front-matter lines), plus an `index.md` table. Setup in this release builds the Notion brain only.
