# CRM Map: Page Layout

The CRM Map is one child page of the Master Profile called "CRM Map", placed below the Linked pages heading. Save its ID as `crm_map_page_id` in the Page IDs section. Create it once, with the member's OK. Update the same page on later runs and never create a second one. No database.

The first line of the page is: `Made by /hi5-re-crm. Last mapped: <date>.`

## Sections (heading 2, in this order)

### How Claude reaches your CRM
The route (`ghl-connector`, `other-connector`, or `paste-mode`), the CRM name, and for GoHighLevel the sub-account name.

### Pipelines
One block per pipeline, with its stages in order. Beside each pipeline, name the client type it is for (buyers, sellers, renters, landlords, investors, 55+ communities, luxury, commercial, land, relocation, new construction) if that is clear from the name. Say which client types the member works with that have no pipeline.

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
Which tag, field, or setting shows that a contact has agreed to texts and which shows do-not-disturb. This is what the consent check reads.

### Paste-mode map (only for paste mode)
The member's pipeline and stage names, tags, and fields, in their words.

### Gaps and not readable
Gaps noticed (missing stages, near-duplicate tags, transaction fields that do not exist yet, client types with no pipeline), and anything that could not be read and why. Never fill an empty section with examples. Write "None found".

## Rules
- No em dashes. Plain words.
- Never put contact names, phone numbers, or emails on this page. It describes the CRM's structure, not the people in it.
