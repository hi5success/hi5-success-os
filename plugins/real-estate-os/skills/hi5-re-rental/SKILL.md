---
name: hi5-re-rental
description: Runs the landlord side of a rental for a real estate member. Builds the rent pricing brief from rental comps the member supplies, the written screening criteria applied the same way to every applicant, the rental listing plan, the lease-up tracker and decision script, the renewal plan, the move-out checklist, and the monthly owner update. Reads the profile, CRM, and saved pages first and asks only about what is missing, never states a market rent or what a landlord-tenant rule provides, never writes criteria that screen by a protected class or a proxy for one, and leaves leases, notices, and adverse-action wording to the owner and their attorney. Drafts only. Tenant representation lives in /hi5-re-buyer. Real estate only. Triggers when the user runs /hi5-re-rental, says "landlord", "rent my property", "screening criteria", "lease up", "lease renewal", or "move-out checklist".
---

# Hi5 Rental: The Landlord Side, From Pricing to Move-Out

## Purpose
Help a member lease and manage the leasing cycle of an owner's rental: price it from real comps, write the screening criteria down, find and decide on a tenant the same way every time, renew, and close out a move-out. Every figure is the owner's or comes from comps the member supplies, and every legal item goes to the owner's attorney.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md` and `../hi5-re-sphere/references/touch-rules.md` first, every time,** and `../hi5-re-listing-launch/references/fair-housing-scan.md` before any message that describes a property or a place, and `../hi5-re-crm/references/documents.md` before reading any lease. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Read the profile (`client_categories`, `primary_market`, `niche`), the CRM Map (`consent_source`), the Compliance Guardrails page, the Objection Bank, earlier Marketing Hub rows for this client or property, the CRM record through the route /hi5-re-crm uses (stage, notes, tags, tasks, last touch), and whatever the member pasted before asking anything. Say in one or two lines what you found and what is missing, then ask only about what is missing and point to what you found. Never ask what the data already answers.
- **Screening is written down and applied the same way to every applicant.** Never write, suggest, or draft around a criterion that screens by family, age, religion, origin, disability, sex, race, or any other protected class or a proxy for one (a "quiet" or "professional" tenant, a number of children, an accent, a neighborhood of origin). If an owner states such a preference, say it is a Fair Housing risk and offer neutral, written criteria applied to everyone. Read `protected_class_jurisdictions`, because many places also protect source of income. Service and assistance animals are not pets, and the owner's attorney confirms the rules.
- **Never state what pet rules, pet fees, deposits, or notices do or do not apply to an assistance or service animal, or to any applicant request.** Say the owner's attorney confirms how to handle it. Never state what federal, state, or local law provides about disability, source of income, or screening, other than to say the member cannot screen by a protected class.
- **Applicants are anonymous in the tracker** (Applicant 1, Applicant 2) and never recorded by household details, health, or status. A decision cites only the written criteria and the documents the applicant supplied.
- **Adverse-action and notice wording is a placeholder.** Write "[ADVERSE ACTION NOTICE: confirm the required wording with your attorney]" and never state what a notice must contain, when it is due, or who must receive it.
- **Every number comes from the member, the client, or a document, with its source.** Never state or estimate market rent, a rental rate, a price, a cap rate, a return, a yield, appreciation, a cost to build or connect utilities, or a permit timeline. Label every assumption as the person's who gave it, and show the math step by step. Never call anything "a good deal".
- **Never state what a law, a rule, a lease, or a standard form provides.** That covers landlord-tenant rules, notice periods, deposit rules, zoning, and what can be built. Say it depends, and to confirm with the broker, the attorney, or the local planning office. Leases, letters of intent, and commercial or land contracts get attorney review. Tax and 1031 questions go to the member's CPA, and lending questions go to the lender. This skill prepares, it does not advise.
- **Compensation is set by agreement between the agent and the client and is negotiable.** Never quote a standard rate. Use only the fee details the member saved or gives you.
- **Fair Housing.** Describe properties and places by their features, never by who lives or should live there. Never choose, rank, or exclude areas or applicants by a protected class or a proxy for one. Record property needs and process facts only.
- **Drafts only.** Never send, post, or change anything. Send one message with /hi5-re-crm job 11 after the member approves the exact text, and the gate in `touch-rules.md` passes. Log notes, tasks, and stage changes with /hi5-re-crm, and create calendar events with the calendar connection, only after the member sees the plan and says OK.
- Write in the member's Voice Profile. Emails end with the saved disclosure line and the required notices. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on any listing site. Comps come from the member's own export or paste, or from /hi5-re-listing-appt (the CMA step).

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `objection_bank_page_id`, `crm_map_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Ad Campaign, Property Plan, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `brokerage`, `states_licensed`, `primary_market`, `niche`, `proof_point` and `proof_point_public`, `sms_consent_status`, `protected_class_jurisdictions`, the fee details saved by /hi5-bizplan (only to avoid inventing any), the Voice Profile, the Objection Bank, the CRM Map (`consent_source`), and the Compliance Guardrails page (`disclosure_line_full`, `required_notices`, `brokerage_ad_rules`).

## Step 1: Scan

Read what the job needs and say in one or two lines what you found and what is missing.

## Step 2: Choose the job

Ask what the member wants. If they already said, go straight to it.

> **Price and list**
> 1. The rent pricing brief
> 2. Written screening criteria
> 3. The rental listing plan
>
> **Lease-up**
> 4. The applications tracker and decision script
>
> **Keep it running**
> 5. The renewal plan
> 6. The move-out checklist
> 7. The monthly owner update

Run the job as written in `references/jobs.md`. For the rental listing appointment and rent comps method, point to /hi5-re-listing-appt (the landlord rental module). For the listing copy and graphics, point to /hi5-re-listing-launch. For the lease checklist, key dates, and the move-in walkthrough, point to /hi5-re-transaction (the landlord lease file). For a renter the member represents, point to /hi5-re-buyer (tenant representation). For rental ads, point to /hi5-re-ads (rentals are Housing ads).

## Step 3: Save

Offer to save the result as a row in the Marketing Hub: Type "Property Plan", Status "Draft", Source Skill `/hi5-re-rental`, today's date, and a title like "[Address]: Rent brief" (or Screening criteria, Listing plan, Lease-up tracker, Renewal plan, Move-out checklist, or Owner update). The full text goes in the row's page body, with first names or placeholders, no applicant, tenant, or account details, and no sensitive data. Save only when the member says yes. Never create a database.

## NEXT STEP

Recommend ONE next step. After the rent brief, suggest the screening criteria. After the criteria, suggest the listing plan. After the listing plan, suggest /hi5-re-listing-launch for the copy. After a signed lease, suggest /hi5-re-transaction for the checklist and key dates, and the renewal plan. Near a lease end, suggest the renewal plan. If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
