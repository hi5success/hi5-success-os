---
name: hi5-casestudy
description: Turns a client success story or closed deal into a professional case study. Creates a compelling narrative that builds credibility and can be used across website, social, email, and presentations. Works for any industry. Triggers when the user runs /hi5-casestudy, says "write a case study", "turn this deal into a story", "client success story", or "closed deal story".
---

# Hi5 Case Study: Client Success Story Builder

## Purpose
Transform a client win into a powerful case study that builds trust, demonstrates expertise, and generates referrals. The best marketing is a real story told well.

## Core Rules
- Read the Master Profile for market, niche, and voice.
- Match behavioral style for tone.
- Every case study needs a clear before, during, and after structure.
- Protect client privacy: use first names only unless told otherwise, and ask whether the client gave permission.
- Use only facts and numbers the member gives you. Never invent details, quotes, or results.
- Save to the Marketing Hub in Notion.
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

## QUESTIONS (all industries)

**Q2: The situation**
> "What was the client's situation when they came to you? What problem were they facing or what did they want to achieve?"
*(Open ended: let them tell the story)*

**Q3: The challenge**
> "Was there anything particularly challenging about it? A tight timeline, a difficult negotiation, a complication?"
*(Open ended)*

**Q4: The result**
> "What was the outcome? What did you get them and how did it compare to what they expected?"
*(Open ended)*

**Q5: Client quote**
> "Do you have a quote or testimonial from this client you can share? Even a paraphrase of what they said works."
*(Optional but powerful)*

**Q6: Usage**
> "Where do you plan to use this case study?
>
> A) My website
> B) Social media
> C) A presentation or consultation
> D) Email campaign
> E) All of the above"

## OUTPUT (all industries)

Generate the case study in multiple formats:

### Long Form (website and presentation)
- Client profile (anonymous: first name and situation only)
- The challenge
- The approach (what you did and why)
- The result (specific numbers where possible)
- Client quote
- Key takeaway for the reader
- CTA

### Short Form (social media, 150 to 300 words)
A narrative version for social.

### Micro Version (50 to 75 words)
For email campaigns or presentation slides.

### Headline Options (5)
For use across different placements.

Describe the situation, never the person's protected characteristics. Use any result the member marks as internal only in private presentations, not in public pieces.

## STORAGE

Save all versions to the Marketing Hub (`marketing_hub_db_id`) as one row: Title names the story, Type is Case Study, Status is Draft, Source Skill is /hi5-casestudy, Date is today, and all versions are in the page body.

> "Your case study is saved in three formats in your Marketing Hub: long form for your website, short form for social, and micro for email."

## NEXT STEP

> "Next: want to turn the social version into captions for each platform? Run /hi5-social and I will format it. You can run /hi5-next any time and I'll tell you your best next step."
