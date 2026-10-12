---
name: hi5-voice-creator
description: Creates a voice skill that writes like one specific person, so the member can call it by name, such as jacobs-voice or smith-dental-voice. Scans the Master Profile, the personality profile, and the Voice Library first and never re-asks what is there, then collects real writing and speaking samples (pasted, uploaded, or read from sent email with the member's OK), interviews a few questions at a time, builds the voice guide, and tests it with three short pieces the member rates and edits until they say that's me. Saves a Voice Library entry in Notion, writes a real installable skill with an embedded fallback, and gives a downloadable backup file with install steps. Works for the member's own voice, a teammate's, or a client or brand, as many voices as they want, in any industry. Never invents stories or claims, and never changes a voice without the member's OK. Triggers when the user runs /hi5-voice-creator, says "create my voice", "make a voice skill", "write like me", "capture my writing style", "add a voice for a client", or "update my voice".
---

# Hi5 Voice Creator: A Voice Skill for One Person

## Purpose
Turn real samples of how a person writes and speaks into a skill that writes like them, on demand, by name. The result is a Voice Library entry in Notion (the live guide), a real installable skill, and a backup file. Every Hi5 writing skill can then use that voice, and the voice keeps getting better from the member's corrections.

## Core Rules
- **Read the real samples, never AI text.** A voice is built only from things the person wrote or said themselves. If a sample looks AI-written (stock phrases, a perfect structure, em dashes the person never uses), say so and ask before using it. Never write samples for the person.
- **Scan first, then ask.** Before asking anything, read the Master Profile (voice notes, industry, brand, languages), the Voice Profile page, the `/hi5-self` personality profile, and the Voice Library. Say in one or two lines what you found. Ask only about what is missing, and point to what you found. Never re-ask anything already there.
- **Someone else's voice.** If the voice is for a teammate or a client, add one line: "Make sure you have their OK to use their writing." Then continue.
- **Style only.** The voice controls how things sound. It never overrides facts, the task's instructions, or any compliance rule. Hi5 rules always win: compliance, Fair Housing, texting consent, no em dashes, drafts only, and the rest.
- **Never invent.** Never invent a personal story, a result, a testimonial, a claim, or a quote for the person. The guide and every test piece use only what the samples and the interview gave you. If a test piece needs a fact, use a [PLACEHOLDER].
- **Private details stay out.** Scrub phone numbers, addresses, email addresses, account numbers, and client or customer names from every example you keep in the guide, the Library entry, the skill, and the backup. Replace them with placeholders. Save descriptions of the samples (the kind, the date, where it came from), never the raw sample text.
- **Email is read only and optional.** With the member's OK, and only if an email tool is connected, search their sent mail read only and show them the list of messages you propose to use. Read only the messages they approve. Never send, draft, label, or change anything.
- **Never change a voice without the member's OK.** Show every change as a plan and wait for a yes.
- **Pronouns.** Use the person's name or "they". Never guess a pronoun from a name.
- Write in plain words. Never use em dashes in anything you say or write, except a short quote of the person's own words when it is a habit of theirs (and say so). Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`voice_library_db_id`, `voice_profile_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile after the scan, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

### Voice Library safety net
This skill saves to the Voice Library, so make sure it exists before you start.
1. If `voice_library_db_id` is missing, or that database cannot be opened, search the member's workspace under the root page for a database titled "Voice Library". If you find one, save its ID as `voice_library_db_id` in the Page IDs section and continue.
2. If there is none, say: "Your Voice Library isn't in your workspace yet. I can add it now with the standard Hi5 layout. OK?" If they agree, create ONE database called "Voice Library" inside the root page with these properties: Name (title); Skill Name (text); For (select: Self, Teammate, Client or brand); Status (select: Active, Draft, Retired); Version (number); Date (date). Save its ID as `voice_library_db_id` in the Page IDs section, and continue.
3. If they say no, or the database cannot be created, do not lose the work. Give the member the guide and the skill file in the chat and as the backup file, say "I couldn't save this to your Notion. Run /hi5-setup and it will offer to add your Voice Library, then ask me to save it," and stop trying to save. The voice skill still works from its embedded snapshot. Never create a second Voice Library, and never create any other database.

## Step 1: Scan

Read the Voice Library (every entry's Name, Skill Name, For, Status, Version), the Voice Profile page, the Master Profile voice and edge notes, and the personality profile. Say in one or two lines what you found, for example "I found your Voice Profile notes and your DISC result, and one voice in the Library: jacobs-voice, version 2." Then ask what the member wants.

> 1. Create a new voice
> 2. Update a voice I already have (new samples, or merge what it has learned)

If the Library is empty, go straight to creating a voice.

## Step 2: Who is this voice for, and the name

Ask: "Is this voice for you, a teammate, or a client or brand?" Then agree the name.
- The skill name is lower case with hyphens and ends in `-voice`: the person's first name plus `s-voice` (jacobs-voice, miguels-voice), or the brand name plus `-voice` (smith-dental-voice). Drop any character that is not a letter, a number, or a hyphen.
- Check the Voice Library for a Skill Name that matches. If one exists, say so and offer to update that voice instead (Step 8), or to choose another name. Never make a duplicate.
- If the member's own voice is the first one, set it as the `default_voice` (see Step 7) after they confirm.
- For a teammate or a client, say the one OK line from the core rules.

## Step 3: Collect samples

Read `references/interview.md` (the sample guide). Ask for samples that the person wrote or said themselves: emails, texts, documents, social posts, blog posts, video, YouTube or podcast transcripts, and voice memo transcripts. Aim for at least two kinds of writing plus one spoken transcript if they have one. Accept pasted text and uploaded files. If an email tool is connected, offer the read-only sent mail pass described in the core rules. Say what you have after each batch (the kinds and a rough amount) and what would help most. If a sample looks AI-written, ask before using it.

## Step 4: Interview

Run the questions in `references/interview.md`, a few at a time, skipping anything the samples and the scan already answered. Show the member what you inferred from the samples as statements they can correct (for example "You open emails with just their first name and end with 'Talk soon'. Right?").

## Step 5: Build the voice guide

Follow `references/voice-guide.md`. Show the guide to the member and ask what is off. Do not save yet.

## Step 6: Test and refine

Write three short pieces in the voice: an email, a text, and a social post, on topics the member chooses or from a neutral prompt such as a short note to confirm a meeting. Use only placeholders for facts. Ask the member to rate each (sounds like me, close, not me) and to edit anything. For each edit, say in one line what you learned ("you cut the exclamation points and shorten the opening") and update the guide. Repeat with new pieces until the member says "that's me."

## Step 7: Save and build the skill

After the member says "that's me," show a plan: the Voice Library entry, the skill name, and the files. Wait for the OK, then do all three.
1. **Voice Library entry.** Create the entry from `templates/voice-library-entry.md`: Name, Skill Name, For, Status Active, Version 1, today's date, and the page body (the full guide, an empty Learned section, and the list of samples used as descriptions only). Never create a second entry for the same Skill Name.
2. **The skill.** Build the skill from `references/generated-skill.md`: the folder name is the Skill Name, with a SKILL.md that has the trigger description, the Notion lookup, the rules, and an embedded snapshot of the guide. If this session can present a skill file for the member to save (a save skill card), present it that way. Otherwise say it is not available here and use item 3.
3. **The backup file.** Save the same SKILL.md as a file the member can download, named for the Skill Name (a zip of the folder if you can make one, otherwise the SKILL.md itself), and give the install steps in `references/install-steps.md`.
If this is the member's own first voice, offer to set it as `default_voice` on the Voice Profile page (saved only with their OK). If the member has other voices, say which one is the default.
Tell the member how to use it: say "write as [name]" or "in [name]'s voice", or run any Hi5 writing skill and choose the voice.

## Step 8: Update a voice

For an existing voice, read its Library entry (the guide, the Learned section, the version, and the samples list), then offer:
- **New samples.** Run Steps 3 to 6 for the new material only, and show what would change in the guide as Before and After.
- **Merge Learned notes.** Show each lesson in the Learned section and ask which ones to fold into the guide. Rewrite the guide with those lessons, and move the merged lessons out of Learned (keep one line, "Merged in version N on [date]: [count] lessons").
After the member's OK: update the guide on the entry, bump the Version number by 1, set the date, update the samples list, and build a fresh skill and backup file with the new snapshot. Tell the member to replace the installed copy with the new file (see the install steps). Never change a voice without their OK.

## Keeping voices current (what you tell the member)

- When they edit a draft or say "I'd never say that" or "too formal" to the voice skill or to a Hi5 writing skill using the voice, that skill offers to save the lesson to the entry's Learned section, one lesson at a time, only with their OK. The next draft uses it right away.
- After about 10 saved lessons, suggest running /hi5-voice-creator again to merge them into the guide, bump the version, and get a fresh skill file.

## NEXT STEP

Recommend ONE next step. After creating the member's own voice, suggest writing something with it (for example an email with /hi5-email, or a post with /hi5-social). After creating a teammate's or a client's voice, suggest a writing skill for that person. After an update, suggest installing the new file. If the member has no personality profile, you can mention /hi5-self as optional, but do not block on it.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
