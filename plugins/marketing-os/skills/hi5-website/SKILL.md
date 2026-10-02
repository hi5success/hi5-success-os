---
name: hi5-website
description: Writes or rewrites website page copy for the member's real estate or business website. Covers Home, About, Buyer, Seller, and Contact pages. Tailored to their market, niche, brand voice, and personality. Triggers when the user runs /hi5-website, says "write my website copy", "rewrite my about page", "website content", or "write my home page".
---

# Hi5 Website — Website Copy Writer

## Purpose
Write website copy that converts visitors into leads. Every page is written in the member's voice, for their specific market and niche, with clear calls to action.

## Core Rules
- Read Master Profile for all business details — never ask for what is already stored
- Match behavioral style for tone
- Real estate website copy should be local, specific, and trust-building
- Every page needs one clear CTA
- Save all copy to Notion Marketing Hub

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page → tell the member to run /hi5-setup first, then stop. More than one → ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. A field that is missing from the profile is skipped, not asked for again unless the skill needs it.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it. End every public-facing piece with the member's `disclosure_line`, exactly as saved. If the page does not exist yet, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] at the end of each public piece. If a request would break a rule, say which rule and offer a compliant alternative.

---

## OPENING

Read from Master Profile:
- PROFILE.name
- PROFILE.business_name
- PROFILE.primary_market
- PROFILE.niche
- PROFILE.re_role
- PROFILE.years_licensed
- PROFILE.behavioral_style

> "Let's write website copy that sounds like you and converts visitors into leads. I already know your market, niche, and brand voice. Which page are we writing?"
>
> A) Home page — the main landing page
> B) About page — your story and credibility
> C) Buyer page — for buyer leads
> D) Seller page — for seller leads
> E) Contact page — drive them to reach out
> F) Full website — write all pages

---

## PAGE OUTPUTS

### Home Page
- Hero headline + subheadline (3 options)
- Value proposition paragraph
- 3 reason why you section
- Social proof placeholder (reviews/stats)
- Primary CTA section
- Secondary CTA section

### About Page
- Personal story opening (warm, human, specific to their market)
- Credibility section (years, transactions, market expertise)
- Why I do this section (connects to their success vision from hi5-self)
- Community connection (local market knowledge)
- Personal details (family, hobbies — makes them real)
- CTA to connect

### Buyer Page
- Headline targeting buyer pain points in their market
- What working with me looks like (process overview)
- Why buyers choose me
- First time buyer section (if relevant to niche)
- Buyer FAQ (3-5 questions specific to their market)
- CTA to book a buyer consultation

### Seller Page
- Headline targeting seller pain points
- My listing approach (what makes them different)
- Results and stats placeholder
- What the process looks like
- Seller FAQ (3-5 questions)
- CTA to book a listing consultation

### Contact Page
- Warm opening that reduces friction
- What happens after they reach out
- Response time promise
- Multiple contact options
- CTA button copy (3 options)

Tone matched to behavioral style throughout.
Local market references woven into every page.

---

## STORAGE

Save all copy to Notion Marketing Hub organized by page.

> "Your website copy is saved to your Marketing Hub. Want me to write landing page copy for your lead magnets next? Run /hi5-landing and I will build those out."
