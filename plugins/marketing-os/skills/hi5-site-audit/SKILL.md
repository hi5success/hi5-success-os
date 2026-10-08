---
name: hi5-site-audit
description: Audits the member's live website page by page and gives a prioritized SEO fix list. Checks titles, meta descriptions, headings, local keywords, schema, internal links, broken links, mobile and speed using Google's free PageSpeed Insights, multilingual pages, and Fair Housing and compliance language in the copy. Detects the website platform (GoHighLevel, Astro, WordPress, or other) and gives platform-specific fix steps. Works for any industry. Saves results to the Marketing Hub and compares them with the last audit. Triggers when the user runs /hi5-site-audit, says "audit my website", "check my site", "SEO audit", or "why isn't my site ranking".
---

# Hi5 Site Audit: Page by Page SEO Check

## Purpose
Read the member's live website, find what is holding it back in search, and give a short prioritized fix list they can act on, with steps for the platform their site is built on. Re-run it after every site change to see progress.

## Core Rules
- **Read only.** Never change the member's website. You read public pages and report.
- **Free tools only.** Use your built-in web reading and web search, and Google's free PageSpeed Insights. Never recommend a paid platform.
- **Public pages only.** Read single public pages one at a time. Do not run automated crawlers or scrape sites, and do not try to get around a site that blocks you. If a page cannot be read, say so and ask the member to paste what they see or send a screenshot.
- **Show evidence.** For every finding, name the page, say what you found, and say why it matters. Never claim something you did not read.
- **Be honest about limits.** You cannot see Google Search Console data, rankings, or private settings. Say what the audit can and cannot tell them.
- **Prioritize.** Give a short list, not a dump. Fair Housing and compliance findings are always High priority.
- **Platform steps in general terms.** Never assume exact menu names, because they change. Describe where to look, offer screenshot help ("send me a screenshot and I'll tell you exactly what to click"), and wait for the member to finish each step.
- One question at a time. Ask only what is missing, once each.
- Follow the member's Voice Profile for any copy you suggest. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings (write a heading like Deal 3: reaches the cap, never with a dash).

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `compliance_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

---

### Marketing Hub safety net
This skill saves to the Marketing Hub, so make sure it exists before you start.
1. If `marketing_hub_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Marketing Hub". If you find one, save its ID as `marketing_hub_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Marketing Hub isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Marketing Hub" inside the root page with these properties: Title (title); Type (select: Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Other); Status (select: Draft, Approved, Published); Source Skill (text); Date (date). Save its ID as `marketing_hub_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the full result in the chat, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Marketing Hub, then ask me to save it," and stop trying to save. Never create a second Marketing Hub, and never create any other database.

## Loading the Industry Flow

Read `industry_flow` from Setup Status (`real-estate` or `generic`) and load `industries/<industry_flow>.md`. It holds the page types, keyword patterns, schema type, and the language scan for that kind of business. If `industry_flow` is missing, use `generic`.

---

## Step 1: Read the profile

Read from the Master Profile:
- `website` (the URL), `website_platform`, `business_name`, `primary_market`, `surrounding_areas`, `niche`, `client_categories`, `languages`
- The saved contact details: `nap_name`, `nap_address`, `nap_phone`
- `gbp_status` from Business Numbers. Never ask about it. It is not needed for this audit, but note it in the summary if it is weak.
- From the Compliance Guardrails page (`compliance_page_id`): `disclosure_line_full`, `required_notices`, and the rules the site copy must follow
- From the Marketing Hub (`marketing_hub_db_id`): the newest row of Type SEO Strategy (for the target keywords) and the newest row of Type SEO Audit (to compare with)

If `website` is missing, ask once: "What is your website address?" and save it in the Presence section.

## Step 2: Know the platform

If `website_platform` is saved, use it. Otherwise read the homepage and use the signals in `references/platforms.md` to detect it. Tell the member what you found and confirm: "Your site looks like it's built on [platform]. Is that right?" Save `website_platform` in the Presence section. If you cannot tell, ask once which platform it is and offer GoHighLevel, Astro, WordPress, Squarespace or Wix, a real estate website provider, or other.

## Step 3: Plan the crawl

1. Read the homepage, `robots.txt`, and `sitemap.xml` (try `sitemap_index.xml` too).
2. List the pages you found. By default audit up to **25 pages**, chosen in this order: the homepage, the main service or client type pages, About, Contact, neighborhood or local pages, and the most important blog posts. If there are more than 25 pages, say so and ask once: "Want me to check more than 25?"
3. Tell the member the plan in one line, then start.

## Step 4: Check every page

For each page, run the page checks in `references/checks.md`: title, meta description, headings, local keywords, content, images, internal links, canonical and indexing, schema, mobile setup, and language setup. Also run the language and compliance scan in the industry file. Record the evidence for every finding.

## Step 5: Check speed

Use Google's free PageSpeed Insights for the homepage and one or two key pages, on mobile. Open it by fetching `https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=<page url>&strategy=mobile`, or by reading the PageSpeed Insights page. Report the performance score, the main timing numbers, and the top opportunities in plain words. If you cannot reach it, give the member the link (https://pagespeed.web.dev) and ask them to paste or screenshot the result.

## Step 6: Check the site as a whole

Run the site checks in `references/checks.md`: HTTPS and redirects, `robots.txt`, sitemap, broken internal links and a sample of external links, orphan pages, a 404 page, the name, address, and phone shown on the site compared with the saved details, and the disclosure line and required notices.

## Step 7: Prioritize

Sort every finding using the priority rules in `references/checks.md` into High, Medium, and Low. Compliance and Fair Housing findings are always High. Then build a short fix list of the top items, with the easiest high impact items first.

## Step 8: Say it

> **Your site audit, [date]**
> I checked [N] pages on [site] ([platform]). [One sentence on the overall picture.]
>
> **Fix these first**
> 1. [Fix]: [which pages], [why it matters in one sentence], [how to fix it on their platform, short].
> 2. ...
> (up to 10)
>
> **Also worth doing:** [3 to 5 Medium items in a line each]
> **Speed:** [mobile score and the one or two things that matter most]
> **Compared with your last audit:** [fixed, new, and still open, or "this is your first audit"]
>
> Want me to walk you through the first fix now? [platform steps, one at a time, with screenshot help]

Use the platform fix steps in `references/platforms.md`, described generally. If the site is on a platform where the member cannot edit the page code, say so and give the closest option.

## Step 9: Save

1. Make sure the Marketing Hub's Type select has an option called **SEO Audit**. Read the database's current Type options. If SEO Audit is missing, ask once: "I'd like to add an 'SEO Audit' label to your Marketing Hub so audits are easy to find. OK?" If they agree, update the existing Type property to keep every current option and add SEO Audit. If they say no, or the change fails, use Type SEO Strategy and start the Title with "Site Audit". Never create a new database.
2. Create one row in the existing Marketing Hub: Title is "Site Audit" and the date, Type is SEO Audit, Status is Draft, Source Skill is /hi5-site-audit, Date is today. Put in the page body: the summary counts by priority, the fix list as a checklist, a table of every page checked with its findings, the speed numbers, the comparison with the last audit, and the date.
3. Save `website_platform` and `last_site_audit` (today) in the Presence section of the Master Profile.

## Step 10: Compare with the last audit

If a previous SEO Audit row exists, compare finding by finding: fixed since last time, new issues, and still open. Say it in plain words and celebrate what was fixed.

---

## Hand-offs
- To rewrite pages, run /hi5-website. It reads the newest SEO Audit and SEO Strategy rows, so the rewrite uses the fix list and the target keywords.
- For Google Business Profile, directory consistency, reviews, keywords and content, and AI search visibility, run /hi5-seo.

## Next
End with: "Next: fix the top items, then run /hi5-website to rewrite any weak pages around your keywords. Run /hi5-site-audit again after your changes to see your progress. You can run /hi5-next any time and I'll tell you your best next step."
