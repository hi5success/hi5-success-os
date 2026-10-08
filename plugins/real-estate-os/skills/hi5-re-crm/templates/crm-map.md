# CRM Map: Page Layout

The CRM Map is one child page of the Master Profile called "CRM Map", placed below the Linked pages heading. Save its ID as `crm_map_page_id` in the Page IDs section. Create it once, with the member's OK. Update the same page on later runs and never create a second one. No database.

The first line of the page is: `Made by /hi5-re-crm. Last mapped: <date>.`

## Sections (heading 2, in this order)

### How Claude reaches your CRM
The route (`ghl-connector`, `other-connector`, or `paste-mode`), the CRM name, and for GoHighLevel the sub-account name.

### Pipelines
One block per pipeline, with its stages in order. Beside each pipeline, name the client type it is for in the member's own words. If the member told you how they handle a client type with no pipeline of its own, write their answer. Never write that something is missing.

### Custom fields
A table: field name, field type, and whether it is on the contact or the opportunity. Flag the transaction fields (contract date, closing date, inspection or due diligence deadline, appraisal deadline, financing deadline, sale price, earnest money, lender, title company, co-op agent), and for rentals the lease start, lease end, rent, and renewal notice fields.

### Tags
Grouped by purpose: client type, status, source, nurture, consent and do-not-contact.

### Calendars
Each calendar and what it is for.

### Users
Names only.

### Workflows
Name and status, and for each stage change that triggers a workflow, say which one if it can be seen.

### Consent and do-not-contact
- `consent_source`: where texting consent is captured, in the member's words (which form, tag, field, or other place). In GoHighLevel it is often the consent checkbox in a form submission. List each source if there is more than one, and the group of contacts it covers (for example older leads or open house sign-ins).
- Which tag, field, or setting shows do-not-disturb.
This is what the consent check reads before any text.

### Paste-mode map (only for paste mode)
The member's pipeline and stage names, tags, and fields, in their words.

### How you work
The member's own answers about how they use their CRM: how leads arrive, which forms they use, where they record the source, how they track a deal in progress, and anything they set up on purpose. In their words.

### Differences I noticed
Neutral observations the member did not call problems, for example "you track deals in notes, not fields". Not gaps.

### Confirmed gaps
Only what the member said matters to them, each in their words. Write "None confirmed" if there are none. Never add a gap the member did not confirm.

### Could not read
Anything that could not be read and why. Never fill an empty section with examples. Write "None found".

## Rules
- No em dashes. Plain words.
- Never put contact names, phone numbers, or emails on this page. It describes the CRM's structure, not the people in it.
