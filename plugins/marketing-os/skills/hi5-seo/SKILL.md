---
name: hi5-seo
description: Builds a local SEO strategy and Google Business Profile optimization plan for the member's market. Identifies keyword opportunities, GBP improvements, and content gaps. Works for any industry. Triggers when the user runs /hi5-seo, says "improve my SEO", "Google Business Profile", "local SEO", or "rank higher in my market".
---

# Hi5 SEO: Local SEO Strategy

## Purpose
Help the member get found online in their market through Google Business Profile optimization, local keyword strategy, and content recommendations.

## Core Rules
- Read the Master Profile for market, niche, website, languages, and Google Business Profile status.
- One question at a time.
- Focus on local SEO, not generic national strategies, unless the member serves a fully online audience.
- Read Google Business Profile status from `gbp_status` in the Business Numbers section. Never read it from the plan text. If it is missing, ask once and save it there.
- Never suggest blog topics or keywords that conflict with the Compliance Guardrails. For example, no claims about school quality, safety, or who lives in an area. Reframe them as neutral, verifiable information with a pointer to the official source.
- **Languages.** If the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as an opportunity to reach more people. Write the second version natively, not as a word for word translation. For SEO this is a major opportunity: suggest keywords, Google Business Profile posts, and blog topics in each language the member speaks.
- Save the strategy to the Marketing Hub in Notion.

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

## OUTPUT (all industries)

Generate a complete local SEO strategy:

### 1. Google Business Profile Audit
Based on `gbp_status`: specific action items. A profile completeness checklist, category recommendations, photo strategy, review generation system, post frequency, and Q&A strategy.

### 2. Local Keyword Targets
15 to 20 specific keyword phrases, built from the member's services or client types and their market and nearby areas. Include a set in each other language the member speaks.

### 3. Content Gap Analysis
3 to 5 blog post topics for local SEO, with a mix of guides, local resources, and answers to the questions their clients ask. Follow the Compliance Guardrails.

### 4. Quick Wins (do this week)
3 to 5 immediate actions that move the needle fastest based on their current status.

### 5. 90 Day SEO Roadmap
Month by month actions to build local authority.

## STORAGE

Save to the Marketing Hub (`marketing_hub_db_id`) as one row: Title is "Local SEO Strategy" and the date, Type is SEO Strategy, Status is Draft, Source Skill is /hi5-seo, Date is today, and the full strategy is in the page body. Save `google_reviews` (the review count) in the Presence section of the Master Profile.

## NEXT STEP

> "Next: put your keywords to work on your website. Run /hi5-website and I will write your pages around them. To start on blog content instead, run /hi5-blog. You can run /hi5-next any time and I'll tell you your best next step."
