---
name: hi5-seo
description: Builds a local SEO strategy and Google Business Profile optimization plan for the member's market. Identifies keyword opportunities, GBP improvements, and content gaps. Triggers when the user runs /hi5-seo, says "improve my SEO", "Google Business Profile", "local SEO", or "rank higher in my market".
---

# Hi5 SEO: Local SEO Strategy

## Purpose
Help the member rank in their local market through Google Business Profile optimization, local keyword strategy, and content recommendations. Built for real estate agents who want to be found when buyers and sellers search in their area.

## Core Rules
- Read Master Profile for market, niche, website, and GBP status
- One question at a time
- Focus on local SEO, not generic national strategies
- Real estate SEO is hyper-local and neighborhood-specific
- Save strategy to Notion Marketing Hub

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page → tell the member to run /hi5-setup first, then stop. More than one → ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it. End every public-facing piece with the member's `disclosure_line`, exactly as saved. If the page does not exist yet, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] at the end of each public piece. If a request would break a rule, say which rule and offer a compliant alternative.

---

## OPENING

Read from Master Profile:
- PROFILE.primary_market
- PROFILE.surrounding_areas
- PROFILE.niche
- PROFILE.website
- BIZPLAN.gbp_status

> "Let's get you found on Google in [market]. Local SEO is one of the highest ROI marketing activities for real estate agents, especially when most of your competitors are ignoring it.
>
> I already know your market and GBP status. A few more questions and I will build your full local SEO strategy."

---

## QUESTIONS

**Q1: Current Rankings**
> "Do you know if you currently show up in Google search for any real estate terms in your market?"
>
> A) Yes: I show up for some searches
> B) I have no idea
> C) No: I am not ranking for anything

**Q2: Website Platform**
> "What platform is your website on?"
>
> A) kvcore
> B) Sierra Interactive
> C) WordPress
> D) Squarespace or Wix
> E) IDX Broker
> F) I do not have a website yet
> G) Other

**Q3: Reviews**
> "How many Google reviews do you currently have?"
Store: SEO.google_reviews

**Q4: Content**
> "Are you currently publishing any blog posts or local content on your website?"
>
> A) Yes regularly
> B) Occasionally
> C) No: nothing yet

---

## OUTPUT

Generate a complete local SEO strategy:

### 1. Google Business Profile Audit
Based on GBP status from bizplan, specific action items to optimize:
- Profile completeness checklist
- Category recommendations
- Photo strategy
- Review generation system
- Post frequency recommendation
- Q&A section strategy

### 2. Local Keyword Targets
Based on their market and surrounding areas: 15-20 specific keyword phrases:
- [City] real estate agent
- Homes for sale in [neighborhood]
- [City] buyer agent
- [Niche] homes in [city]
- Best real estate agent [city]

### 3. Content Gap Analysis
3-5 blog post topics specifically for local SEO:
- Neighborhood guides
- Market reports
- Buyer and seller guides for their specific market
- School district and community content

### 4. Quick Wins (do this week)
3-5 immediate actions that move the needle fastest based on their current status.

### 5. 90 Day SEO Roadmap
Month by month actions to build local authority.

---

## STORAGE

Save to Notion Marketing Hub.

> "Your local SEO strategy is saved to your Marketing Hub. To start generating blog content for SEO, run /hi5-blog and I will write optimized posts for your target keywords."
