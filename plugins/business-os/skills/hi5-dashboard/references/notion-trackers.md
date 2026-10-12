# Notion as the Database

Used by `SKILL.md` Steps 4, 5, and 7. Notion stores anything the dashboard tracks that does not live in another app. The dashboard reads from it and writes to it.

## The rule
- **Data in an app stays in the app.** If it lives in the CRM, the email, or the calendar, read it from there. Never copy it into Notion just to display it.
- **No app, use Notion.** A transaction checklist and documents needed, important dates the CRM does not hold, goals and KPIs, client onboarding steps, content status, and custom trackers go in a Notion database.
- **Reuse before create.** Before creating anything, check for an existing database that already fits, and use it:
  - Tasks: the Tasks database in the workspace.
  - Content and marketing: the Marketing Hub and the Content Planner.
  - Goals and numbers: the Business Numbers section, the Quarterly Goals page, and the Business Reviews page.
  - Voices: the Voice Library.
  Never create a duplicate of any of these.
- **New databases need the member's OK on the fields first.**

## Creating a new tracker
1. Propose the database: its name, why it exists (which widget and which action), and a field table (Property, Type, Options). Use clear property names a person would understand, a Status select where there is a workflow, a Date for each date, and a checkbox or status for each checklist item.
2. Wait for the member's OK or changes to the fields.
3. Create ONE database under the Hi5 workspace root page with those properties, and no others. Never create a database the member did not approve.
4. If a Notion data source update errors when you add or change select options, use the seed-row workaround: create a row that uses the new option name (Notion adds the option), then trash that row. Say what you did.
5. Record the database ID, its name, and its fields on the Dashboards entry (below). The widget reads and writes this database only.

## Writing from the dashboard
Dashboard actions that create or update tracking (make a task, mark a document received, change a status, add a date) write to the matching Notion database. Each write is one row or one property change from a button click, and the action says what it will do. Never write anything the member did not click.

## The Dashboards database
One row per dashboard (database title "Dashboards", ID in `dashboards_db_id`).

**Properties:** Name (title), Status (Active, Draft, Retired), Version (number), Date (date), Industry (text), Artifact link (url).

**Page body, in this order:**
> Dashboard: {{name}}, version {{N}}, {{date}}. Re-run /hi5-dashboard to update it.

### Pages
The pages, in order, each with one line on its purpose. The first is the Command Center.

### Widgets
One line per widget: the page it is on, its name, and its action buttons.

### Data sources
For each widget, the source (the app, or the Notion database and its ID).

### Connected apps
The connectors the dashboard uses (declared once at build time), and any the member skipped (so a later update can offer them once).

### Notion databases used
Each database by name and ID, whether it already existed or was created for this dashboard, and its fields. This list is what lets the dashboard be rebuilt.

### Follow-Up Queue settings
If the dashboard has a Follow-Up Queue widget: the stale days per group, the pipelines and stages included and skipped, the channel per group, the list length, whether sends are logged as a CRM note (and that the member was told), the freshness approach chosen and why, the scheduled task (what it does and the time of day, if the member approved it), and the Follow-Up Queue database ID and fields. See `follow-up-queue.md`.

### Email button settings
The no-reply action chosen (nothing, add a label, mark as read, or archive), the label name if any, and whether the spam confirm has been given.

### Discovery answers
The first-look list, the slips, the weekly decisions, who uses it, and the dropped items with the reason.

### Version log
One line per version: `Version 1, 2026-10-11, built with N widgets on N pages.` On an update add what changed.

## Updating
Re-running the skill reads the entry and updates it instead of starting over. Bump the Version by 1, set the Date, and keep the log.
