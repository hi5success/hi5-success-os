# Any Other CRM: Connector Check and Paste Mode

Used by `SKILL.md` when the member's CRM is not GoHighLevel (Follow Up Boss, BoldTrail, kvCORE, Lofty, a spreadsheet, or anything else), or when no GoHighLevel connection is available.

## Choose the route
1. **Is there a connector for this CRM in this session?** Look at the tools you actually have. If one exists, treat it like `ghl.md`: read before write, one write at a time, read back, stop on failure, plan and OK first. Run a read-only test first, and say what you can and cannot do. Save `crm_connection: other-connector`.
2. **If not, use paste mode.** Save `crm_connection: paste-mode`. Never claim to have changed anything in the member's CRM in paste mode.

## Paste mode
The member pastes a record, a note, a message, an email thread, or a contract, or describes a screenshot. Claude does the thinking and the writing, and the member enters it in their CRM.
- **Ask once for the CRM's field names.** Ask which pipelines or stages, tags, and custom fields they use, and save them on the CRM Map page under a "Paste-mode map" heading, so later updates use their words. Ask about one area at a time, and never fill it with examples.
- **Produce a CRM update sheet** instead of a write plan. It uses the same plan table, with a column for where the member enters it:
  | Record | Field or action | Value to enter | Where to enter it |
  Then the note text to paste, the tasks to create (title and due date), the tags to add or remove, and any messages as drafts.
- **Say what is missing.** List anything not given under "Missing", and leave it blank in the sheet.
- **Drafts only.** The member copies a draft into their own CRM or email and sends it themselves. The consent check in the guardrails file still runs before any text draft.
- **Reports** (forecast, stalled deals, duplicates) work from an export the member pastes or uploads (for example a CSV of opportunities). Say the limits of what was pasted, for example "this covers the 40 rows you gave me".
- **Contracts and leases** work the same as with a connector: extract, show sources, and produce the update sheet.

## If the member wants to move to GoHighLevel
Say once that Hi5 Connect and the Real Estate GHL Snapshot let Claude update their CRM directly, and do not push. Never criticize their current CRM.
