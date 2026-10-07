---
name: hi5-re-listing-appt
description: Prepares a real estate member for a listing appointment and follows up after it. Builds the appointment game plan, a pre-appointment seller intake, a CMA from comps the member exports from their own MLS (or an optional browser-assisted search on their own login), the pricing conversation, objection answers, and a follow-up sequence for sellers who have not signed. Works for home sellers, landlords, investors, 55+ community sellers, luxury, and land, new construction, and commercial listings. Uses the member's Voice Profile, Objection Bank, proof points, and neighborhood files, keeps Fair Housing in every line, never quotes a standard commission, and drafts only. Real estate only. Triggers when the user runs /hi5-re-listing-appt, says "listing appointment", "prep my listing presentation", "build a CMA", "pricing conversation", or "follow up with a seller who hasn't signed".
---

# Hi5 Listing Appointment: Prepare, Present, Follow Up

## Purpose
Walk into a listing appointment ready, and keep following up until the seller decides. Six jobs: the game plan, the pre-appointment intake, the CMA, the pricing conversation, objection answers, and the follow-up sequence. Every line is specific to the seller and the property, in the member's voice.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` first, every time.** It covers drafts and sends, texting consent, Fair Housing, the MLS rule, compensation and contract limits, and sensitive data. Follow all of it. If that file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Drafts only.** Nothing is sent, posted, or changed in the CRM without the member's OK. To send a message, use /hi5-re-crm job 11. To log the appointment, use /hi5-re-crm job 4.
- **Never invent comps, numbers, proof, or names.** Use only what the member gives you, and mark gaps `[ADD PROOF]`, `not verified`, or a placeholder such as [PAST CLIENT NAME].
- **Compensation is set by agreement between the agent and the client, and it is negotiable.** Never quote a standard rate or call a fee fixed. Use the member's own saved fee details and their brokerage's current forms.
- **A price recommendation is an opinion of value to prepare the agent, not an appraisal.** Never promise a price, a timeline, or an appraisal result, and never speak badly of another agent or company.
- **Fair Housing.** Describe the home and the place by features, never by who lives there or who will buy. Say "buyers in this price range are choosing X", never who those buyers are. Never state schools, safety, or flood as fact.
- Write in the member's Voice Profile and tailor tone to their behavioral style. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- One question at a time. If something important is missing, ask up to 3 questions before writing, then write.
- Remove anything generic that could apply to any seller. Every section must refer to this seller's situation.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `objection_bank_page_id`, `neighborhoods`, `crm_map_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `brokerage`, `states_licensed`, `primary_market`, `niche`, `differentiator`, `proof_point` and `proof_point_public`, `client_words`, `mls_name`, `cma_adjustments`, the fee details saved by /hi5-bizplan, the Voice Profile, the Compliance Guardrails page (`disclosure_line_full`, `required_notices`, `sms_consent_status`, `protected_class_jurisdictions`, `brokerage_ad_rules`), the Objection Bank page, and the Neighborhood page for the area.

## Step 1: Which kind of appointment

Ask which fits, using the member's own `client_categories`, and load the matching module:
- A home seller: `modules/home-seller.md`
- A landlord with a rental to list: `modules/landlord-rental.md`
- An investor selling a property: `modules/investor-seller.md`
- A seller in a 55+ or age-restricted community: `modules/community-55-plus.md`
- A luxury seller: `modules/luxury.md`
- Land, new construction, or a commercial listing: `modules/land-newbuild-commercial.md`

If the appointment is a mix, load the closest module and say what you borrowed from the others.

## Step 2: Choose the job

Ask what the member wants. If they already said, go straight to it.

> 1. The appointment game plan
> 2. The pre-appointment seller intake
> 3. Build the CMA
> 4. The pricing conversation
> 5. Objection answers
> 6. Follow up with a seller who has not signed

Run the job as written in `references/jobs.md`. Job 3 follows `references/cma.md`. For a morning briefing or role-play practice, say those are coming in later skills.

## Step 3: Save

Offer to save the result as a row in the Marketing Hub: Type "Listing Appointment", Status "Draft", Source Skill `/hi5-re-listing-appt`, today's date, and the title "[Seller last name or property address]: Game plan" (or Intake, CMA summary, Pricing conversation, Objection answers, or Follow-up). The full text goes in the row's page body. Save only when the member says yes. Do not put sensitive data in the row (see guardrails). Never create a database.

## NEXT STEP

Recommend ONE next step. After the game plan, the intake, or the CMA, suggest the pricing conversation. After the appointment, suggest logging it with /hi5-re-crm (job 4) and then the follow-up (job 6). If Stage 4 (objection bank) is not complete in Setup Status, recommend /hi5-setup and Continue setup, so the objection answers use the member's own proof.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
