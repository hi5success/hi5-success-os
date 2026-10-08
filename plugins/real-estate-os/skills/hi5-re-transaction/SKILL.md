---
name: hi5-re-transaction
description: Runs a real estate file from a signed contract or lease to keys. Reads the executed document, builds the phase-by-phase checklist and the key dates calendar, writes the weekly client status update, offer acknowledgments and buyer cover letters, inspection repair requests and responses, appraisal gap briefs, the final walkthrough sheet, the closing day message, and the message after a deal falls apart. Works for buyers, sellers, tenants, landlords, investors, 55+ community resales, new construction, land, and commercial files, and builds on the contract reading in /hi5-re-crm. Scans the CRM, profile, and document first and asks only about what is missing, confirms every date against the executed document, and never sends or changes a record or calendar without the member's OK. Real estate only. Triggers when the user runs /hi5-re-transaction, says "contract to close", "key dates", "weekly escrow update", "repair request", "appraisal gap", "final walkthrough", or "closing day".
---

# Hi5 Transaction: From Signed Contract to Keys

## Purpose
Keep every file on track and every client informed from the day a contract or lease is signed until closing and the keys. Dates come only from the executed document, every message is in the member's voice, and nothing is sent or changed without the member's OK.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` first, every time,** and `../hi5-re-crm/references/documents.md` whenever you read a contract or lease. Also read `../hi5-re-listing-launch/references/fair-housing-scan.md` before any message that describes a home or a place. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Read the profile, the CRM Map, the CRM opportunity for this file (its transaction fields, notes, and tasks, through the route /hi5-re-crm uses), earlier Marketing Hub rows for this address, and the document the member gave before asking anything. If the member names a Gmail thread and Gmail is connected, read that thread only, read only. Say in one line what you have and what is missing, then ask only about what is missing and point to what you found, for example "Your CRM has the contract date and the closing date, but I don't see the inspection deadline in the CRM or the document. What does the contract say?" Never ask what the data already answers.
- **Dates come only from the executed document.** Never invent or assume a deadline. Business or calendar days come from the document. Anything unclear goes on a "Needs confirmation" list. Every checklist, calendar, and update says: "Confirm every date against the executed document. This is not legal advice."
- **Drafts only.** Never send, post, or change anything. Send one message with /hi5-re-crm job 11, after the member approves the exact text. Create CRM tasks, notes, and stage changes with /hi5-re-crm, and calendar events with the calendar connection, only after the member sees the plan and says OK.
- **Never invent anything,** and never state what a state's law, a local custom, or a standard form provides. Say it depends, and to confirm with the broker or attorney. No legal, tax, or lending advice. Never calculate net proceeds or costs that were not provided.
- **Fair Housing in every negotiation.** Talk about the property and the terms only, never about who the buyer, seller, or tenant is. Never attribute a value or a condition to the character of a neighborhood or the people in it. For rentals, written criteria are applied the same way to everyone.
- **Texts and calls** follow the consent check. Email is the default to other agents, lenders, and title companies.
- **Every message before closing day that is about closing includes the wire fraud reminder:** never act on wiring instructions received by email without calling the title company at a known number.
- Write in the member's Voice Profile. Emails end with the saved disclosure line and the required notices. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on any listing site.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `crm_map_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `states_licensed`, `brokerage`, `sms_consent_status`, the Voice Profile, and the Compliance Guardrails page (`disclosure_line_full`, `required_notices`, `protected_class_jurisdictions`, `brokerage_ad_rules`).

## Step 1: Scan the file

Gather what is already known: the CRM record and its transaction fields, notes, and tasks, earlier Marketing Hub rows for this address, the document or the dates the member gave, and the property type. Say in one or two lines what you have and what is missing for the job.

## Step 2: The file type

Work out the file type from what you found (a purchase or a sale, a tenant or a landlord lease, an investor purchase, a 55+ community resale, new construction, land, or commercial), and which side the member represents. Confirm only if it is unclear. Then read the matching section of `references/by-file-type.md` and follow it.

## Step 3: Choose the job

Ask what the member wants. If they already said, go straight to it.

> **Start**
> 1. Read the contract or lease
> 2. The file checklist
> 3. The key dates calendar
>
> **Keep everyone informed**
> 4. The weekly client status update
> 5. Offer communications (acknowledge an offer, or a buyer's cover letter)
>
> **Negotiate**
> 6. An inspection repair request or response
> 7. An appraisal gap brief
>
> **Close**
> 8. The final walkthrough sheet
> 9. The closing day message
> 10. A message after a deal falls apart

Run the job as written in `references/jobs.md`. To present and compare offers to a seller, point to /hi5-re-seller-updates (job 4). For the 12 month post-close plan and past client follow-up, point to /hi5-re-sphere. For the buyer consultation, search, showings, and offer strategy before a contract, point to /hi5-re-buyer.

## Step 4: Save

Offer to save the result as a row in the Marketing Hub: Type "Transaction", Status "Draft", Source Skill `/hi5-re-transaction`, today's date, and a title like "[Address]: Checklist" (or Key dates, Week 3 status, Repair request, Appraisal brief, Walkthrough sheet, Closing day, or Fell-through message). The full text goes in the row's page body. Save only when the member says yes. Keep sensitive data out of the row. Never create a database.

## NEXT STEP

Recommend ONE next step. After reading the contract, suggest the key dates calendar. After the calendar, suggest creating the CRM tasks with /hi5-re-crm job 5. After closing, suggest /hi5-re-crm job 7 (close the deal) and the review ask in /hi5-re-seller-updates (job 6). If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
