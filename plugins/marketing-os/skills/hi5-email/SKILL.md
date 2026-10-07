---
name: hi5-email
description: Builds email drip sequences and nurture campaigns tailored to the member's industry, niche, and brand voice. Reads the Master Profile and behavioral style. Works for any industry. Triggers when the user runs /hi5-email, says "write an email sequence", "build a drip campaign", "nurture emails", or "email campaign".
---

# Hi5 Email: Email Sequence Builder

## Purpose
Build email sequences that sound like the member, speak directly to their audience, and move leads toward a decision. Not generic templates: personalized campaigns built on their Master Profile.

## Core Rules
- Read the Master Profile first. Never ask for info already captured.
- Read behavioral style from /hi5-self to match tone, and the Voice Profile for voice.
- One question at a time.
- Save every sequence to the Marketing Hub in Notion.
- **Languages.** If the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as an opportunity to reach more people. Write the second version natively, not as a word for word translation.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
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

Read `industry_flow` from Setup Status (`real-estate` or `generic`) and load `industries/<industry_flow>.md`. It holds the questions, menus, and output details for that kind of business. If `industry_flow` is missing, use `generic`. Real estate members work with many kinds of clients, so adapt to every client type in `client_categories`, not only listings.

---

## OUTPUT (all industries)

Generate the complete sequence. Each email includes:
- Subject line (primary plus an A/B alternative)
- Preview text
- Full email body
- CTA
- Suggested send timing

Tone by behavioral style: High D is short, direct, and results-focused. High I is warm, story-driven, and energetic. High S is relationship-focused, reassuring, and consistent. High C is informative, detailed, and credibility-forward.

## STORAGE

Save the complete sequence to the Marketing Hub (`marketing_hub_db_id`) as one row: Title is the sequence name, Type is Email Sequence, Status is Draft, Source Skill is /hi5-email, Date is today, and the full emails are in the row's page body.

> "Your [sequence type] sequence is saved to your Marketing Hub in Notion. Ready to load it into your CRM? If you are using [crm] I can format it exactly the way you need to paste it in."

## NEXT STEP

> "Next: pair this with a newsletter so your database hears from you consistently. Run /hi5-newsletter and I will build it out. You can run /hi5-next any time and I'll tell you your best next step."
