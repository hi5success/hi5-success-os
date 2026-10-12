# Connecting the Apps They Already Use

Used by `SKILL.md` Step 2. Menus differ between Claude apps and versions, so every step is hedged ("look for"), and you ask for a screenshot if they get stuck. Never claim an exact menu name.

## Step 1: Ask what they use
Ask which of these they use day to day: email, calendar, CRM (including GoHighLevel and how many sub-accounts), tasks, chat (Slack or Google Chat), finance (accounting, payments), and anything else important. Skip anything they do not use. Never push an app they do not use.

## Step 2: Check what is already connected
In this session, list the connectors you can see. A connector counts as connected when you can see its tools. Say in one line what you found.

## Step 3: Recommend what is missing
For each app they use that is not connected, and that has a Claude connector, say in one line what it would add:
- **Email (Gmail):** emails that need a reply, with a drafted reply, so nothing sits unanswered.
- **Calendar (Google Calendar):** today's appointments and the dates that need action.
- **CRM or GoHighLevel:** new and active leads, who needs a follow-up, the pipeline, and tasks. For GoHighLevel with more than one sub-account, one summary for each.
- **Notion:** trackers and tasks the dashboard reads and writes (already needed for the Hi5 workspace).
- **Slack or Google Chat:** messages waiting for a reply.
- **Finance (for example Stripe or Square):** money in, as a snapshot, only if they want it.
If a connector is not available for an app they use, say so, and plan a Notion tracker or a paste option instead. Never promise a connector exists. Say "I'll check", then look at the connectors you can see.

## Step 4: Guide the connection
Give short, numbered steps with hedged wording, one app at a time:
1. Open Claude's settings and look for Connectors (the name can differ: Integrations, Apps, or Customize).
2. Find the app in the list, or search for it, and choose to connect it.
3. Sign in to the app when the sign-in window opens, and allow access.
4. Come back here and tell me when you are done.
If their screen does not match, ask for a screenshot of the screen they see and adapt. Never ask them to share a password, a token, or a code in the chat.

## Step 5: Test with one read-only call
After they connect, run exactly one read-only call to confirm it works (for example list today's calendar events, list the first few email threads, or list the CRM locations). Say what you saw in one line without showing sensitive details. If it fails, show the message, and offer the screenshot route or the paste route. Never run a write to test.

## Step 6: If they skip it
Plan around it: a Notion tracker, or a paste option the member refreshes by running the skill again. Say once, in one line, what they would gain by connecting it later. Do not ask again in the same conversation, and never repeatedly across runs. Note the skipped connector on the Dashboards entry so a later update can offer it once.

## Declaring connectors once
After this step, you know every connector the dashboard needs. Declare them all at build time, once (see `build.md`), so any approval is asked one time and never again when the dashboard is opened or refreshed.
