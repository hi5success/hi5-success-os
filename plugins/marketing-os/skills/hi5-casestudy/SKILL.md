---
name: hi5-casestudy
description: Turns a closed deal or client success story into a professional case study. Creates a compelling narrative that builds credibility and can be used across website, social, email, and listing presentations. Triggers when the user runs /hi5-casestudy, says "write a case study", "turn this deal into a story", "client success story", or "closed deal story".
---

# Hi5 Case Study — Client Success Story Builder

## Purpose
Transform a closed transaction or client win into a powerful case study that builds trust, demonstrates expertise, and generates referrals. The best marketing is a real story told well.

## Core Rules
- Read Master Profile for market, niche, and voice
- Match behavioral style for tone
- Every case study needs a clear before, during, and after structure
- Protect client privacy — use first names only unless told otherwise
- Save to Notion Marketing Hub

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page → tell the member to run /hi5-setup first, then stop. More than one → ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`marketing_hub_db_id`, `content_planner_db_id`, `compliance_page_id`, `voice_profile_page_id`, `neighborhoods`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile) and follow every rule on it. End every public-facing piece with the member's `disclosure_line`, exactly as saved. If the page does not exist yet, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] at the end of each public piece. If a request would break a rule, say which rule and offer a compliant alternative.

---

## OPENING

> "The best thing you can show a potential client is proof that you have done it before — for someone just like them. Let's turn one of your wins into a story that sells.
>
> Tell me about the deal or client situation you want to feature."

---

## QUESTIONS

**Q1 — Client Type**
> "What type of client was this?"
>
> A) First time buyer
> B) Move up buyer
> C) Seller
> D) Investor
> E) Relocation client
> F) Luxury buyer or seller

**Q2 — The Situation**
> "What was the client's situation when they came to you? What problem were they facing or what did they want to achieve?"
*(Open ended — let them tell the story)*

**Q3 — The Challenge**
> "Was there anything particularly challenging about this transaction? Multiple offers, tight timeline, difficult negotiation, financing issues?"
*(Open ended)*

**Q4 — The Result**
> "What was the outcome? What did you get them and how did it compare to what they expected?"
*(Open ended)*

**Q5 — Client Quote**
> "Do you have a quote or testimonial from this client you can share? Even a paraphrase of what they said works."
*(Optional but powerful)*

**Q6 — Usage**
> "Where do you plan to use this case study?"
>
> A) My website
> B) Social media
> C) Listing or buyer presentation
> D) Email campaign
> E) All of the above

---

## OUTPUT

Generate the case study in multiple formats:

### Long Form (website and presentation)
- Client profile (anonymous — first name and situation only)
- The challenge
- The approach (what you did and why)
- The result (specific numbers where possible)
- Client quote
- Key takeaway for the reader
- CTA

### Short Form (social media — 150-300 words)
Narrative version for Instagram or Facebook

### Micro Version (50-75 words)
For email campaigns or presentation slides

### Headline Options (5)
For use across different placements

---

## STORAGE

Save all versions to Notion Marketing Hub.

> "Your case study is saved in three formats in your Marketing Hub — long form for your website, short form for social, and micro for email. Want to turn the social version into captions for each platform? Run /hi5-social and I will format it."
