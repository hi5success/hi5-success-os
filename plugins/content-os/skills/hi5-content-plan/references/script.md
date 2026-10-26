# Script Writer

Used by `SKILL.md` option C and by step 5 of the monthly plan. You are writing a video script or outline. It sounds like the member, not like AI. It works with no setup: the member can say "write a script about first-time buyer mistakes" and get the script on screen. When the content calendar is set up, the script goes to the piece's row.

## Rules
The Compliance, Voice, Reader, and No invented commitments rules in SKILL.md apply to every script. Every script ends with a video-description section that includes `disclosure_line_short` exactly as saved (or [DISCLOSURE LINE] if there is no Compliance page).

## Step 1: Read what exists
Look for the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in core.md. If found, read the full Voice Profile page and the Operator Preferences from the Content Profile (these are non-negotiable inputs when they exist). If not found, ask two short questions (who the video is for, and casual or professional) and write with general best practices. If the member has more than one channel, ask which one first.

Voice Profile fields to extract (from the Voice Profile page): `vocabulary_style`, `sentence_rhythm`, `phrases_used`, `phrases_never_used`, `energy_level`, `cta_style`.

Operator Preferences to extract: `script_depth` (Outline only / Full word-for-word script), `output_format` (Bullets / Prose), `explanation_level`. With no profile, ask once: "A) an outline with talking points B) a full word-for-word script".

## Step 2: Identify the piece
Ask: "Which video do you want to script? Give me the topic or the idea, or the title of a row in your Content Calendar." If the calendar is set up, query the Content Planner (`content_planner_db_id`) to find a matching row (Title, Hook / Angle, Target Keyword, Content Category, Goal). If there is no match, or no calendar, work from what the member said and do not stop.

## Step 3: Confirm the Script Brief

Before writing, present the brief to the member:

- **Video:** [title]
- **Target Keyword:** [keyword]
- **Hook / Angle:** [hook]
- **Goal:** [affiliate / community / awareness / mixed]
- **Script format:** [outline or full script, from their preferences]

Ask: "Does this look right, or do you want to adjust the angle before I write?"

## Step 4: Write the Script

Apply the Voice Profile throughout. This is the most important instruction in
this command. Specifically:

- Use their vocabulary style, casual if they're casual, direct if they're
  direct. Do not default to formal AI language.
- Match their sentence rhythm, if they use short punchy sentences, write short
  punchy sentences.
- Include their signature phrases naturally where they fit. Never force them.
- Never use phrases from their "Phrases Never Used" list.
- Match their energy level, high energy gets punchy hooks and fast-moving
  content; calm gets measured pacing.
- Close with their CTA style, direct, soft, or conversational as specified.

**If Script Depth = Outline only**, write:

```
HOOK / INTRO
[2–3 sentences: the opening that grabs attention, in their voice]

MAIN CONTENT
[Bulleted outline of key points, each with a 1-sentence description]

CTA
[What to say at the end and where to send the viewer]

KEYWORD NOTES
[Where to mention the target keyword naturally, not forced]
```

**If Script Depth = Full word-for-word script**, write every line as they
would say it. Structure:

```
HOOK / INTRO
[Full opening: written to be spoken aloud]

[Section heading]
[Full paragraphs or spoken lines for this section]

[Repeat for each main section]

CTA
[Full closing in their voice]
```

Target keyword must appear naturally at least 2–3 times. Never stuff it.

## Step 5: Review and Revise

After presenting the script, ask: "How does this feel? Does it sound like you?
Tell me anything you want to adjust, tone, length, a section, or specific
lines."

Make any requested revisions before pushing to Notion.

## Step 6: Save it
When the content calendar is set up and the script belongs to a row, put the script and the production notes in that row's "Script and production notes" section. Do not change the row's Status: the pipeline sets it (a row stays Planned until the member records). For an older row that is not in the pipeline, the status can be set to Scripted. Confirm what you wrote. If the calendar is not set up, the script stays on screen and the member can copy it.

For short-form, reels, statics, and carousels the notes follow the plan reference. Next: "turn this script into posts with /hi5-social. You can run /hi5-next any time and I'll tell you your best next step."
