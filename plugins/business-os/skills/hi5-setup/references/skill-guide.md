# The Skill Guide

Used by `SKILL.md` Phase 6, by the re-run menu, when the member says "refresh my skill guide" or "update my skill guide", and when the quiet snapshot check shows a plugin update. The Skill Guide is a plain-English page in the member's brain (`skill_guide_page_id`): "If you want X, just say Y". It is built from the skills that are installed. It is never a hardcoded list.

## Source: the installed skills
Read the skills that are available in this session (the list of skills with their names and descriptions that Claude can see). Keep only Hi5 skills: names that start with `hi5-`, grouped by the plugin in front of the colon (for example `marketing-os:hi5-email` belongs to Marketing OS). Also keep the member's own voice skills (the ones listed in their Voice Library), under "Your voice skills". Ignore every other skill.

Never use a remembered list, this repo's docs, or an old copy of the guide as the source. If you cannot see the installed skills in this chat, say so: "I can't see your installed skills here. Open a chat where your Hi5 plugins are installed and say refresh my skill guide." Then stop. Do not fall back to a list.

## The page
1. **Title and line:** "Skill Guide" and "Built from your installed Hi5 skills on <date>. Say refresh my skill guide any time to update it."
2. **One heading per plugin that is installed**, named in plain words (Business OS, Content OS, Marketing OS, Real Estate OS, or the plugin's own name). A plugin with no installed skills gets no heading.
3. **One bullet per skill:** "If you want [what it does, in plain words, from the skill's description], just say: "[phrase]", "[phrase]". (or run /hi5-name)". Take the two or three clearest everyday phrases from the description's trigger phrases. Do not invent phrases. If a description has none, show the command only.
4. **The Hi5 first line:** a short section showing the line from `hi5-first.md` with the member's link, so it is easy to find again.
5. **My notes:** an empty section the member owns. A refresh never touches it.
6. **Snapshot:** a last line `skills_snapshot: <the installed Hi5 skill names, sorted, comma separated>` in small text. It is how a later run notices a change.

Write in plain words, one line per skill, no em dashes, no jargon, no internal field names.

## When to build or refresh
- **Setup (Phase 6):** build it. If `skill_guide_page_id` is missing, create a page called "Skill Guide" (icon 📖) under the root page, and save its ID.
- **The member asks** ("refresh my skill guide", "update my skill guide"): rebuild it now.
- **After a plugin update:** on a re-run (the workspace check), compare the installed Hi5 skill names with the snapshot line. If they differ, say once: "Your Hi5 skills changed since your Skill Guide was built. Want me to refresh it?" Ask once per run. Never rebuild without the member's OK on a re-run. A skill that only changed its wording does not count.

## Writing it
Show a one-line summary first ("N skills in M plugins"), then replace everything above "My notes" with the fresh content, and keep "My notes" exactly as it is. Confirm in one line when done.
