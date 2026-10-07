---
name: hi5-landing
description: Writes landing page copy and structure for lead magnets, opt-ins, and campaign pages. Designed to convert traffic into leads with a single focused CTA. Triggers when the user runs /hi5-landing, says "write a landing page", "lead magnet page", "opt-in page", or "build a landing page".
---

# Hi5 Landing — Landing Page Copy Writer

## Purpose
Write high-converting landing pages for lead magnets, buyer and seller guides, home valuation offers, workshop registrations, and any campaign that needs a dedicated page.

## Core Rules
- Read Master Profile for market, niche, and voice
- Landing pages have ONE goal and ONE CTA — never multiple
- Every element serves the conversion
- Real estate landing pages should be specific to the offer and the local market
- Save to Notion Marketing Hub

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page → tell the member to run /hi5-setup first, then stop. More than one → ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it. End every public-facing piece with the member's `disclosure_line`, exactly as saved. If the page does not exist yet, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] at the end of each public piece. If a request would break a rule, say which rule and offer a compliant alternative.

---

## OPENING

> "A great landing page does one thing — converts visitors into leads. Let's build yours. What is the offer or lead magnet this page is for?"
>
> A) Free home valuation
> B) Buyer guide or home buying checklist
> C) Seller guide or home selling checklist
> D) Market report for my area
> E) Workshop or webinar registration
> F) Free consultation or strategy call
> G) Something else — I will describe it

---

## QUESTIONS

**Q1 — Traffic Source**
> "Where will traffic be coming from?"
>
> A) Facebook or Instagram ads
> B) Google ads
> C) My YouTube channel
> D) Organic social
> E) Email campaign
> F) Multiple sources

**Q2 — Audience**
> "Who is this page for specifically?"
>
> A) Buyers in my market
> B) Sellers or homeowners
> C) Investors
> D) First time buyers
> E) General — anyone in my market

---

## OUTPUT

Generate complete landing page copy:

### Structure:
- Headline (3 options — benefit-driven, curiosity-driven, direct)
- Subheadline
- Hero section body (2-3 sentences max)
- What you get section (3-5 bullet points)
- Who this is for section
- Social proof placeholder
- About the agent section (short, credibility-focused)
- Form headline
- CTA button copy (3 options)
- Below the fold trust elements

### Also include:
- Facebook ad headline to match the page (3 options)
- Google ad headline to match the page (3 options)

Tone matched to traffic source and audience.
Local market specifics woven throughout.

---

## STORAGE

Save to Notion Marketing Hub.

> "Your landing page copy is saved to your Marketing Hub. If you are running ads to this page run /hi5-ads-copy next and I will write ad creative that matches the landing page message."
