---
name: hi5-landing
description: Writes landing page copy and structure for lead magnets, opt-ins, and campaign pages. Designed to convert traffic into leads with a single focused CTA. Works for any industry. Triggers when the user runs /hi5-landing, says "write a landing page", "lead magnet page", "opt-in page", or "build a landing page".
---

# Hi5 Landing: Landing Page Copy Writer

## Purpose
Write high-converting landing pages for lead magnets, guides, valuation or quote offers, workshop registrations, and any campaign that needs a dedicated page.

## Core Rules
- Read the Master Profile for market, niche, and voice.
- Landing pages have ONE goal and ONE CTA. Never multiple.
- Every element serves the conversion.
- Save to the Marketing Hub in Notion.
- **Languages.** If the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as an opportunity to reach more people. Write the second version natively, not as a word for word translation.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **No page yet.** If the Compliance Guardrails page does not exist, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

## Loading the Industry Flow

Read `industry_flow` from Setup Status (`real-estate` or `generic`) and load `industries/<industry_flow>.md`. It holds the questions, menus, and output details for that kind of business. If `industry_flow` is missing, use `generic`. Real estate members work with many kinds of clients, so adapt to every client type in `client_categories`, not only listings.

---

## QUESTIONS (all industries)

**Q1: Traffic source**
> "Where will traffic be coming from?
>
> A) Facebook or Instagram ads
> B) Google ads
> C) My YouTube channel
> D) Organic social
> E) Email campaign
> F) Multiple sources"

## OUTPUT (all industries)

Generate complete landing page copy:
- Headline (3 options: benefit-driven, curiosity-driven, direct)
- Subheadline
- Hero section body (2 to 3 sentences max)
- What you get (3 to 5 bullets)
- Who this is for
- Social proof placeholder
- About the member (short, credibility-focused)
- Form headline
- CTA button copy (3 options)
- Below the fold trust elements, including the full disclosure line and required notices

Also include a matching Facebook ad headline (3 options) and Google ad headline (3 options). Ads for restricted categories (such as housing) must follow the Compliance Guardrails: say which rules apply and have the member check the platform's current policy before launch.

Tone matched to traffic source and audience.

## STORAGE

Save to the Marketing Hub (`marketing_hub_db_id`) as one row: Title names the offer, Type is Landing Page, Status is Draft, Source Skill is /hi5-landing, Date is today, and the copy is in the page body.

## NEXT STEP

> "Next: run /hi5-email to build the follow-up sequence for the leads this page captures. Ad copy writing is coming soon."
