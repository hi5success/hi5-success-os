---
name: hi5-email
description: Writes any kind of email or sequence for any business, chosen by the email type the member names, in the member's own voice, from their Master Profile, offers, and compliance rules. Briefs first, plans the sequence for approval, drafts with a style and rules for that type, and checks the draft before showing it. Drafts only, never sends. Triggers when the user runs /hi5-email, says "write an email", "email sequence", "launch emails", "sales emails", "nurture emails", "welcome email", "follow-up after purchase", "webinar or event reminders", "win-back", "abandoned cart", "review request", "announcement email", or "audit my email".
---

# Hi5 Email: Any Email, Any Business

## Purpose
Write the email or sequence the member asks for, by type (welcome, nurture, launch, event reminders, after a purchase, win-back, review ask, announcement, and more), so it sounds like them, speaks to their audience, and does one job per email. The craft lives in the reference files, and the member's own context (profile, offers, voice, compliance, approved emails) decides the details.

## Core Rules
- Read the Master Profile first. Never ask for info already captured.
- Voice comes from the Voice rule below. Structure and length come from the email type and the style, not from the sender's personality type.
- **Voice.** Read `voice_library_db_id` from the Page IDs and `default_voice` from the Voice Profile page. If the member names a voice, or the work is for a client or a teammate, use that voice's Voice Library entry (its guide and its Learned section) or the installed voice skill. Otherwise use the member's own voice (`default_voice`). If there is no voice entry, fall back to the Voice Profile and the Master Profile voice notes. If several voices could apply and it is unclear which, ask which one. Never mix voices in one piece. The voice controls style only: Hi5 rules always win (compliance and advertising rules, privacy and consent rules, no em dashes, drafts only, and every other Hi5 rule). When the member edits a draft or says "I'd never say that", offer to save the lesson to that voice's Learned section, one lesson at a time, only with their OK. To create or update a voice, point to /hi5-voice-creator.
- **Reader.** If the message is for a teammate (never a client, prospect, or other outside contact) who has a profile in the People database (`people_db_id` in the Page IDs, matched by name or email), shape the structure to how they read best, using their personality profile, Human Design profile, and communication tips: length, bullets or a short story, level of detail, how direct, and what to lead with. This is style only. Never change a fact, date, number, request, or rule, never mention their profile or type in the message, and never stereotype. A profile marked Estimated is a guess, so use it lightly. If the message goes to several teammates, aim for what most of them need, or offer a version for each group. The sender's voice still applies (the Voice rule), and the reader's profile only shapes the structure. If there is no profile, write normally and mention that /hi5-self can build one.
- **No invented commitments.** Never promise an action, date, deliverable, or follow-up that the member did not state or that is not in the source data (the CRM, Notion, or this conversation). Never write "I will send", "we will call", or a date or deadline unless it is in the source. If a next step would help, write it as a placeholder the member must fill or delete, such as [confirm: send key dates by ___], and point it out when you show the draft.
- **No invented facts.** Never invent a price, deadline, link, bonus, testimonial, or result. Use the placeholders [PRICE], [DEADLINE: day, date, time, time zone], [LINK: name], and [PROOF NEEDED], and list every placeholder when you show the draft.
- **Drafts only.** This skill never sends. Nothing is ever sent unless the member has read the full final draft and clicks send, or tells Claude to send that exact message.
- One question at a time, with 3 to 5 lettered options when there is a choice. If the member says "just write it", use sensible defaults, state them in one line, and continue.
- Save every sequence to the Marketing Hub in Notion.
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

## HOW IT WORKS

Work through the steps in order. Each step reads only the one file it names, and no reference file points to another. Two named side reads are allowed: an industry file may point to the other industry file for the agent-facing branch, and the quality check may read `../hi5-funnel/references/quality-gates.md` for its generic-copy detector and nothing beyond it. Never load everything up front.

### Step 1: Brief
Read `references/intake.md`. Fill the brief from the Master Profile first (`offers`, `offer_categories`, `agent_facing_offers`, `client_categories`, voice, compliance, `nap_address`), then ask only what is missing, one question at a time with lettered options. Use the industry file loaded above for the goal menu. Show the filled brief on one screen.

### Step 2: Plan
Read `references/styles.md` and `references/sequences.md`. Pick the style and the sequence shape. Show a Sequence Plan table (email number, send day and time with time zone, type, style, job of the email, call to action, segment) plus the trigger, the goal, and the exit conditions. Wait for the member's OK before drafting. A single email gets a one-row plan.

### Step 3: Draft
For each email, read the matching `references/email-types/<type>.md` once, then `references/rules.md` once, and `references/selling.md` if the goal is a sale or a booking. If the Marketing Hub has approved emails (Status Approved, Type Email Sequence or Newsletter), read up to 3 and match their style. Precedence: the member's approved emails, then the type file, then the style defaults. Write in the member's voice (the Voice rule). The sequence shape holds the order of the emails, and the type files hold the full templates.

### Step 4: Check
Read `references/quality-check.md` and fix every failure before showing anything.

### Step 5: Deliver
For each email give three subject lines (mark the recommended one), the preview text, the body, the call to action with its link placeholder, a P.S. if used, the send day and time, and the segment notes. List every placeholder you used and every assumption. End every email with the member's `disclosure_line_full`, any required notices, an unsubscribe line ([LINK: unsubscribe] if no platform merge tag is known), and the member's physical mailing address (from the Compliance page, else `nap_address` on the Master Profile, or the address already inside the disclosure line). If the address is missing or hidden, write [MAILING ADDRESS] and flag it in the notes.

### Step 6: Save and learn
Save as described in STORAGE. When the member approves a draft or edits it, offer to change the row's Status to Approved so it becomes a model for next time. For voice corrections, offer to save the lesson to the Voice Library Learned section (the Voice rule).

### Audit mode
If the member pastes an email or a sequence, read `references/quality-check.md`, score it from 1 to 10, give the top 3 fixes, and show before and after rewrites of the subject, the preview text, and the opening lines. Never add a claim the member did not supply, and keep a pasted price, date, or number only if the member confirms it. If the member wants ads and pages too, suggest /hi5-funnel.

## STORAGE

Save the complete sequence to the Marketing Hub (`marketing_hub_db_id`) as one row: Title is the sequence name, Type is Email Sequence, Status is Draft, Source Skill is /hi5-email, Date is today, and the full emails are in the row's page body.

> "Your [sequence type] sequence is saved to your Marketing Hub in Notion. Ready to load it into your CRM? If you are using [crm] I can format it exactly the way you need to paste it in."

## NEXT STEP

> "Next: pair this with a newsletter so your database hears from you consistently. Run /hi5-newsletter and I will build it out. You can run /hi5-next any time and I'll tell you your best next step."
