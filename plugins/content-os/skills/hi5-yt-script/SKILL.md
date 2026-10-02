---
name: hi5-yt-script
description: Write a video script or outline in your voice for a specific video in your Content Calendar, then push it to the video's Notion page.
---

# /hi5-yt-script — Script Writer

You are writing a video script or outline for a specific video in the member's
Content Calendar. The output will sound like the member — not like AI — and
will be pushed to the video's Notion page when done.

## Step 1 — Read the Master Profile

Find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill. If it is not set up, tell the member to run /hi5-setup first and stop. If the member has more than one channel, ask which one first. You need the full Voice Profile page and the Operator Preferences from the Content Profile. These are non-negotiable inputs for every script — do not skip this step.

Voice Profile fields to extract (from the Voice Profile page):
- `vocabulary_style`
- `sentence_rhythm`
- `phrases_used`
- `phrases_never_used`
- `energy_level`
- `cta_style`

Operator Preferences to extract:
- `script_depth` (Outline only / Full word-for-word script)
- `output_format` (Bullets / Prose)
- `explanation_level`

## Step 2 — Identify the Video

Ask: "Which video do you want to script? You can give me the title or describe
it and I'll find it in your Content Calendar."

Query the Content Planner (`content_planner_db_id`) to find the matching row. Retrieve: Title, Hook /
Angle, Target Keyword, Content Category, Goal, Reference Video URLs (if any).

If no match is found, say: "I couldn't find that video in your Content
Calendar. Check the title and try again, or run /hi5-yt-plan to schedule it first."

## Step 3 — Confirm the Script Brief

Before writing, present the brief to the member:

- **Video:** [title]
- **Target Keyword:** [keyword]
- **Hook / Angle:** [hook]
- **Goal:** [affiliate / community / awareness / mixed]
- **Script format:** [outline or full script, from their preferences]

Ask: "Does this look right, or do you want to adjust the angle before I write?"

## Step 4 — Write the Script

Apply the Voice Profile throughout. This is the most important instruction in
this command. Specifically:

- Use their vocabulary style — casual if they're casual, direct if they're
  direct. Do not default to formal AI language.
- Match their sentence rhythm — if they use short punchy sentences, write short
  punchy sentences.
- Include their signature phrases naturally where they fit. Never force them.
- Never use phrases from their "Phrases Never Used" list.
- Match their energy level — high energy gets punchy hooks and fast-moving
  content; calm gets measured pacing.
- Close with their CTA style — direct, soft, or conversational as specified.

**If Script Depth = Outline only**, write:

```
HOOK / INTRO
[2–3 sentences — the opening that grabs attention, in their voice]

MAIN CONTENT
[Bulleted outline of key points, each with a 1-sentence description]

CTA
[What to say at the end and where to send the viewer]

KEYWORD NOTES
[Where to mention the target keyword naturally — not forced]
```

**If Script Depth = Full word-for-word script**, write every line as they
would say it. Structure:

```
HOOK / INTRO
[Full opening — written to be spoken aloud]

[Section heading]
[Full paragraphs or spoken lines for this section]

[Repeat for each main section]

CTA
[Full closing in their voice]
```

Target keyword must appear naturally at least 2–3 times. Never stuff it.

## Step 5 — Review and Revise

After presenting the script, ask: "How does this feel? Does it sound like you?
Tell me anything you want to adjust — tone, length, a section, or specific
lines."

Make any requested revisions before pushing to Notion.

## Step 6 — Push to Notion

Once the member approves the script, update the video's row in
the Content Planner (`content_planner_db_id`):
- Status → "Scripted"
- Add the script content to the page body of that row's Notion page

Confirm: "Script saved to Notion. Your video page is updated and Status is set
to Scripted."
