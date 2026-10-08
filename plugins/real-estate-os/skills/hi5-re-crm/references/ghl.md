# GoHighLevel: Connection and Operations

Used by `SKILL.md` when the member's CRM is GoHighLevel (including Hi5 Connect and the Real Estate GHL Snapshot) and the GoHighLevel connector is available in this session.

## Finding out what the connection can do
- **Never assume tool names.** The connector may offer fixed tools, or it may offer a way to search for operations and then run them. Look at what this session actually has. If there is a search or describe step, use it to find the operation for each job (for example search contacts, create or update a contact, list pipelines, create or update an opportunity, list custom fields, list tags, list calendars and free slots, book an appointment, add a note, create a task, read conversations, send a message, add a contact to a workflow, list users, list locations). Read what an operation needs before you run it.
- **Read before write.** Every job starts with reads. Writes come only after the member approves the plan (see the guardrails file).
- **One operation at a time for writes.** After each write, read the record back to confirm it saved. If a write fails, stop. Tell the member what changed and what did not. Do not retry a message send. Retry a field update only once, and only if the error looks temporary.
- **Report what you could not do.** If the connection has no operation for a job (for example uploading a file to GoHighLevel media, merging two contacts, or editing a workflow), say so, and give the member the steps to do it inside GoHighLevel.

## Scanning forms
When mapping, list the forms and the fields each one holds. Note any checkbox or field whose label suggests texting consent (for example a label about texts, SMS, agreeing to receive messages, or opting in). Report what you found, such as the form names and the label text, and count the submissions where it was checked if the connection shows them. Use this to ask a pointed question. Never guess which form is the member's consent form.

## Which sub-account
Members may have more than one GoHighLevel sub-account (location). List the locations the connection can reach. If there is more than one, ask which to use, every session, and show its name before any write. Save the one they normally use as `ghl_location_name` in the Master Profile (Tools section) and still confirm it when there is more than one.

## Connection check (job 1, read only)
1. List what the connection can do, grouped by area: contacts, opportunities and pipelines, calendars, conversations, tasks and notes, workflows, custom fields, and other. One line each.
2. Run three read-only tests and show each result: the sub-account name, the list of pipelines, and a contact search for a name the member says is in their CRM.
3. Report what you cannot do, and any operation that errored or is missing.
4. If a test failed, give the likely causes in plain steps:
   - The GoHighLevel connector is not switched on for this chat. Turn it on in the connector list.
   - Another Claude account is connected to the same sub-account. Only one Claude account can be connected to a sub-account at a time, so reconnect from this account.
   - The wrong sub-account is authorized. Disconnect and reconnect, and choose the right one.
   - The member's GoHighLevel user does not have permission for that area.
   Offer screenshot help and never assume menu names.
5. Output a short status report that starts with "Connected: yes" or "Connected: no". If yes, save `crm_connection: ghl-connector`.

## Reading consent
The member's `consent_source` on the CRM Map says where texting consent is captured. When it is a form, find the contact's submission for that form (through the connection's submissions or contact activity operations) and read the consent field on it. Show the member what you found (the form name, the date, and the answer) and never infer consent from the existence of a phone number. If the connection cannot read submissions, say so and ask the member. Never ask the member to paste a password or a key to get at this.

## Hi5 Connect and the Snapshot
If the member runs the Real Estate GHL Snapshot or Hi5 Connect, their pipelines, custom fields, tags, and workflows already exist. Mapping only teaches Claude the names. A pipeline stage change can fire a workflow, so before moving a deal, say which workflow the stage might trigger (from the CRM Map) so the member is not surprised by a message going out or a duplicate task.

## Connection route in the profile
`crm_connection` is one of `ghl-connector`, `other-connector`, or `paste-mode`. If a member's `crm` is not GoHighLevel, use `other-crm.md`.
