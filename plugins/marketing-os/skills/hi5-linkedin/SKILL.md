---
name: hi5-linkedin
description: Creates LinkedIn content from the member's existing videos, blog posts, or ideas. Formats content specifically for LinkedIn's professional audience with the member's brand voice. Works for any industry. Triggers when the user runs /hi5-linkedin, says "write LinkedIn posts", "LinkedIn content", or "post to LinkedIn".
---

# Hi5 LinkedIn: LinkedIn Content Creator

## Purpose
Turn existing content into LinkedIn-optimized posts. LinkedIn rewards professional insight, personal story, and conversation starters over promotional content.

## Core Rules
- Read the Master Profile for voice, niche, and behavioral style.
- LinkedIn posts are professional but personal, not corporate.
- Never repurpose Instagram captions directly to LinkedIn.
- Save to the Marketing Hub in Notion.
- **Languages.** If the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as an opportunity to reach more people. Write the second version natively, not as a word for word translation.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
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

Generate 3 LinkedIn post variations for each piece of content:

### Version 1: Insight Post
A professional insight or observation. Leads with a bold statement or surprising fact. Ends with a question to drive comments.

### Version 2: Story Post
A personal story from their experience. Vulnerable, real, and human. Ends with a lesson or takeaway.

### Version 3: Value Post
Practical tips or steps their LinkedIn audience can use. List format or short paragraphs. Ends with a CTA to connect or send a message.

Each post:
- 150 to 300 words
- No hashtag stuffing: 3 to 5 relevant tags maximum
- First line designed to stop the scroll
- Formatted for LinkedIn readability (short paragraphs, line breaks)

## STORAGE

Save to the Marketing Hub (`marketing_hub_db_id`) as one row: Title names the source content, Type is LinkedIn Posts, Status is Draft, Source Skill is /hi5-linkedin, Date is today, and the three posts are in the page body. If the posts came from a Content Planner item, also fill its Related To field with that item's title.

> "Your LinkedIn posts are saved to your Marketing Hub. These tend to work best posted Tuesday through Thursday between 8am and 10am in your timezone."

## NEXT STEP

> "Next: want captions for your other platforms too? Run /hi5-social and I will format this content for each one. You can run /hi5-next any time and I'll tell you your best next step."
