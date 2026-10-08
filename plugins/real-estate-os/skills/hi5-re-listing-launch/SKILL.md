---
name: hi5-re-listing-launch
description: Launches a listing for a real estate member. Writes MLS remarks and a social version, five caption angles, a ten-post content pack, a just-listed email for the sphere, a graphics brief with an optional build in the member's Canva as drafts, a 30-day marketing calendar, an open house kit, and the just-sold, under contract, and price improvement posts. Works for homes for sale, rentals, investor properties, 55+ communities, luxury, and land, new construction, and commercial listings. Reads the profile, CRM Map, saved pages, and listing details first, runs every draft through a Fair Housing scan, and never posts, sends, or publishes anything. Real estate only. Triggers when the user runs /hi5-re-listing-launch, says "write my listing description", "MLS remarks", "just listed", "just sold post", "open house kit", or "30 day listing plan".
---

# Hi5 Listing Launch: From List Day to Just Sold

## Purpose
Take one listing from coming soon to just sold with copy, graphics briefs, a calendar, and announcements that sell the home on specifics, in the member's voice, with Fair Housing built in.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` first, every time.** Also read `references/fair-housing-scan.md` and `references/safeguards.md` before drafting. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Read the profile, the CRM Map, the Neighborhood page for the area, any earlier Marketing Hub rows for this address, and the listing details and files the member gave (a listing sheet, an MLS export they pasted, or photos) before asking anything. Say what you already have in one line. Ask only about what is unknown, and point to what you found, for example "I have the price, beds, baths, and five features. I do not have your open house date. Is there one?" Never ask what the data already answers.
- **Drafts only.** Never post, schedule, send, publish, share, or change anything. The member posts and sends. To send one message, use /hi5-re-crm job 11.
- **Run every draft through the Fair Housing scan before showing it.** Describe the home, the lot, and nearby amenities only, never who should live there. Rewrite what the scan flags, and tell the member in one line what changed.
- **Never invent anything.** Use only facts the member gave or the listing documents show. Mark unknowns `[ADD DETAIL]`. Never state school quality, crime, flood, appreciation, or a sale outcome as fact.
- Specifics beat adjectives. Rotate features so no two pieces lead with the same one.
- End every public piece with the saved disclosure line (`disclosure_line_short` for captions, ads, and posts, `disclosure_line_full` for emails and web pages) and the required notices. If `brokerage_ad_rules` says broker approval is needed, mark each public piece "Needs broker approval before posting".
- Write in the member's Voice Profile and tailor tone to their behavioral style. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on Zillow, Redfin, or any listing site. The member gives you listing data.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`, `crm_map_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `brokerage`, `states_licensed`, `primary_market`, `niche`, `differentiator`, `proof_point` and `proof_point_public`, `brand_color`, `brand_font`, `mls_name`, `mls_remarks_limit`, `coming_soon_policy`, `sold_price_policy`, the Voice Profile, and the Compliance Guardrails page (`disclosure_line_short`, `disclosure_line_full`, `required_notices`, `sms_consent_status`, `protected_class_jurisdictions`, `brokerage_ad_rules`).

## Step 1: Scan the listing

Gather what is already known (the member's message, files, the Neighborhood page, earlier Marketing Hub rows for this address, and the CRM opportunity for the listing if the CRM is connected and the member allows a read). Then say in one or two lines what you have and what you still need for the job they chose.

## Step 2: The property type

Work out the type from the details (for sale or for rent, a named 55+ community, acreage or a commercial use, an income property, a luxury price point). Confirm only if it is unclear. Then read the matching section of `references/property-types.md` and follow it.

## Step 3: Choose the job

Ask what the member wants. If they already said, go straight to it.

> **Launch**
> 1. MLS remarks and a social version
> 2. Five caption angles to test
> 3. A ten-post content pack
> 4. A just-listed email for your sphere
> 5. The graphics brief (with an optional build in your Canva)
> 6. A 30-day marketing calendar
> 7. An open house kit
>
> **Milestones**
> 8. A just-sold story
> 9. An under contract post
> 10. A price improvement announcement

Run the job as written in `references/jobs.md`. For paid listing ads, say they are coming in /hi5-re-ads, and until then /hi5-funnel follows Meta's Housing category rules. For the weekly seller update, point to /hi5-re-seller-updates. For a homeowner market letter, point to /hi5-newsletter.

## Step 4: Save

Offer to save the result as a row in the Marketing Hub: Type "Listing Launch", Status "Draft", Source Skill `/hi5-re-listing-launch`, today's date, and a title like "[Address]: MLS remarks" (or Caption angles, Content pack, Sphere email, Graphics brief, 30-day calendar, Open house kit, Just sold, Under contract, or Price improvement). The full text goes in the row's page body. Save only when the member says yes. Never create a database.

## NEXT STEP

Recommend ONE next step. After the MLS remarks, suggest the content pack or the graphics brief. After the calendar, suggest creating the tasks with /hi5-re-crm. After going under contract, suggest /hi5-re-seller-updates for the offer and closing messages. If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
