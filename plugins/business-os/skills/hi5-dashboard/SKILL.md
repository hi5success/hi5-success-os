---
name: hi5-dashboard
description: Builds a live dashboard for any business by first finding out what the member needs to see and act on, then building widgets to serve those answers. Scans the Master Profile, the personality profile, the connectors available in the session, and the Dashboards database first and never re-asks what is known. Helps connect the apps they already use (email, calendar, CRM or GoHighLevel, tasks, chat, finance) with step by step help, interviews a few questions at a time, plans pages and widgets with a data source for each, and builds a Claude artifact with live connector data where it is supported, or a snapshot with a clear refresh path. Uses Notion as the database for anything not stored in another app, with the member's OK on the fields first. Includes email actions (send one reply on click, make a task, no reply needed, spam), a CRM summary, today, important dates, tasks, a pipeline tracker, a money snapshot, a marketing snapshot, and custom trackers. Saves each dashboard to a Dashboards database so it can be rebuilt or updated. Works for every industry. Triggers when the user runs /hi5-dashboard, says "build me a dashboard", "command center", "what should I see every morning", "dashboard for my business", or "update my dashboard".
---

# Hi5 Dashboard: See What Matters and Act On It

## Purpose
Build a dashboard the member opens many times a day, made from their real answers to "what do you check first, what slips through, and what would you do if you saw it?" Discovery comes first, and widgets serve the answers. It works for any industry, with presets as suggestions only.

