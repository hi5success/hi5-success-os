# Building the Dashboard as a Claude Artifact

Used by `SKILL.md` Step 5. The dashboard is a Claude artifact. Check what this session's Claude supports before you design it, use live connector data where it can, and otherwise build a snapshot with a clear refresh path. The member must never be asked to confirm or re-approve connectors each time they open the dashboard.

## Before you build
1. **Notion first.** Create any approved Notion databases (see `notion-trackers.md`), record their IDs, and only then build.
2. **Load the artifact guidance.** If the `artifact-design` and `artifact-capabilities` skills are available, load them first. They are authoritative for the page contract, the capability names, and the call shapes. If they are not available, say so, build a snapshot, and tell the member live data is not available in their Claude.
3. **Read the capability roster.** The `artifact-capabilities` guidance lists which capabilities this Claude can grant. Only declare what is listed. If `mcp` is not listed, build the snapshot (below).
4. **Know the exact tools.** For every connector tool the page will call, read its input schema from this session's own tool definition, or run one safe read call to learn the result shape. Never run a write just to learn its shape, and never guess an argument name. Never embed values you saw in a real call as sample data. If you cannot learn a tool's shape, say so to the member at publish time, in your reply, not inside the page.

## Live dashboard (when `mcp` is available)
- **Declare once.** Publish with `capabilities` that name every connector the dashboard needs and the exact upstream tool names it calls, for example `mcp: {servers: [{server, tools}]}`, plus `db` (for dismissals, undo state, and settings kept in the dashboard's own data store) and `sample` (to draft replies on request) when the widgets need them. Never declare `permissions` (it is built in). Declare only what the dashboard really uses. Decide the connector list during planning, so a later change to the list is the only thing that asks again, and only for the new connector.
- **Show data with `watchTool`** (a read that keeps current), with a modest `refetchInterval` and a cache window, and **do actions with `callTool`** (a send, a task, a label). After a write, call `invalidate` for the matching read so the widget refreshes.
- **Ask once, up front.** At startup, after first paint, call `permissions.request` once with only the names the page uses (each `mcp:<server>` name plus `db` and `sample`), so the member answers one batched dialog the first time. Never call `request` in a loop and never again on later opens. Read `permissions.state` without prompting.
- **Contain failures in the widget.** Branch on the error code, never on message text:
  - `needs_reauth` or `server_not_connected`: that widget shows one clear message, "Reconnect [app] in Settings, then Connectors", with the rest of the dashboard still working.
  - `approval_required` on a button: show "Needs approval" with a button that makes the same call once.
  - `not_in_manifest` or `blocked_by_policy`: show that connector's widgets as not allowed for this view, without asking again.
  - `selection_required`: say there is more than one connector with that name and ask the member to choose.
  - `tool_error`: show the tool's message in that widget.
  - Retry only errors marked retryable, at most once per refresh, and only reads. Never retry a write by itself, because the outcome may be unknown. Check the state first, then let the member click again.
  - If every widget fails the same way, show one page-level message instead.
- **Keep last good data** visible with a "last updated" stamp taken from the result's own time (`cache.storedAt`), not the page clock.
- **Never ask again on open or refresh.** Opening or refreshing the dashboard only reads data. It never shows a prompt of its own.

## The Follow-Up Queue (freshness)
Choose the approach from `follow-up-queue.md` and say why in the plan. Prefer the daily scheduled task that writes drafts to a Notion Follow-Up Queue database when the member's Claude can run scheduled tasks and the member agrees, because live drafting for a whole list on every open is slow, asks consent, and is rate limited. The dashboard then reads the database with `watchTool` and shows "Last updated". Otherwise rank live from CRM reads and draft one message on a click. Declare the Notion tools it reads and writes (query, update a row, create a task row) and the CRM and email tools it calls once at publish. Send is a real connector call only from a click, and a send is followed by one CRM note write the member was told about during setup.

## Snapshot (when `mcp` is not available)
- At build or refresh time, read the data yourself through the connectors in this session (read only), and embed it as data in the page.
- Put a clear banner at the top: "Snapshot from [date and time]. To refresh, run /hi5-dashboard and choose Refresh." Show the time on every widget.
- Buttons in a snapshot cannot send, label, or write by themselves. Each one copies the drafted text or the instruction ("Ask Claude: reply to [name] with this text") so the member does it in the chat with one click of approval there. Never pretend an action happened.
- Refreshing means running the skill again, which republishes the same artifact.

## Pages and layout
- A Command Center home page with summary cards. Each card opens a full page (CRM, email, finance, marketing, or an industry page). Use in-page views with hash links, so the back button works and the dashboard stays one artifact.
- One column on a phone, large tap targets, no horizontal scroll, readable in light and dark mode. Use the design guidance from `artifact-design`.
- A title of two to four words, such as "Command Center", and a short description. Private by default. A dashboard that declares connectors cannot be shared publicly, so share only with the member's own team or assistant by their normal sharing options, and say so.
- No em dashes anywhere, and no placeholder sample data. An empty widget says what it needs.

## The two-open test (required)
After the first publish:
1. Open the dashboard. Answer any one-time approval prompts for the connectors it declared. Confirm every widget loads.
2. Close it and open it again (a new tab or a reload). Confirm that no connector prompt appears on the second open and that the widgets load with no questions.
3. Trigger a refresh from the page and confirm no prompt appears.
4. Report to the member in one short list: what you tested, what you could not test, and the result.
If a prompt appears on the second open, find where it comes from and tell the member exactly:
- **A one-time consent for a connector** (the first call on that connector for this page). It appears once per connector, and it appears again only if the member removed the permission, or the page's connector list changed.
- **The platform's reconnect prompt**, shown at load when a connector's sign-in has expired. Fix it by reconnecting the app in settings.
- **An approval for an action tool** (a send, a label, a task) that the platform asks for when a tool is not marked read-only. This comes from Claude, not the dashboard's code, and it cannot be removed from the page. Say which buttons trigger it.
- **A duplicate connector choice**, asked once per version of the dashboard when the member has two connectors with the same name.
Never claim a prompt is gone unless you tested it. If you cannot open the page here to test, say so, and give the member the steps to run the test themselves.

## Verify after publishing
Follow the artifact guidance: do one functional pass after the first publish (read back each data collection the page writes, and check that what the rules hide is hidden), and tell the member in one line what you exercised and what you could not.

## Review loop
Publish changes to the same artifact link, never a new one. After each change, say what changed in one line. If a change adds a connector, say that it will ask for approval once for that connector.
