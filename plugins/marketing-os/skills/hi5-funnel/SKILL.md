---
name: hi5-funnel
description: Builds a complete funnel for any offer in any industry. Writes an Offer Brief, the result ladder, one core message, a compliant ad pack, the landing page, the thank-you page, and the follow-up emails, then gives step by step instructions for building it in the member's platform. Also audits a pasted page, ad, or email with before and after rewrites. Reads the member's offers, voice, proof points, and compliance rules from their profile and follows the rules for their industry, including endorsement and testimonial rules, limits on health and income claims, and Meta Special Ad Categories. Drafts only, and never connects to an ad account or publishes. Triggers when the user runs /hi5-funnel, says "build a funnel", "lead magnet funnel", "write my ads and landing page", "audit my landing page", or "why isn't my page converting".
---

# Hi5 Funnel: Offer to Ads to Page to Emails

## Purpose
Turn any offer into a working funnel: one clear message, a free resource or direct offer, compliant ads, a landing page, a thank-you page, and a follow-up email sequence. It works for every industry. Real estate specifics load only for real estate members. It can also audit an existing page, ad, or email.

## Core Rules
- **Every industry.** The flow below is the same for everyone. Real estate rules, funnel types, and vocabulary live only in `industries/real-estate.md` and load only when `industry_flow` is `real-estate`. Everyone else uses `industries/generic.md`, a full adapter that builds the funnel menu from the member's own offers.
- **Drafts only.** Never connect to an ad account, publish, post, or send. Never ask for a password. Build-it steps are instructions the member follows themselves.
- **Never invent proof.** Use only testimonials, numbers, results, and credentials the member supplies. Mark gaps `[PROOF NEEDED: what is missing]`. Proof marked internal never appears in a public asset.
- **Follow the rules for the member's industry.** Load them from the profile (see Compliance by industry below). The rules in `references/compliance-by-industry.md` and `references/meta-special-categories.md` always apply.
- **Disclosure.** Every page and every email ends with the member's `disclosure_line_full` and any `required_notices` they use on the web. Ads carry `disclosure_line_short` where there is room, or link to a page with the full line.
- **Lead magnet and examples come from the member's own offer.** Never use a fixed list from any industry.
- Write everything in the member's voice (Voice Profile) and tailor tone to their behavioral style. Plain language, short paragraphs.
- One question at a time. Ask only what is missing, once each, and save it.
- Give options and pick a winner with one line of reasoning. Show the section's job so the member can build it in any builder.
- Run the quality gates before presenting any asset.
- Restate every idea in the member's own situation. Never reuse sample wording from the reference files, and never name where an idea came from.
- Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **No page yet.** If the Compliance Guardrails page does not exist, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

## Loading the Industry Flow

Read `industry_flow` from Setup Status. If it is `real-estate`, load `industries/real-estate.md`. For every other value, or if it is missing, load `industries/generic.md`. Do not load the real estate file for anyone else.

## Compliance by industry

Read `references/compliance-by-industry.md` and `references/meta-special-categories.md`. They tell you which rules apply from `offer_categories` (ask once and save it if missing). In short: endorsement and testimonial rules apply to everyone, health claims are limited for health and wellness, income claims are limited for coaching, business opportunities, and recruiting, and Meta Special Ad Categories apply to housing, employment, credit and financial products, and social issues, elections, or politics.

---

## Modes

Ask which the member wants if it is not clear:
- **Build a funnel** (the default).
- **Audit** a page, ad, or email they already have (see Audit mode).

## Step 1: The Offer Brief

Never write copy without a brief. Read the profile first and ask only for what is missing, in one short batch.

Read: `business_name`, `industry`, `niche`, `offer`, `offers`, `client_situations`, `differentiator`, `proof_point` and `proof_point_public`, `client_words`, the Voice Profile, `behavioral_style`, `primary_market`, `website_platform`, `crm`, `sms_consent_status`, and the compliance fields. Then the industry file builds the funnel menu.

The brief covers: brand and voice; who buys and in what situation (each kind of buyer); the offer (name, type, price, how it is delivered, how soon the first benefit arrives); the buyer's situation now; what they already tried; the proof available and which is public; where the traffic comes from (cold ads, social, an email list, past customers); the offer path and guarantee preference (or "recommend one"); what to build and on which platform; and the compliance categories (`offer_categories`).

Restate the brief in a compact block and let the member correct it before building. Save new answers to the profile (Business section) as they come: `offers`, `offer_categories`.

## Step 2: The result ladder

For each kind of buyer, define the four steps in `references/frameworks.md` (section 2): a first win, a small result, a milestone, and a big change. Lead with the small result. Where outcomes differ between people, segment them and describe what the process produces, never what the person will earn or gain. Where the compliance rules limit outcome claims, describe what the member does or provides.

