# Profile Versions

The Master Profile has a `profile_version` in Setup Status. /hi5-setup compares it with the current version below. When a profile is behind, setup offers to fill in only the new fields (see PROFILE UPDATE in `SKILL.md`).

Current profile_version: 3

Rules for adding a version:
- Only add new fields and sections. Never rename or delete existing ones.
- List each new field here, the section it lives in, and which question or skill fills it.
- Raise the current version number above, and set it in `workspace-build.md` (step 4) so new profiles start at the current version.
- Add a plain-language entry to the member-facing changelog in Notion.

## Version 1
Profiles built before versioning existed (early test builds). A profile with no `profile_version` is version 1.

## Version 2 (release 1.2.0)
Fields are filled by setup questions unless noted. Ask only the ones that are missing.

| Field | Section | Filled by |
|---|---|---|
| client_categories | Business | Stage 1, group C, client types question. Update ID: S1-CATEGORIES |
| disclosure_line_short, disclosure_line_full | Compliance Guardrails page | Stage 2, short version question. Update ID: S2-SHORT-LINE. An existing `disclosure_line` stays and counts as the full line |
| required_notices | Compliance Guardrails page | Stage 2, state notices question. Update ID: S2-NOTICES |
| proof_point_public | Edge | Stage 3, public or internal question. Update ID: S3-PUBLIC. Stage 4 asks the same for each proof point (Update ID: S4-PROOF-FLAGS) |
| avoid_em_dashes | Voice Profile page | Stage 3, em dash question. Update ID: S3-EMDASH |
| branding_help_asked | Brand | Stage 1, group D. Set once the offer has been made or skipped. Update ID: S1-BRANDING-ASKED |
| Business Numbers section | Business Numbers | /hi5-bizplan fills it the next time the member runs it. Setup does not ask for it |
| Linked pages heading | Linked pages | Added automatically |
## Version 3 (release 1.6.0)
Both fields are automatic. Setup fills them in without asking.

| Field | Section | Filled by |
|---|---|---|
| workspace_source | Setup Status | Automatic. `template` when the member copied the Hi5 template, `built` otherwise |
| template_version | Setup Status | Automatic. `2` for the current template, `none` for a built workspace |

## Added without a version change
These fields are collected inside the skill that uses them, not by setup, so `profile_version` stays at 2. Each is asked once, saved to Business Numbers, and never renamed or deleted.

| Field | Section | Filled by |
|---|---|---|
| quarter_basis, seasonality_note, avg_days_to_close, client_mix, current_quarter, goals_last_set, last_check_in, and the quarter headline numbers | Business Numbers | /hi5-goals, the first time it needs them |
| last_review_date, review_quarter | Business Numbers | /hi5-bizreview, each time a review is saved |
| lead_source_costs | Business Numbers | /hi5-bizreview, asked once if the member wants cost per closing by lead source |
| A `Sources:` tally on a check-in log line | Quarterly Goals page | /hi5-goals, the optional weekly source question |
| One section per review, newest first, on the Business Reviews page, plus a link line in that quarter's section on the Quarterly Goals page | Business Reviews page, Quarterly Goals page | /hi5-bizreview |
| crm_connection, ghl_location_name, last_crm_map, crm_map_page_id | Tools, Page IDs | /hi5-re-crm, the first time it maps the member's CRM |
| mls_name, cma_adjustments | Tools | /hi5-re-listing-appt, asked once when a CMA is built |
| One Listing Appointment row per kit | Marketing Hub | /hi5-re-listing-appt |
