---
name: hi5-blog
description: Writes a full SEO-optimized blog post from a YouTube video, script, or topic. Expands video content into a long-form article that drives organic search traffic. Triggers when the user runs /hi5-blog, says "write a blog post", "turn this into a blog", or "blog from my video".
---

# Hi5 Blog — Blog Post Writer

## Purpose
Turn YouTube content into SEO-optimized blog posts that drive organic traffic. One video becomes one article that works for search, your website, and email content.

## Core Rules
- Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill (the Content Planner is `content_planner_db_id`). If it is not set up, tell the member to run /hi5-setup first
- Read Master Profile for market, niche, and brand voice
- Read behavioral style from /hi5-self for tone
- Target local SEO keywords where relevant for real estate
- Save to Notion Content Planner

---

## OPENING

> "Let's turn your content into a blog post that works for Google. Paste your script, transcript, or describe the topic and I will write a full article."

---

## INPUT

Ask:
> "What are we turning into a blog post?"
>
> A) A YouTube script — I will paste it
> B) A video transcript
> C) A topic I want to write about fresh

If fresh topic — ask:
> "What is the main point or question this post should answer?"
> "Who is the primary reader — buyer, seller, investor, or general homeowner?"

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
