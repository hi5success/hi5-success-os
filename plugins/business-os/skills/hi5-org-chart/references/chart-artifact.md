# The Org Chart Artifact

Used by `SKILL.md` Step 3. Build a clean, private Claude artifact from the databases. Load the Artifact tool's page rules (the artifact-design guidance) before writing the page, and follow them for the title, theming, layout, and phone width.

## Data
Read every row of People (Status Active or Waiting for answers, plus Former only if the member asks to see them) and AI Employees (Status Draft, Active, or Paused, plus Retired only if asked). Build one list of nodes: id, name, role, type (human or AI), manager (the "Reports to" or "Human manager" name), status, review date (AI only), and flags (from `highlights.md`). Embed it in the page as data and render from it. Never put emails, profiles, or private notes in the data.

## Layout
- A vertical tree as nested lists with CSS connector lines. It works at phone width (one column, each level indented) and on a wide screen (the tree spreads out). No horizontal page scroll.
- Top level: the humans who report to no one. Under each human: the humans who report to them, then an "AI team" group with their AI employees.
- Each box: the name, the role in smaller text, and a tag. Humans have a solid border and the tag "Human". AI employees have a dashed border and the tag "AI". The distinction is shape and text, never color alone.
- A "Needs attention" strip at the top with a count and a short line for each highlight kind (see `highlights.md`), and a small badge on each affected box (for example "No review date", "No manager", "No AI help yet").
- Unowned roles appear in a separate box labeled "Roles nobody owns" under the tree.
- A footer line: "As of [today's date]. Built from your People and AI Employees databases in Notion. Ask Claude to change it with /hi5-org-chart."
- Define colors as tokens for light and dark mode, give the body an explicit background, and keep tap targets large. No em dashes anywhere on the page.

## Publishing
- Publish as a private artifact with no capabilities and no connector access. The page is a snapshot, so it shows its "As of" date.
- Tell the member that the page lists names and roles, so they should think before sharing it, and that you did not share it.
- On every later change, write to Notion first, then republish the same file to the same address so the link stays the same. Save the link on the member's own People page under Notes ("Org chart: [link], last updated [date]") after the member's OK.
- If artifacts are not available, give the tree as indented text with the same tags and flags, and offer to save it as a page under the workspace.
