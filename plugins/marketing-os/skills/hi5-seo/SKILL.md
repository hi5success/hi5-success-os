---
name: hi5-seo
description: Your local SEO hub. Opens by asking what you want to improve, then runs the right check, such as a Google Business Profile audit, a website audit through /hi5-site-audit, a directory and listing consistency check, reviews, a keyword and content plan, or an AI search visibility check. Reads your website platform, Google Business Profile status, and languages from your profile and never re-asks them. Works for any industry. Triggers when the user runs /hi5-seo, says "improve my SEO", "Google Business Profile", "local SEO", "check my listings", "get more reviews", or "rank higher in my market".
---

# Hi5 SEO: Your Local SEO Hub

## Purpose
Help the member get found online in their market. Ask what they want to improve, run that check, and give a short plan they can act on. Local SEO is much more than the Google Business Profile, so this hub covers the profile, the website, listings, reviews, keywords and content, and AI search visibility.

## Core Rules
- Read the Master Profile first. **Never re-ask** what it has: the Google Business Profile status (`gbp_status` in Business Numbers), the website address and platform (`website`, `website_platform`), and the languages the member serves (`languages`). If a detail the skill needs is missing, ask once, save it, and continue.
- One question at a time.
- **Free tools only.** Use built-in web reading and web search and free Google tools. Never recommend a paid platform.
- **Public pages only.** Read single public pages one at a time. Never scrape, never try to get around a site that blocks you, and never ask for a password. If a page cannot be read, say so and give the member a short manual check with screenshot help.
- Never claim you checked something you could not read. Be honest about what a check can and cannot tell them.
- **Fair Housing and compliance.** School district and neighborhood topics are allowed as content. Describe the place, the homes, and the amenities, and point to official sources for schools. Never rate or describe the quality of schools, and never describe who lives in an area or who a place suits. Follow the member's Compliance Guardrails page.
- **Languages.** If the member serves other languages, offer keywords, Google Business Profile posts, and content in those languages, written natively, as a real opportunity.
- Save results to the existing Marketing Hub in Notion. Never create a new database.
- When you send the member outside Claude (Google, a directory, their site), give numbered steps, offer screenshot help ("send me a screenshot and I'll tell you exactly what to click"), never assume menu names, and wait for them to finish each step.
- Follow the member's Voice Profile. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.

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

## Step 1: Read what you already know

From the Master Profile: `gbp_status` (Business Numbers), `gbp_url`, `google_reviews`, `website`, `website_platform`, `languages`, `languages_published`, `primary_market`, `surrounding_areas`, `niche`, `client_categories`, `business_name`, `nap_name`, `nap_address`, `nap_phone`, `crm`, `last_site_audit`, `last_citation_check`. From the Marketing Hub: the newest rows of Type SEO Strategy and SEO Audit.

Say what you already know in one line, for example: "I already know your Google Business Profile is [status], your site is on [platform], and you serve [languages]. Let's build on that."

## Step 2: Ask what to improve

> "What do you want to improve?
>
> A) My Google Business Profile
> B) My website (a page by page audit)
> C) My listings on other sites: name, address, and phone consistency
> D) My reviews
> E) My keywords and content plan
> F) Whether AI search (ChatGPT, Perplexity, Google's AI answers) mentions me
> G) Not sure: you pick"

If they choose G, recommend ONE and say why: if `gbp_status` says they have barely started or have no profile yet, start with A. Otherwise if there is no SEO Audit row, B. Otherwise if `last_citation_check` is empty, C. Otherwise D, then E, then F.

## Step 3: Run the module

Read the module file for their choice and follow it:
- A: `modules/gbp.md`
- B: tell them you'll hand this to /hi5-site-audit and ask if they want to start it now. Do not run the audit yourself.
- C: `modules/directories.md`
- D: `modules/reviews.md`
- E: `modules/keywords.md`
- F: `modules/ai-visibility.md`

The industry file supplies the directory list, the category and keyword ideas, and the content topics for their kind of business.

## Saving (every module)

Save to the Marketing Hub (`marketing_hub_db_id`) as one row per run: Title names the check and the date (for example "Google Business Profile Audit, Oct 6"), Type is SEO Strategy, Status is Draft, Source Skill is /hi5-seo, Date is today, and the full results are in the page body. Update the matching profile fields named in the module (for example `gbp_url`, `nap_name`, `nap_address`, `nap_phone`, `google_reviews`, `languages_published`, `last_citation_check`), inserted inside the Presence section before the Linked pages heading. Never create a new database.

## Next

After each module, offer ONE next step: if there is no SEO Audit row, "Next: run /hi5-site-audit to check your website page by page." Otherwise, "Next: run /hi5-website to rewrite weak pages around your keywords, or /hi5-blog to write posts for them." Then say: "You can run /hi5-seo again any time to work on another area, and /hi5-next any time and I'll tell you your best next step."
