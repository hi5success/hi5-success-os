---
name: hi5-blog
description: Writes a full SEO-optimized blog post from a YouTube video, script, or topic. Expands video content into a long-form article that drives organic search traffic. Triggers when the user runs /hi5-blog, says "write a blog post", "turn this into a blog", or "blog from my video".
---

# Hi5 Blog: Blog Post Writer

## Purpose
Turn YouTube content into SEO-optimized blog posts that drive organic traffic. One video becomes one article that works for search, your website, and email content.

## Core Rules
- Languages: if the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as a way to reach more people. Write it natively, not as a word for word translation
- Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill (the Content Planner is `content_planner_db_id`). If it is not set up, tell the member to run /hi5-setup first
- Read Master Profile for market, niche, and brand voice
- Read behavioral style from /hi5-self for tone
- Target local SEO keywords where relevant for real estate
- Save to Notion Content Planner

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

## STORAGE

Save to Notion Content Planner with status: Draft

> "Your blog post is saved to your Content Planner. Want me to also pull 3 social captions from this post? Run /hi5-social to do that."
