---
name: hi5-social
description: Generates platform-specific social media captions for Instagram, Facebook, TikTok, LinkedIn, and email from any content piece. Tailors tone, length, and format to each platform and the member's brand voice. Triggers when the user runs /hi5-social, says "write captions", "social media posts", "write my captions", or "post this to social".
---

# Hi5 Social: Social Caption Generator

## Purpose
Turn any content into platform-ready captions. Each platform gets its own version, not the same caption copy-pasted everywhere.

## Core Rules
- Languages: if the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as a way to reach more people. Write it natively, not as a word for word translation
- Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill (the Content Planner is `content_planner_db_id`). If it is not set up, tell the member to run /hi5-setup first
- Read Master Profile for brand voice, platforms, and style
- Read behavioral style from /hi5-self for tone
- Never write the same caption for multiple platforms
- Always include a CTA appropriate for the platform
- Save all outputs to Notion Content Planner

---

## Compliance

Before writing anything public, open the member's Compliance Guardrails page (`compliance_page_id` on the Master Profile; find the workspace using the FINDING THE WORKSPACE rule in the hi5-context skill) and follow every rule on it.

- **Disclosure line.** End every public piece with the member's saved disclosure line, exactly as saved. Use `disclosure_line_short` for captions, ads, social posts, and video descriptions. Use `disclosure_line_full` for emails, newsletters, web pages, blog posts, and landing pages. If the page only has `disclosure_line`, treat it as the full line. If `disclosure_line_short` is missing, ask the member once whether they have a shorter version for captions and ads, save their answer (or the full line if they have none) on the Compliance Guardrails page, and continue.
- **Required notices.** Include each notice listed in `required_notices` in the places the member said they use it, with its link. Never say whether a notice is legally required.
- **Proof points.** Never use a proof point, number, or dollar amount marked internal, or when `proof_point_public` is no, in anything public. It is fine in private scripts.
- **Writing style.** Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`.
- **No page yet.** If the Compliance Guardrails page does not exist, tell the member once: "Your compliance setup isn't done, so I'm drafting with general best practices. Run /hi5-setup and choose Continue setup (Stage 2) to add your disclosure line and rules." Then put [DISCLOSURE LINE] in the right place.
- If a request would break a rule, say which rule and offer a compliant alternative.

---

## OPENING

> "Let's get your content ready to post. What are we working with?"
>
> A) A YouTube script or video topic
> B) A blog post
> C) Repurposed content snippets from /hi5-repurpose
> D) A fresh topic or idea I want to post about

---

## PLATFORM DETECTION

Check Master Profile for PROFILE.social_platforms.
Only generate captions for platforms they are active on.
Ask if they want all platforms or specific ones.

---

## OUTPUT BY PLATFORM

### Instagram
- Hook in first line (stops the scroll)
- 150-300 words
- Conversational and personal
- 5-10 relevant hashtags
- CTA: comment, save, DM, or link in bio

### Facebook
- Longer form: 200-400 words
- Community-focused tone
- Story or value-first
- CTA: comment or share

### TikTok
- Hook line only (first 3 seconds script)
- 50-100 words
- High energy, direct, trend-aware
- CTA: follow or comment

### LinkedIn
- Professional but personal
- 150-300 words
- Insight or lesson-forward
- CTA: connect or comment

### Email Subject Lines (3 versions)
- Curiosity-driven
- Benefit-driven
- Direct/bold

---

## STORAGE

Save all captions to Notion Content Planner linked to the content piece.

> "All captions are saved to your Content Planner. Everything is ready to copy and post. Want to schedule these out? Add your posting dates directly in Notion and your Content Planner will track everything."
