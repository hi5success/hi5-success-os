---
name: hi5-website
description: Writes or rewrites website page copy for the member's business website. Covers Home, About, service or client-type pages, and Contact. Tailored to their market, niche, brand voice, and personality. Works for any industry. Triggers when the user runs /hi5-website, says "write my website copy", "rewrite my about page", "website content", or "write my home page".
---

# Hi5 Website: Website Copy Writer

## Purpose
Write website copy that converts visitors into leads. Every page is written in the member's voice, for their specific market and niche, with a clear call to action.

## Core Rules
- Read the Master Profile for all business details. Never ask for what is already stored.
- Match behavioral style for tone.
- Every page needs one clear CTA.
- Save all copy to the Marketing Hub in Notion.
- **Languages.** If the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as an opportunity to reach more people. Write the second version natively, not as a word for word translation.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Ad Campaign, Property Plan, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
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

## PAGE FRAMEWORKS (all industries)

Read sections 1, 5, and 7 of `../hi5-funnel/references/frameworks.md` and apply them to every page:
- **Home and service pages: decide first, prove below.** The first screen works alone: who it is for, a headline with the small result, a subhead, three bullets on what changes, one piece of proof, and one button.
- **About page: tell a short belief-shift story.** What you used to believe, what changed your mind, the better approach, what happened, and why you do this.
- **Add a "who this is for and not for" block** to service pages. The "not for" list builds trust.
- **Questions section:** build it from the member's real objections (the Objection Bank for real estate members, or what they hear on calls).
- **Proof:** concrete results with context, only from what the member supplies. Mark gaps `[PROOF NEEDED]`.
- Run the quick clarity test on each headline and the checklist in `../hi5-funnel/references/quality-gates.md`.
- For a landing page for one offer, or a whole funnel, suggest /hi5-landing or /hi5-funnel.

## SEO inputs (all industries)

Before writing a page, read the newest SEO Audit row and the newest SEO Strategy row in the Marketing Hub (`marketing_hub_db_id`), if they exist. Use the audit's fix list for that page (title, meta description, H1, local keywords, schema, internal links, language setup, and any compliance wording to fix) and the strategy's target keywords. If neither exists, suggest /hi5-site-audit and /hi5-seo, and write the page without them.

For every page, also write: the page title (about 50 to 60 characters, leading with what the page is about and the place when it is local), the meta description (about 120 to 160 characters), one H1, and suggested internal links to the member's other key pages. If the member serves other languages and the audit shows missing language pages, offer to write the page natively in each language.

## STORAGE

Save each page to the Marketing Hub (`marketing_hub_db_id`) as its own row: Title is the page name, Type is Website Copy, Status is Draft, Source Skill is /hi5-website, Date is today, and the copy is in the page body. Write the full website disclosure line (`disclosure_line_full`) and any required notices in the footer copy.

> "Your website copy is saved to your Marketing Hub. Want me to write landing page copy for your lead magnets next? Run /hi5-landing and I will build those out."

## NEXT STEP

> "Next: run /hi5-email to build the follow-up sequence for the people your website brings in. For a landing page for one offer, run /hi5-landing. You can run /hi5-next any time and I'll tell you your best next step."
