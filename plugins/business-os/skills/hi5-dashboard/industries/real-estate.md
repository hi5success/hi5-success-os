# Real Estate Dashboard Preset

Used by `SKILL.md` Step 4 for members in real estate. These are suggestions, offered after discovery, and never forced. Drop anything the member would take no action on. Real estate rules apply: Fair Housing (no widget that shows or filters by who someone is), texting consent and do-not-contact before any text, and dates come only from the executed document or the source.

## Suggested widgets
- **Today:** appointments and showings from the calendar.
- **Email:** emails that need a reply, with drafted replies in the member's voice.
- **CRM summary:** new leads, active leads, and needs follow-up, by sub-account if the member uses more than one.
- **Listings:** active listings with the next action for each (a price talk, a showing feedback request, a seller update due). The data comes from the CRM opportunities or a Notion Listings tracker. Never pull data from a listing site.
- **Clients:** buyers and sellers in the pipeline, grouped by stage, with the last touch.
- **Transaction tracker:** every file under contract, with its stage, the key dates, the documents needed, what is missing, and the next step (see below).
- **Important dates:** from the Transactions tracker and the calendar.
- **Tasks:** from Notion and GoHighLevel.
- **Money snapshot:** the quarter's closings and take-home against the `/hi5-goals` plan, only from the member's own numbers.
- **Marketing snapshot:** the Marketing Hub rows by Type and Status (listing launches, ad campaigns, sphere plans).

## The Transactions tracker (a Notion database, new only if there is none)
Propose these fields and get the member's OK first. The CRM keeps the opportunity and stage. This tracker holds what the CRM does not.

| Property | Type | Notes |
|---|---|---|
| Property | title | The address |
| Client | text | First name or the name the member uses, no household details |
| Side | select | Buyer, Seller, Landlord, Tenant, Investor, Other |
| Stage | select | Under contract, Inspection or option, Appraisal and financing, Title, Pre-closing, Closed, Fell through |
| Contract date | date | |
| Inspection or option end | date | As the executed document states it |
| Appraisal date | date | |
| Earnest money due | date | |
| Due diligence end | date | |
| Closing date | date | |
| Documents needed | multi-select | The member's list of documents for this kind of file |
| Documents received | multi-select | The ones that are in |
| Next step | text | One line |
| CRM link | url | The opportunity in the CRM |

- **Missing items:** "what is missing" is Documents needed minus Documents received, and any key date that is blank.
- **Dates come only from the executed document.** To fill the tracker from a contract, point to /hi5-re-transaction (job 1 reads the contract and job 3 builds the key dates), and add the dates only after the member's OK. Never compute a date on the dashboard.
- **Actions:** mark a document received, change the stage, add a next step, make a task. A change to the CRM is shown first and made only after the member's OK.

## The Important Dates tracker (only if the member wants one beyond the calendar)
| Property | Type |
|---|---|
| Item | title |
| Date | date |
| Related file | relation to Transactions, or text |
| What to do | text (written by the member) |
| Done | checkbox |
Dates already in the calendar or the CRM are read from there, not copied.

## Notes
- For texts to leads or clients, run the consent gate from the CRM Map's `consent_source`. Unknown means no text.
- For drafted replies and messages, use the member's voice and the disclosure line.
- Never show demographic or neighborhood-people information on any widget.
