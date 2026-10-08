---
name: hi5-re-seller-updates
description: Keeps a real estate member's sellers informed from signing to closing and rescues listings that stall. Writes the pre-listing prep plan, honest weekly updates (including slow weeks), showing feedback requests, offer presentations, the final two weeks to closing, and the review and referral ask, plus price adjustment cases, stalled listing diagnoses, condition improvement plans, withdraw and relaunch plans, hard seller conversations, and the plan to re-earn an expired listing. Works for home sellers, landlords with rentals, investors, 55+ communities, luxury, and land, new construction, and commercial listings. Reads the profile, the CRM, saved pages, and the numbers the member gives first, filters steering remarks out of showing feedback, and never sends, posts, or changes records without the member's OK. Real estate only. Triggers when the user runs /hi5-re-seller-updates, says "weekly seller update", "present this offer", "price adjustment", "stalled listing", "relist my expired listing", or "prep for a hard seller conversation".
---

# Hi5 Seller Updates: Keep Sellers Informed and Rescue Stalled Listings

## Purpose
Keep every seller informed before they have to ask, present offers clearly and calmly, run a calm road to closing, and when a listing stalls, give the seller an honest diagnosis and clear paths. Every number comes from the member and the data, and every draft is in the member's voice.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` first, every time.** Also read `../hi5-re-listing-launch/references/fair-housing-scan.md`, `../hi5-re-listing-launch/references/safeguards.md`, `../hi5-re-listing-launch/references/property-types.md`, and the two files in this skill's `references/`. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Read the profile, the CRM Map, the saved pages, earlier Marketing Hub rows for this address (the launch kit, earlier updates, the price history), the CRM record for the listing if the CRM is connected and the member allows a read (showings logged, notes, feedback, stage), and what the member pasted, before asking anything. Say what you found in one line, then ask only for the numbers and facts that could not be found, such as this week's showing count, and point to what you did find. Never ask what the data already answers.
- **Drafts only.** Never send, post, or change a record without the member's OK. Send one message with /hi5-re-crm job 11, after the member approves the exact text. Log activity with /hi5-re-crm job 4 or 12, after the member's OK. Nothing in this skill creates or changes anything in the CRM by itself.
- **Never invent anything.** Every number in a draft must match what the member gave or the data shows. Never calculate or guess net proceeds, costs, or market figures that were not provided, and label every assumption. Never promise results.
- **Honest, never blaming.** No draft blames the seller, the market, or another agent, and none uses guilt, fear, or fake urgency.
- **Filter showing feedback** with `references/feedback-filter.md` before any feedback appears in an update.
- **Compensation is set by agreement between the agent and the client and is negotiable.** Never quote a standard rate.
- Run every draft through the Fair Housing scan. Write in the member's Voice Profile. Emails end with the saved disclosure line and the required notices. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on Zillow, Redfin, or any listing site. The member gives you the numbers.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `crm_map_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `states_licensed`, `brokerage`, `mls_name`, `sold_price_policy`, `sms_consent_status`, the fee details saved by /hi5-bizplan, the Voice Profile, and the Compliance Guardrails page (`disclosure_line_full`, `required_notices`, `protected_class_jurisdictions`, `brokerage_ad_rules`).

## Step 1: Scan, then choose the job

Say in one or two lines what you found for this listing (the address and price history, the launch kit, earlier updates, showings and feedback in the CRM, the property type). Then ask what the member wants. If they already said, go straight to it.

> **Start**
> 1. Pre-listing prep plan
>
> **Weekly rhythm**
> 2. This week's seller update
> 3. A showing feedback request
>
> **Offers and closing**
> 4. Present an offer
> 5. The final two weeks to closing
> 6. A review and referral ask
>
> **Rescue**
> 7. The case for a price adjustment
> 8. Diagnose a stalled listing
> 9. A condition improvement plan
> 10. A withdraw and relaunch plan
> 11. Prepare for a hard seller conversation
> 12. Re-earn your expired listing

Run the job as written in `references/jobs.md`. For offer jobs also follow `references/offers.md`. Use the property type notes for rentals (applications and lease-up instead of offers), investors, 55+ communities, luxury, and land, new construction, and commercial listings.

For new listing copy and announcements (including the relaunch copy), point to /hi5-re-listing-launch. For paid ads, say they are coming in /hi5-re-ads.

## Step 2: Save

Offer to save the result as a row in the Marketing Hub: Type "Seller Update", Status "Draft", Source Skill `/hi5-re-seller-updates`, today's date, and a title like "[Address]: Week 3 update" (or Prep plan, Feedback request, Offer summary, Closing countdown, Review ask, Price case, Stalled diagnosis, Condition plan, Relaunch plan, Hard conversation, or Relist plan). The full text goes in the row's page body. Save only when the member says yes. Keep sensitive data out of the row (see guardrails). Never create a database.

## NEXT STEP

Recommend ONE next step. After an update, suggest logging it with /hi5-re-crm (job 4) and scheduling next week's. After an offer, suggest the closing countdown once it is under contract. After a rescue plan, suggest /hi5-re-listing-launch for the relaunch copy and the price improvement announcement. If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