## Core Rules
- **Discovery before widgets.** Never start from a list of widgets. Every item on the dashboard must pass one test: "If you saw this, what would you do?" Drop anything that leads to no action.
- **Scan first, then ask.** Before asking anything, read the Master Profile (industry, business, brand, languages, tools), the `/hi5-self` profile, the Dashboards database (every entry's name, version, and pages), existing Notion trackers and the Hi5 databases, and which connectors you can see in this session (email, calendar, CRM or GoHighLevel and how many sub-accounts, Notion, Slack, Google Chat, finance tools). Say in one or two lines what you found, for example "I can see Gmail, Google Calendar, and GoHighLevel with 3 sub-accounts, and a Tasks database. Slack is not connected." Ask only about what is missing. Never re-ask anything already known.
- **Read from the app, store the rest in Notion.** Data that lives in an app (CRM, email, calendar) is read from that app. Never copy it into Notion just to display it. For anything that has no app (a transaction checklist, important dates the CRM does not hold, goals, onboarding steps, content status, custom trackers), use a Notion database. Reuse an existing Hi5 database (Tasks, the Marketing Hub, goals, the Voice Library) before creating a new one, and never duplicate one. A new Notion database needs the member's OK on the fields first. See `references/notion-trackers.md`.
- **No Send all, ever.** No widget has a bulk send, an overnight send, a scheduled send, or an automatic send. Every message goes out only when the member clicks send on that one message.
- **Nothing sends unless the member clicks.** Clicking send on one message is the approval for that one message. Check texting consent and do-not-contact status before any text. Never change a CRM record without showing the change and getting an OK. A mailbox action (label, mark as read, archive, spam) happens only from the member's button click, using the setting they chose.
- **Never ask about a connector again and again.** Declare every connector the dashboard needs once, at build time. Opening or refreshing reads data without asking. Only when a connector fails (expired or disconnected) show one "Reconnect [app]" message on that widget while the rest keeps working. See `references/build.md`.
- **No sensitive data the member did not ask for.** Do not show or store account numbers, full card numbers, health details, or private notes unless the member asked for that widget. Keep client details to what the member's job needs.
- **Voice.** Drafted replies use the member's voice. Read `voice_library_db_id` from the Page IDs and `default_voice` from the Voice Profile page. If the member names a voice, or the work is for a client or teammate, use that voice's Voice Library entry. Otherwise use the member's own voice, then the Voice Profile and Master Profile voice notes. If several voices could apply, ask which one. Never mix voices in one piece. The voice controls style only, and Hi5 rules always win (compliance, privacy and consent rules, no em dashes, drafts only, and every other Hi5 rule).
- **Mobile friendly.** The dashboard works on a phone: one column, large tap targets, no horizontal scroll.
- Never use em dashes in anything you say or write, or in the dashboard. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`dashboards_db_id`, `voice_library_db_id`, `marketing_hub_db_id`, `content_planner_db_id`, `business_plan_page_id`, `quarterly_goals_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Dashboards safety net
This skill saves to the Dashboards database, so make sure it exists before you start.
1. If `dashboards_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Dashboards". If you find one, save its ID as `dashboards_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Dashboards database isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Dashboards" inside the root page with these properties: Name (title); Status (select: Active, Draft, Retired); Version (number); Date (date); Industry (text); Artifact link (url). Save its ID as `dashboards_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the plan and the build in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Dashboards database, then ask me to save it," and stop trying to save. Never create a second Dashboards database, and never create any other database without the member's OK on its fields.

## Step 1: Scan

Read what is listed in the Core Rules. If the Dashboards database has an entry for this member, say so and offer to update it instead of starting over (Step 8). Otherwise go to Step 2.

## Step 2: Connect the apps they already use

Follow `references/connectors.md`. Ask which apps they use day to day (email, calendar, CRM, tasks, chat, finance). For any app they use that is not connected and has a Claude connector, recommend connecting it and say in one line what it would add to the dashboard. Guide them step by step with hedged wording ("look for Connectors in Settings") and ask for a screenshot if they get stuck, because menus vary. Never push an app they do not use. After they connect one, confirm it with one read-only test, then continue. If they skip a connector, plan around it (a Notion tracker or a paste option) and offer it once more later, never repeatedly.

## Step 3: Discovery interview

Follow `references/discovery.md`. A few questions at a time, skipping what the scan answered, and filter every item with "If you saw this, what would you do?" If the member wants follow-ups (people who need a reply or have gone stale), add the Follow-Up Queue questions from `references/follow-up-queue.md` (what counts as stale per group, which pipelines and stages, the channel per group, and the logging heads-up).

## Step 4: Plan

Show a plan and wait for the member's OK:
- The pages (a Command Center home page with summary cards, and a full page for each card).
- The widgets on each page, from `references/widgets.md` and the industry presets (`industries/real-estate.md` or `industries/generic.md`, as suggestions only, never forced).
- The data source for each widget: which app, or which Notion database (existing or new).
- Flags: anything a missing connector cannot support, with the Notion tracker or paste alternative.
- New Notion databases with their proposed fields, for the member's OK.
- Who uses it (just them, a team, or an assistant) and what that changes.
- The email button settings (see `references/email-actions.md`) if there is an email widget.
- For a Follow-Up Queue widget: the stale days per group, the pipelines and stages included and skipped, the channel per group, the freshness approach (a daily scheduled task writing to a Notion Follow-Up Queue database, or live ranking with drafts on a click) and why, and the proposed database fields for the member's OK. See `references/follow-up-queue.md`.

## Step 5: Build

Follow `references/build.md`: set up any approved Notion databases first, then build the artifact. Check which live data features this session's Claude supports and use live connector data where it can; otherwise build a snapshot with a clear Refresh path (run /hi5-dashboard again to refresh). Declare every connector once at build time (including Notion if the dashboard reads or writes a database). Run the two-open test.

## Step 6: Review

Let the member try it and ask for changes, and iterate on the same artifact (publish to the same link). Ask "What would you change?" and "What do you never look at?" Remove anything unused.

## Step 7: Save

After the build, save or update the entry in the Dashboards database from `references/notion-trackers.md`: name, pages, widgets, data sources, connected apps, the Notion databases used, the email button settings, the discovery answers, the artifact link, version, and date. This is what lets the dashboard be rebuilt or updated later.

## Step 8: Update an existing dashboard

Read the entry, show what it has, and ask what changed (new widgets, a new connector, a new page, or something that is not used). Show a Before and After plan, wait for the OK, rebuild or republish the same artifact, bump the Version by 1, and update the entry. Never start over unless the member asks.

## NEXT STEP

Recommend ONE next step. After the first build, suggest using it for a few days and coming back with changes. After an update, suggest the next widget the member asked for. If they have not connected an app that would help most, mention it once, in one line.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
