---
name: hi5-newsletter
description: Builds a weekly or monthly newsletter for the member's database. Pulls from their content, market, and brand voice to create a consistent touchpoint that keeps them top of mind. Works for any industry. Triggers when the user runs /hi5-newsletter, says "write my newsletter", "build a newsletter", or "monthly email".
---

# Hi5 Newsletter: Newsletter Builder

## Purpose
Create a consistent newsletter that keeps the member top of mind with their database. Each issue combines useful insight, a personal story or content, and a clear CTA, all in their voice.

## Core Rules
- Read the Master Profile for market, niche, voice, and platforms.
- Match behavioral style and the Voice Profile for tone.
- One question at a time.
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

## NEWSLETTER SETUP (first time only)

If `newsletter_name` is not in the Master Profile, ask the setup questions in the industry file (frequency, name, audience). Save `newsletter_name`, `newsletter_frequency`, and `newsletter_audience` in the Presence section of the Master Profile so you never ask again.

## OUTPUT (all industries)

Generate a complete issue:
- Subject line (3 options)
- Preview text
- Header and greeting (personal, first name basis)
- Main story or insight (300 to 500 words)
- Snapshot section (3 to 5 bullets, as described in the industry file)
- Feature or resource (optional placeholder)
- Personal note from the member (short, warm, human)
- CTA (one clear action)
- Footer with contact info placeholder

Tone matched to behavioral style and audience.

## STORAGE

Save to the Marketing Hub (`marketing_hub_db_id`) as one row: Title is the newsletter name and issue number, Type is Newsletter, Status is Draft, Source Skill is /hi5-newsletter, Date is today, and the full issue is in the page body.

## NEXT STEP

> "Next: want to turn this issue into social captions? Run /hi5-social and I will pull 3 or 4 posts from it."
