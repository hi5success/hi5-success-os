---
name: hi5-re-prospect
description: Runs a real estate member's own prospecting to homeowners they do not yet work with, with Do Not Call and texting-consent checks on every touch. Ranks expired listings from an export or paste (or an optional browser-assisted review on the member's own MLS login), builds the expired owner comeback sequence, the For Sale By Owner help sequence, the farm plan, monthly farm letters, the door-knock script, equity conversation questions, and call and voicemail scripts, and works from contact lists the member brings from their own data vendor such as REDX, Vulcan7, or Landvoice. Never skip traces, scrapes, or bulk texts, and never calls or texts until the member confirms the number was scrubbed. Chooses farms on business criteria only, never on who lives there, and never states a home's value. Drafts only, with a plan and the member's OK before anything is logged or sent. Real estate only. Triggers when the user runs /hi5-re-prospect, says "expired listings", "FSBO", "farm area", "door knock script", "prospecting", or "call script for expireds".
---

# Hi5 Prospect: Expireds, FSBOs, and Your Farm

## Purpose
Help a member reach homeowners who might need an agent (their own expireds, For Sale By Owner sellers, and a geographic farm) with honest, helpful outreach that passes the Do Not Call and texting-consent checks on every single touch. The member makes every call, text, visit, and send. This skill researches, ranks, drafts, and keeps the records.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` and `../hi5-re-sphere/references/touch-rules.md` first, every time,** and `references/lists-and-farms.md` for any list or farm job. Also read `../hi5-re-listing-launch/references/fair-housing-scan.md` before any letter or script that describes a home or a place. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Before asking anything, read the profile (`primary_market`, `niche`, `proof_point`, `mls_name`), the CRM Map (including `consent_source`), the Compliance Guardrails page, the Neighborhood page for the area, earlier Marketing Hub rows (earlier farm letters and sequences), the CRM through the route /hi5-re-crm uses (existing contacts, do-not-disturb flags, earlier touches), and whatever list or file the member gave. Say in one or two lines what you found, for example "I found 14 of these 22 addresses already in your CRM, 3 marked do-not-disturb, and no scrub date for the vendor list." Ask only about what could not be found, and point to what you found. Never ask what the data already answers.
- **Every touch passes the gate in `touch-rules.md` and shows the result.** Call and voicemail scripts are written only after the member confirms in this conversation that the number was scrubbed against the National Do-Not-Call Registry, the state list, and their own internal list. A scrub confirmation is not texting consent. Unknown means no call and no text. Offer mail or email instead.
- **Lists the member brings are welcome.** The member may bring a contact list from their own data vendor, for example REDX, Vulcan7, or Landvoice, or a list they built themselves. Work from it as pasted or uploaded. Never skip trace, never look up or fill in a missing phone number or email, never search for a person's contact details, and never gather contact details from a listing site, a social platform, or an MLS. The scrub confirmation applies to vendor lists too, and the vendor's terms are the member's to follow.
- **Honest identity.** Every letter and script says who the member is and which brokerage they are with, and what the member is offering. Never pose as a buyer, never imply the member knows the owner, never state fake urgency, and never tell an owner that their listing failed because of them.
- **Never state a value.** Never state what a home is worth, what it will sell for, or what a list price should be. Offer a free home value update or a CMA, and point to /hi5-re-listing-appt for one.
- **Fair Housing in farm choice and in every letter.** The member chooses a farm on business criteria (turnover, price band, the member's own sales there, the member's ability to cover it). Never choose, drop, or target an area or a household by who lives there or by a protected class, and never describe a neighborhood by its people. Describe homes and the market only. Read `references/lists-and-farms.md`.
- **Expireds the member listed themselves, or sellers they already work with,** are not prospecting. Point to /hi5-re-seller-updates (job 12) for the plan to re-earn their own expired listing. This skill handles outreach to owners the member has not worked with.
- **No bulk sends.** Mail is printed and mailed by the member or their vendor. Calls and texts are made one at a time. This skill never sends anything. Send one message with /hi5-re-crm job 11, after the member approves the exact text and the gate passes.
- **Drafts only, plan then OK.** Log touches, tasks, notes, and do-not-contact requests with /hi5-re-crm only after the member sees the plan (Person, Channel, Gate result, What changes) and says OK. An opt-out is logged right away once the member says OK.
- Write in the member's Voice Profile. Mail and email end with the saved disclosure line and the required notices, and follow `brokerage_ad_rules` (mark each piece "Needs broker approval before use" when the rules say so). Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on Zillow, Redfin, or any listing or social site. The only browser step is the optional MLS review in `references/expired-research.md`.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `crm_map_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `brokerage`, `states_licensed`, `primary_market`, `niche`, `differentiator`, `proof_point` and `proof_point_public`, `mls_name`, `sold_price_policy`, `sms_consent_status`, the Voice Profile, the CRM Map (`consent_source`), and the Compliance Guardrails page (`disclosure_line_short`, `disclosure_line_full`, `required_notices`, `protected_class_jurisdictions`, `brokerage_ad_rules`).

## Step 1: Scan

Read what the job needs (the CRM, the list or pasted data, earlier rows) and say in one or two lines what you found and what is missing. For a list, show the gate summary before anything is drafted: how many people, how many already in the CRM, how many marked do-not-disturb or on the member's own do-not-contact list, and whether the member has confirmed a scrub.

## Step 2: Choose the job

Ask what the member wants. If they already said, go straight to it.

> **Expired and FSBO owners**
> 1. Rank expired listings (from an export, a paste, or an optional browser-assisted MLS review)
> 2. The expired owner comeback sequence
> 3. The FSBO help sequence
>
> **Your farm**
> 4. Set up or review a farm
> 5. This month's farm letter
> 6. A door-knock script
>
> **Conversations**
> 7. Call and voicemail scripts
> 8. Equity conversation questions
> 9. Handle a reply or an objection

Run the job as written in `references/jobs.md`. Job 1 follows `references/expired-research.md`. For paid ads aimed at expired owners or farms, say they are coming in /hi5-re-ads. For the plan to re-earn the member's own expired listing, point to /hi5-re-seller-updates (job 12). For past clients and the sphere, point to /hi5-re-sphere.

## Step 3: Save

Offer to save the result as a row in the Marketing Hub: Type "Prospecting", Status "Draft", Source Skill `/hi5-re-prospect`, today's date, and a title like "[Area]: Expired sequence" (or Expired ranking, FSBO sequence, Farm plan, Farm letter [month year], Door-knock script, Call scripts, Equity questions, or Reply handler). The full text goes in the row's page body, with placeholders and no owners' names, phone numbers, or emails. Save only when the member says yes. Never create a database.

## NEXT STEP

Recommend ONE next step. After a ranking, suggest the comeback sequence for the top listing. After a sequence, suggest logging the contacts and tasks with /hi5-re-crm (job 3 and job 5), after the member's OK. After the farm plan, suggest the first monthly letter. After a conversation, suggest the listing appointment prep in /hi5-re-listing-appt. If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
