# The Generated Voice Skill (template)

Used by `SKILL.md` Step 7. Build the skill by filling the placeholders below. Create a folder named `{{SLUG}}` with one file, `SKILL.md`, containing everything between the START and END lines. Rules:
- `{{SLUG}}` is the Skill Name (for example jacobs-voice). The frontmatter `name` must equal it.
- `{{NAME}}` is the person's name or the brand name, as the member says it (for example Jacob, or Smith Dental). For a possessive, use `{{NAME_POSSESSIVE}}` (Jacob's, Smith Dental's).
- `{{GUIDE}}` is the full voice guide, with the private details scrubbed.
- The description must be one line, with no colon followed by a space, so the file stays valid.
- Never put em dashes in the file unless the guide says the person uses them as a habit.

--- START OF SKILL.md ---
---
name: {{SLUG}}
description: Writes in {{NAME_POSSESSIVE}} voice. Controls style only, so the facts, the task, and any rules stay the member's. Triggers when the user says "write as {{NAME}}", "in {{NAME_POSSESSIVE}} voice", "as {{NAME}}", "{{SLUG}}", or asks for a draft that should sound like {{NAME}}, such as an email, a text, a social post, a video script, or a long piece.
---

# {{NAME_POSSESSIVE}} Voice

## What this skill does
It makes a draft sound like {{NAME}}. It controls style only: tone, rhythm, word choice, and habits. It never changes the facts, the task's instructions, or any rule the member's other tools apply (for example compliance, advertising, privacy, or disclosure rules). If a rule conflicts with the voice, the rule wins.

## Rules
- **Style only.** Never override the facts, the instructions, or a compliance rule.
- **Never invent.** Never invent a personal story, a result, a testimonial, a claim, or a quote for {{NAME}}. If a draft needs a fact the member did not give, use a [PLACEHOLDER] and say what is missing.
- **Private details stay out.** Never keep a phone number, an address, an email address, an account number, or a client's name in an example. Use placeholders.
- **Signature phrases sparingly.** No more than one in a piece.
- **One voice per piece.** Never mix this voice with another in the same piece.
- **Do not change this voice without the member's OK.**

## Step 1: Load the latest guide
1. If Notion is connected, search for the database "Voice Library" and open the entry whose Skill Name is `{{SLUG}}`. Read the guide and the Learned section. The Learned notes are newer than the guide and win where they differ.
2. If Notion is not connected, or the entry cannot be found, use the snapshot below, and say once: "I'm using the saved snapshot of {{NAME_POSSESSIVE}} voice (version {{VERSION}}, {{DATE}}). Connect Notion to use the latest guide and notes."

## Step 2: Write
Write the draft in the voice, using the channel notes for the format (email, text, social, script, or long form) and the formality that fits the audience. Use only the facts the member gave. Keep greetings, sign-offs, and habits as the guide says.

## Step 3: Learn from corrections
When the member edits a draft or says something like "I'd never say that" or "too formal", say in one line what you learned and offer: "Want me to save that to {{NAME_POSSESSIVE}} Learned notes?" Save only with their OK, one lesson at a time, as a dated bullet in the Learned section of the Voice Library entry (for example "2026-10-11: Never opens with 'Hope you're well'."). Use the lesson in the very next draft. If Notion is not connected, keep the lesson for this chat and offer to save it when Notion is connected. After about 10 saved lessons, suggest running /hi5-voice-creator to merge them into the guide and get a fresh skill file.

## Snapshot of the voice guide (version {{VERSION}}, {{DATE}})
{{GUIDE}}
--- END OF SKILL.md ---
