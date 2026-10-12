# Edits by Chat

Used by `SKILL.md` Step 5. The databases are the source of truth, so every edit is a change to a row. Never delete a row.

## For every edit
1. Say what you understood in one line.
2. Show a before and after for each row that changes (a small table: field, before, after).
3. Check the rules below. If a rule is broken, say which and offer the way to fix it.
4. Wait for the member's OK. Write to Notion only after a yes.
5. After writing, read the row back to confirm. Then republish the chart to the same address and say what changed.

## Add
- **A person:** a new People row (Name, Role, Reports to, Human or AI = Human, Status Active, Profile date blank). Mention /hi5-self if they have no profile.
- **An AI employee:** a new AI Employees row (Name, Role, Human manager, Status Draft, Created today). The human manager must be a person in People, exactly one. Say that the full job description comes from /hi5-bottleneck.
- **A role nobody owns:** add it to the "Roles nobody owns" list on the member's own People page under Notes.

## Move
- **A person:** change Reports to. Check that this does not make a loop (nobody reports, directly or through others, to themselves).
- **An AI employee:** change its Human manager. It still has exactly one.
- If the member says an AI employee should report to two people, say each AI employee has exactly one human manager, and ask which one. The other person can be listed as a user of it in its job description.

## Rename
Change the Name (or the Role). When a person's name changes, also update every Reports to and every Human manager that used the old name, and show those rows in the same before and after.

## Retire
- **A person:** set Status to Former. Before saving, list every person who reports to them and every AI employee they manage, and ask who takes each one. Do not save until every one has a new manager.
- **An AI employee:** set Status to Retired. Say that anything it ran (a scheduled task, a Claude Project) is not turned off by this change, and list what to turn off by hand. Never claim it was turned off.
- Retired and Former rows stay in the database and are hidden on the chart unless the member asks to see them.
