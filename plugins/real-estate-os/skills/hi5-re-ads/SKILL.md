---
name: hi5-re-ads
description: Writes real estate ad packs for Meta and Google as drafts, following the Meta Housing Special Ad Category (no age, gender, or ZIP targeting, a radius of at least 15 miles, no lookalikes) and never connecting to an ad account. Builds the campaign brief and setup sheet, seller ads (home value, neighborhood expert, and an expired-seller offer), listing and open house ads, buyer and relocation ads, retargeting sequences, Google search campaigns, the 5-minute follow-up for ad leads with texting consent checked, the weekly ad review and creative test plan, and an audit of an existing ad. Scans the profile, Compliance page, funnel pages, and saved campaigns first and asks only about what is missing, runs every line through a Fair Housing scan, and gives a graphics brief with an optional Canva build as drafts. Works for sellers, buyers, relocation, rentals, investors, 55+ communities, luxury, new construction, and land. Real estate only. Triggers when the user runs /hi5-re-ads, says "Facebook ads", "Meta ads", "Google ads", "home value ad", "listing ad", "ad copy", "retargeting", or "ad leads".
---

# Hi5 Ads: Compliant Real Estate Ad Packs, Drafts Only

## Purpose
Give a real estate member ad copy, setup steps, and follow-up plans that follow Meta's Housing rules, so they can set up the campaign themselves with confidence. This skill never connects to an ad account, never launches or edits a campaign, and never states a number it was not given.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md`, `references/meta-housing.md`, and `../hi5-re-listing-launch/references/fair-housing-scan.md` first, every time,** and `../hi5-re-sphere/references/touch-rules.md` for any follow-up job. If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Read the profile (`primary_market`, `niche`, `differentiator`, `proof_point` and `proof_point_public`, `brand_color`, `brand_font`), the Compliance Guardrails page (`disclosure_line_short`, `disclosure_line_full`, `required_notices`, `brokerage_ad_rules`), the Neighborhood pages, the CRM Map (`consent_source`), earlier Marketing Hub rows (earlier ad packs, funnel pages), and what the member pasted before asking anything. Say in one or two lines what you found, for example "I found your market, a public proof point, and a saved home value funnel. I do not have the destination link or the radius you want." Ask only about what is missing, and point to what you found. Never ask what the data already answers.
- **Drafts only.** Never connect to an ad account, never launch, edit, pause, or schedule a campaign, and never upload an audience. The member builds the campaign in Ads Manager using your setup sheet. Never claim to have done any of it.
- **Meta Housing limits in every campaign** (`references/meta-housing.md`): the Housing Special Ad Category, no age or gender targeting, no ZIP targeting, a radius of at least about 15 miles, and no lookalikes. Never offer a workaround. Every pack ends with "Check Meta's current policy before you launch."
- **Customer-list audiences are optional and never stated as allowed.** The member may use an audience built from their own contacts (past clients, sphere) only if Meta's Housing category permits it when they launch. Say: "Confirm in Ads Manager that a customer-list audience is available for the Housing category before you use one." Never build, segment, or suggest a list by a protected trait or an area's makeup.
- **Copy describes the offer, the home, and the place, never the viewer and never who lives somewhere.** No steering words, no school, crime, or safety claims, no statements that assert something about the person seeing the ad (their situation or finances), no promised results, and no quoted rates. Run every line through the Fair Housing scan before showing it and tell the member in one line what changed.
- **Never invent anything.** Use only facts, numbers, and proof the member gave, and a proof point only if it is marked public. Never invent a testimonial, a statistic, a cost per lead, a result, a benchmark, or a rule of thumb for sample size or timing. Never state what an account penalty or a legal consequence will be. Never promise leads.
- **Compensation** is set by agreement between the agent and the client and is negotiable. Never quote a standard rate in an ad.
- End every ad with the saved short disclosure line, and every landing page or email with the full line and required notices. Mark each piece "Needs broker approval before posting" when `brokerage_ad_rules` says so.
- **Lead follow-up follows the gate.** Texts only where the consent check passes, and email by default. Send one message with /hi5-re-crm job 11 after the member approves the exact text.
- Write in the member's Voice Profile. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.
- Never use a browser tool or scraping on any listing site, social platform, or ad library. The member gives you the numbers and the ads.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`, `voice_profile_page_id`, `crm_map_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Ad Campaign, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

From the profile, read: `client_categories`, `brokerage`, `states_licensed`, `primary_market`, `niche`, `differentiator`, `proof_point` and `proof_point_public`, `brand_color`, `brand_font`, `sms_consent_status`, the Voice Profile, the CRM Map (`consent_source`), and the Compliance Guardrails page.

## Step 1: Scan

Read what the job needs and say in one or two lines what you found and what is missing.

## Step 2: Choose the job

Ask what the member wants. If they already said, go straight to it.

> **Plan**
> 1. Campaign brief and setup sheet
>
> **Ad packs**
> 2. Seller ads (home value, neighborhood expert, or an expired-seller offer)
> 3. Listing and open house ads
> 4. Buyer and relocation ads
> 5. A retargeting sequence
> 6. Google search ads
>
> **After the click**
> 7. The 5-minute follow-up for ad leads
>
> **Improve**
> 8. The weekly ad review and creative tests
> 9. Audit an ad or a page I already have

Run the job as written in `references/jobs.md`. For the landing page and the full funnel, point to /hi5-funnel (if Marketing OS is installed). For the matching letter to the owner of an expired listing, point to /hi5-re-prospect. For the listing copy and MLS remarks, point to /hi5-re-listing-launch.

## Step 3: Save

Offer to save the result as a row in the Marketing Hub: Type "Ad Campaign", Status "Draft", Source Skill `/hi5-re-ads`, today's date, and a title like "[Offer or area]: Meta ads" (or Setup sheet, Listing ads, Buyer ads, Retargeting, Google ads, Lead follow-up, Weekly review, or Ad audit). The full text goes in the row's page body, with no audience lists, no contact details, and no account numbers. Save only when the member says yes. Never create a database.

## NEXT STEP

Recommend ONE next step. After the setup sheet, suggest the ad pack for the offer. After an ad pack, suggest the 5-minute follow-up (job 7) so leads are never left waiting. After a week of results, suggest the weekly review. If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
