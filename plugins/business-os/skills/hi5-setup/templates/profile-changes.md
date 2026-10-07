# Profile Versions

The Master Profile has a `profile_version` in Setup Status. /hi5-setup compares it with the current version below. When a profile is behind, setup offers to fill in only the new fields (see PROFILE UPDATE in `SKILL.md`).

Current profile_version: 2

Rules for adding a version:
- Only add new fields and sections. Never rename or delete existing ones.
- List each new field here, the section it lives in, and which question or skill fills it.
- Raise the current version number above, and set it in `workspace-build.md` (step 4) so new profiles start at the current version.
- Add a plain-language entry to the member-facing changelog in Notion.

## Version 1
Profiles built before versioning existed (test builds of release 1.1.0). A profile with no `profile_version` is version 1.

## Version 2 (release 1.1.0)
Fields are filled by setup questions unless noted. Ask only the ones that are missing.

| Field | Section | Filled by |
|---|---|---|
| client_categories | Business | Stage 1, group C (client types question) |
| disclosure_line_short, disclosure_line_full | Compliance Guardrails page | Stage 2 (short and full disclosure questions). An existing `disclosure_line` stays and counts as the full line |
| required_notices | Compliance Guardrails page | Stage 2 (state notices question) |
| proof_point_public | Edge | Stage 3 (public or internal question for each proof point) |
| avoid_em_dashes | Voice Profile page | Stage 3 (em dash question) |
| branding_help_asked | Brand | Stage 1, group D. Set once the offer has been made or skipped |
| Business Numbers section | Business Numbers | /hi5-bizplan fills it the next time the member runs it. Setup does not ask for it |
| Linked pages heading | Linked pages | Added automatically |
