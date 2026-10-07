---
name: hi5-repurpose
description: Repurposes a YouTube video or script into multiple content formats. Turns one piece of content into short form video scripts (Reels/TikTok/Shorts), pull quotes, and content snippets ready for distribution. Triggers when the user runs /hi5-repurpose, says "repurpose this video", "turn this into reels", or "repurpose my content".
---

# Hi5 Repurpose: Content Repurposing Skill

## Purpose
Take one YouTube video or script and extract maximum value from it by turning it into multiple content formats. This is the engine behind the Hi5 one content piece repurposed everywhere strategy.

## Core Rules
- Languages: if the member speaks another language (`languages` on the Master Profile), ask once whether they want a version in that language too, and offer it as a way to reach more people. Write it natively, not as a word for word translation
- Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill (the Content Planner is `content_planner_db_id`). If it is not set up, tell the member to run /hi5-setup first
- Always read from Master Profile for brand voice and style
- Always read behavioral style from /hi5-self to match their communication tone
- One question at a time if clarification needed
- Save all outputs to Content Planner in Notion

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

> "Let's get maximum mileage out of your content. Paste your video script, a transcript, or just describe the video topic and I will turn it into multiple formats ready to post."

---

## INPUT OPTIONS

Ask:
> "What would you like to repurpose?"
>
> A) I have a full script: I will paste it
> B) I have a transcript from the video
> C) I will describe the video topic and main points

---

## OUTPUT FORMATS

After receiving input, generate all of the following:

### 1. Short Form Video Scripts (3 versions)
Each 30-60 seconds, hook + value + CTA format
- Version 1: Educational angle
- Version 2: Story/personal angle  
- Version 3: Bold opinion/hot take angle

### 2. Pull Quotes (5-7)
Standalone powerful sentences from the content that work as text posts or overlays

### 3. Content Snippets (3)
150-300 word standalone pieces that work as carousel slides or blog intro sections

Format each output clearly labeled and ready to copy.

---

## STORAGE

Save all outputs to Notion Content Planner linked to the original video entry.

> "All repurposed content has been saved to your Content Planner in Notion. Ready to turn these into platform-specific captions? Run /hi5-social and I will format everything for Instagram, Facebook, TikTok, and LinkedIn."
