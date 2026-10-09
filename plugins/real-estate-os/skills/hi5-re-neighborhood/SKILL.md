---
name: hi5-re-neighborhood
description: Builds and keeps current the neighborhood fact file for each area a real estate member serves, the reference page every other Hi5 skill reads. Scans the existing fact file, saved pages, CRM, and anything the member pastes first, then interviews only for gaps. Puts a source and a date on every fact, refreshes stale or unverified facts, converts old verify marks, adds notes for rentals, investors, commercial, land, new construction, 55+ communities, luxury, and relocation, writes a where-to-verify sheet, and drafts content angles and a Living in guide outline. Describes the place, the homes, and the amenities only, never who lives in an area, never rates schools or safety, and points to official sources instead. Never scrapes or pulls statistics from listing sites, and changes the member's page only after showing a plan and getting an OK. Real estate only. Triggers when the user runs /hi5-re-neighborhood, says "area fact file", "neighborhood profile", "refresh my neighborhood", "verify my area facts", or "Living in guide".
---

# Hi5 Neighborhood: Area Fact Files With a Source and a Date on Every Fact

## Purpose
Keep a trustworthy fact file for every area the member serves, so listings, buyer plans, ads, posts, and emails draw on real local detail that is current and verified. The file describes the place, the homes, and the amenities. Every number carries its source and date, and nothing is invented.

## Core Rules
- **Real estate only.** Read `industry_flow` from Setup Status. If it is not `real-estate`, say "This skill is for real estate members. For your business, run /hi5-next and I'll point you to the right step." Then stop.
- **Read `../hi5-re-crm/references/guardrails.md`, `templates/fact-file.md`, and `../hi5-re-listing-launch/references/fair-housing-scan.md` first, every time.** If a file cannot be found, tell the member the Real Estate OS plugin may be incomplete and stop.
- **Scan first, then ask.** Before asking anything, read the existing Neighborhood page for the area (and the `neighborhoods` entry in the Page IDs), the profile (`primary_market`, `niche`), earlier Marketing Hub rows that mention the area, CRM tags and notes with the area name (through the route /hi5-re-crm uses, read only), and what the member pasted (an MLS export, a CMA, an official page). Say in one or two lines what you found, for example "I found your Zilker page with 14 facts, 9 marked verify, and a last update in June." Interview only for gaps, 4 questions at a time, and point to what you found. Never ask what the data already answers.
- **Never describe who lives in an area.** No "family-friendly", "quiet crowd", "up and coming", "good for professionals", "safe", or "great schools". If a member asks for it, say which rule applies and describe the place, the homes, and the amenities instead.
- **Never rate schools or safety.** For schools, point only to the school district's own address lookup. For safety, point only to the local police department's public data. Never name a rating body or a third-party site, and never point to census or demographic data about residents.
- **Name only the agencies and sites the member named.** Otherwise say "the local police department", "the county appraisal office", or "the school district" without a name. Never supply a website, an agency name, or a program from memory, even when you know the member's market.
- **Every number needs a source and a date.** The source is whatever the member gave you (their MLS export, a page they pasted, their own sales), and the date is the date of the data. If either is missing, the fact stays "Needs verification". Never fill in a source, a date, a price, a trend, days on market, a tax rate, a commute time, or an appreciation figure. Never predict the market.
- **Risks (flood, drainage, noise, soil, environmental) are never stated as settled.** Write "verify with the official source" and put the question on the where-to-verify sheet.
- **No scraping and no browser steps.** Never pull statistics from Zillow, Redfin, or any listing site, and never use a browser tool. Numbers come from the member, an MLS export they paste, or an official page they paste.
- **Plan, OK, then write.** Show every change to the member's page as a table (Section | Before | After) and wait for the member's OK. Never delete a fact without showing it first. Never create a second page for an area. Change only the Neighborhood page and the `neighborhoods` entry.
- Fact file text and drafts follow the Compliance Guardrails page and the Voice Profile. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`compliance_page_id`, `voice_profile_page_id`, `crm_map_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

From the profile, read: `client_categories`, `primary_market`, `niche`, `states_licensed`, `neighborhoods`, the Voice Profile, and the Compliance Guardrails page (`protected_class_jurisdictions`, `brokerage_ad_rules`).

## Step 1: Scan

Read the area's page and what the member gave you, and say in one or two lines what you found and what is missing. If there is no page for the area, say so and offer job 1.

## Step 2: Choose the job

Ask what the member wants. If they already said, go straight to it.

> 1. Build or extend a fact file
> 2. Refresh and check a fact file
> 3. Add notes for a client type (rentals, investors, commercial, land, new construction, 55+, luxury, relocation)
> 4. The where-to-verify sheet
> 5. Content angles and a Living in guide outline

Run the job as written in `references/jobs.md`. For the finished copy, point to /hi5-social, /hi5-blog, /hi5-website, /hi5-seo, and /hi5-re-listing-launch (if Marketing OS or Content OS is installed). For the market pulse on the member's own MLS, point to /hi5-re-daily (job 8).

## Step 3: Save

After the member approves the change plan, update the existing page (or create the one page for a new area as a child of the Master Profile named "Neighborhood – [Name]", and add it to the `neighborhoods` entry in the Page IDs section as `Name = page id`). Set `last_updated` to today and set `refresh_by` to the date the member chose (see job 2). Update Setup Status `stage_5_neighborhoods` only if it is not already complete. Never create a database.

## NEXT STEP

Recommend ONE next step. After a build, suggest the where-to-verify sheet so the unverified facts get checked. After a refresh, suggest the content angles (job 5). After content angles, suggest a skill that writes the copy (for example /hi5-social for the video hooks, or /hi5-re-listing-launch for the next listing in this area). If `disclosure_line_full` is missing, recommend /hi5-setup and Continue setup (Stage 2) first.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