## Step 3: Listen to the customer

Gather real phrases (section 3 of the frameworks): the member's reviews, the questions and objections they hear (the Objection Bank for real estate members), anything the member pastes, and public pages where buyers ask for help. Extract how they describe the pain, what they want, what they tried, and what makes them hesitate. Use those words in hooks, headlines, and bullets. Never reuse private details or names.

## Step 4: Check and shape the offer

Run the four-lever check, turn obstacles into named pieces, tie each bonus to a worry, and name the offer (section 4). Each weak spot becomes an improvement, a bonus, or better wording.

## Step 5: Offer path and guarantee

Read `references/offer-paths.md`. Present the paths that fit, recommend one with the tradeoff in a line, and state its honesty rule. Then choose a guarantee path within the compliance overrides. Put the terms near the final button.

## Step 6: The core message

Write the statement, ten versions, choose three, and show the quick clarity test (section 5). Add the supporting pieces (the old way, the belief shift, how it works, the guide line, the cost of waiting) and the versions for every place. The old way is always an outdated method, never a person or competitor.

## Step 7: The funnel map

Show the funnel as a short table for the chosen audience: the traffic source and how ready those people are, the ad or content hook, the sign-up or offer page, the thank-you page, the follow-up emails, and the one action the funnel drives. Say how ready the buyer is at each step and what that means for page length (section 6). Get the member's OK before building.

## Step 8: Build the assets, one at a time

Build each asset, run the quality gates on it, and save it. Use the structures in the frameworks file.

1. **Ad pack.** Three to five angles with two or three hooks each, the body, headline, description, creative direction, and the message match with the page. Then add the launch checklist from `references/meta-special-categories.md` for the category that applies (or the general check for ads outside a category). Every ad ends with the short disclosure line where there is room. Offer Google ad headlines too if the member wants them.
2. **Landing page.** The sign-up page for a free resource, or the offer page for a direct offer. Choose the length from how ready the traffic is. Form: name and email, and a phone number only if the member's texting consent is documented, with the consent checkbox wording. End with the full disclosure line and required notices.
3. **Thank-you page.** Confirm what they did, show how to get the first win in ten minutes, say what arrives when, and give one next step (such as booking a call). End with the disclosure line.
4. **Follow-up emails.** Five to seven emails after a free resource, or the right sequence for the offer path (after a purchase, for an event, or for members). Each email has three subject lines, preview text, the body, the button, and the send timing. Every email ends with the full disclosure line, any required notices, and an unsubscribe line.
5. For a product offer, add the checkout page text.

## Step 9: Quality gates

Read `references/quality-gates.md`. Run the copy checklist and the compliance gates for the rules that apply. Fix every failure before presenting an asset.

## Step 10: Save

1. Make sure the Marketing Hub's Type select has an option called **Funnel**. Read the database's current Type options. If Funnel is missing, ask once: "I'd like to add a 'Funnel' label to your Marketing Hub so your funnels are easy to find. OK?" If they agree, update the existing Type property to keep every current option and add Funnel. If they say no, or the change fails, use Type Other and start each Title with "Funnel". Never create a new database.
2. Save one row per asset in the existing Marketing Hub, all with Type Funnel, Status Draft, Source Skill /hi5-funnel, and Date today. Titles: "[Funnel name]: Plan" (brief, ladder, message, map), "[Funnel name]: Ads", "[Funnel name]: Landing page", "[Funnel name]: Thank-you page", and "[Funnel name]: Emails". The full text goes in each row's page body.
3. Save any new profile answers (`offers`, `offer_categories`, `website_platform`).

## Step 11: Build it

Offer: "Want step by step instructions to build this in your platform?" If yes, read `references/build-it.md` and give the steps for their platform, one at a time, with screenshot help. Instructions only. Never connect to their account or publish anything.

---

## AUDIT MODE

When the member shares a page, an ad, or an email to review:
1. Read the Offer Brief fields you need (ask only what is missing). If they give a public web address, read that page. Otherwise ask them to paste the copy.
2. Run `references/quality-gates.md`: every item in the copy checklist and every compliance gate that applies. Mark each pass or fail.
3. Give a score from 1 to 10 and the three most important fixes.
4. Quote the weakest lines, say why each fails, and show before and after for the headline, subhead, first screen, and button at minimum (for an ad or email, the hook or subject line and the opening).
5. Never add a claim the member did not supply.
6. Offer to save the audit as a Marketing Hub row (Type Funnel, Title "Audit: [name]").

## Next

End with: "Next: build the funnel in your platform using the steps above, then run /hi5-email if you want to adjust the follow-up emails, or /hi5-landing for another page. You can run /hi5-next any time and I'll tell you your best next step."
