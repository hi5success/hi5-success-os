# Voice Library Entry: Page Template

Create one row in the Voice Library database (`voice_library_db_id`) per voice. The row's page body holds the guide. Never create a second row for the same Skill Name.

## Row properties
- **Name:** the person's name or the brand name, as the member says it.
- **Skill Name:** the skill's folder name, for example jacobs-voice.
- **For:** Self, Teammate, or Client or brand.
- **Status:** Active (Draft while building, Retired if the member stops using it).
- **Version:** a number, starting at 1. Bump by 1 on every update.
- **Date:** the date of this version.

## Page body (in this order, with these exact headings)

**First line:**
> Voice guide for {{Name}}, version {{N}}, {{date}}. The skill {{skill name}} reads this page each time it runs.

### Guide
The full voice guide, built as `references/voice-guide.md` describes, without the Samples used section.

### Learned
Dated bullets, one lesson each, added only with the member's OK. Leave the section empty when the entry is created.
Format: `- 2026-10-11: Never opens with "Hope you're well".`

### Samples used
A list of descriptions only: the kind (email, text, post, transcript), the approximate date, and where it came from. Never the raw text, and no private details.

### Version log
One line per version: `Version 1, 2026-10-11, created from N samples.` On an update add: `Version 2, 2026-12-01, merged 10 lessons and added 3 samples.`
