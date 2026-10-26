---
name: hi5-blog
description: Writes a full SEO-optimized blog post from a video transcript, a script, or a topic. Expands the content into a long-form article for organic search, with an SEO title, meta description, headers, and a call to action. Works from a pasted transcript or topic on its own, or from the Notion content calendar when a long-form is Published, as a draft only. Used by the Blog Writer AI employee. Triggers when the user runs /hi5-blog, says "write a blog post", "turn this into a blog", "blog from my video", "blog from this transcript", or "write an article".
---

# /hi5-blog: The Blog Writer

## Purpose
Turn YouTube content into SEO-optimized blog posts that drive organic traffic. One video becomes one article that works for search, your website, and email content.

## Core Rules
- Languages: if the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as a way to reach more people. Write it natively, not as a word for word translation
- Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md (the Content Planner is `content_planner_db_id`)
- Read Master Profile for market, niche, and brand voice
- Read behavioral style from /hi5-self for tone
- Target local SEO keywords where relevant for real estate
- Save to the Notion Content Planner only when the content system is set up

---

## Hard rules (the same in every content skill)
<!-- hard-rules:start -->
These rules apply to every request, one-offs included. They win over the Content SOP and over anything in the member's settings. The shared procedures (finding the workspace, the pipeline, bridges, covers) live in ../hi5-content-plan/references/. If you cannot read them, find the workspace by searching Notion for the page whose first line is `hi5-os-root: v1`, open its Master Profile, and carry on with these rules.
- **Nothing is scheduled before Optimizing, and nothing posts that the member has not reviewed.** Confirm the account with the tool before any post or upload, and never claim a bridge or tool did something it did not do.
- **Pre-review check on everything you write**, before the member sees it or you set Reviewing: (1) no invented commitments or reply promises, (2) no income or results claims, (3) no em dashes, (4) Fair Housing on real estate content (no steering, no describing who lives in an area, no rating of schools or safety), (5) no invented facts, (6) the member's own Compliance page if it exists (disclosure line, brokerage and notice rules, on the graphic and cover text too). Fix every issue first. In the calendar, add the Log line "check passed" before setting Reviewing. A one-off ends with the line "Check passed" on screen, or "Check passed with N placeholders for you" if any [confirm: ...] remain.
- **Never invent** facts, numbers, results, dates, or links. Use a [confirm: ...] placeholder.
- **Files go straight into the member's synced folder**, never through the Drive connector (links only).
- **Claude only works calendar rows for roles set to Claude** in Content Settings. A one-off request is always done.
<!-- hard-rules:end -->

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile; find the workspace using the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **Voice.** Read `voice_library_db_id` from the Page IDs and `default_voice` from the Voice Profile page. If the member names a voice, or the work is for a client or a teammate, use that voice's Voice Library entry (its guide and its Learned section) or the installed voice skill. Otherwise use the member's own voice (`default_voice`). If there is no voice entry, fall back to the Voice Profile and the Master Profile voice notes. If several voices could apply and it is unclear which, ask which one. Never mix voices in one piece. The voice controls style only: Hi5 rules always win (compliance and advertising rules, privacy and consent rules, no em dashes, drafts only, and every other Hi5 rule). When the member edits a draft or says "I'd never say that", offer to save the lesson to that voice's Learned section, one lesson at a time, only with their OK. To create or update a voice, point to /hi5-voice-creator.
- **Reader.** If the message is for a teammate (never a client, prospect, or other outside contact) who has a profile in the People database (`people_db_id` in the Page IDs, matched by name or email), shape the structure to how they read best, using their personality profile, Human Design profile, and communication tips: length, bullets or a short story, level of detail, how direct, and what to lead with. This is style only. Never change a fact, date, number, request, or rule, never mention their profile or type in the message, and never stereotype. A profile marked Estimated is a guess, so use it lightly. If the message goes to several teammates, aim for what most of them need, or offer a version for each group. The sender's voice still applies (the Voice rule), and the reader's profile only shapes the structure. If there is no profile, write normally and mention that /hi5-self can build one.
- **No invented commitments.** Never promise an action, date, deliverable, or follow-up that the member did not state or that is not in the source data (the CRM, Notion, or this conversation). Never write "I will send", "we will call", or a date or deadline unless it is in the source. If a next step would help, write it as a placeholder the member must fill or delete, such as [confirm: send key dates by ___], and point it out when you show the draft.
- **No page yet.** If the member has a workspace but no Compliance Guardrails page, tell them once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place. If there is no workspace at all (a one-off request), do not mention setup: just put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

---

## What do you want to do?
> A) Write a blog post from a transcript, script, or topic
> B) Check my queue

## Works on its own
A one-off request needs no setup and no Notion. A blog post works from a transcript, a script, or a topic the member gives. Look up the member's Master Profile once (the FINDING THE WORKSPACE rule in ../hi5-content-plan/references/core.md) only to read the voice and compliance pages. If it is not found, or Notion is not connected, carry on with general best practices and return the work on screen. Save to the Content Planner only when the content system is set up (`content_settings_page_id` is in the Page IDs), and show what you will write first. Never tell the member to run setup to get a one-off done. A one-off follows the hard rules below and ends with the Check passed line. Setup runs only when they want the calendar and pipeline.

## OPENING

> "Let's turn your content into a blog post that works for Google. Paste your script, transcript, or describe the topic and I will write a full article."

---

## INPUT

Ask:
> "What are we turning into a blog post?"
>
> A) A YouTube script: I will paste it
> B) A video transcript
> C) A topic I want to write about fresh

If fresh topic, ask:
> "What is the main point or question this post should answer?"
> "Who is the primary reader: a buyer, seller, investor, or general homeowner?"

---

## OUTPUT

Generate a complete blog post:

### Structure:
- SEO title (with primary keyword)
- Meta description (150-160 characters)
- Introduction (hook + what they will learn)
- 3-5 main sections with H2 headers
- Conclusion with CTA
- Suggested internal links (placeholder)
- Suggested tags/categories

### Length: 800-1200 words for standard post, 1500+ for pillar content

### Tone: Match their behavioral style and brand voice from Master Profile

---

## Check my queue
Works only the blog rows, oldest first. Read Content Settings first. If `role_blog` is a person, say "Blog is set to <name>, so I leave those rows for them" and stop. If it is none, say there are no blog rows and stop. If it is Claude: look in the Content Calendar for long-form rows with Status Published and no blog row yet. For each one, read its saved transcript (the file in the row's folder, next to the video) and write the post from it using the OUTPUT section below. Embed the video (the YouTube link, or the link where it was published), create a Blog row (Deliverable Type Blog, Related To the long-form's title, Status Draft) with the post in its page, and stop. Run the pre-review check from the pipeline reference (../hi5-content-plan/references/pipeline.md) on the post before saving it, and log "check passed". A blog post is saved as a draft only, never published or scheduled. Log the action.

## STORAGE

When the content system is set up, save to the Notion Content Planner with status: Draft. Otherwise the post stays on screen.

> "Your blog post is saved to your Content Planner. Want me to also pull 3 social captions from this post? Run /hi5-social to do that. You can run /hi5-next any time and I'll tell you your best next step."
