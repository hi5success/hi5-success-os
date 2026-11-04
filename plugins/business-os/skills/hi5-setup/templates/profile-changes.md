# Profile Versions

The Master Profile has a `profile_version` in Setup Status. /hi5-setup compares it with the current version below. When a profile is behind, setup offers to fill in only the new fields (see PROFILE UPDATE in `SKILL.md`).

Current profile_version: 4

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
| template_version | Setup Status | Automatic. `2` for the template that ships Skill Guide, `3` for the Nov 4, 2026 template, `none` before the template existed |

## Version 4 (Nov 4, 2026 template)
Ask only for the ones that are missing. The new databases and the Brain Index are offered by the workspace check, not asked as questions.

| Field | Section | Filled by |
|---|---|---|
| bio, story, mission | Identity | Stage 1, a short question for each, in the member's words. Update ID: S1-BIO |
| meeting_transcripts | Tools | Stage 1, where meeting transcripts come from. Update ID: S1-TRANSCRIPTS |
| file_storage | Tools | Stage 1, the synced folder. An existing `synced_folder_path` in Content Settings counts as the answer. Update ID: S1-STORAGE |
| content_roles | Tools | /hi5-content-plan setup, who does each content role. Update ID: S1-ROLES |
| brain_index_page_id, tasks_db_id, sops_db_id, software_stack_db_id, offers_db_id, proof_db_id, decisions_log_db_id, ai_memory_db_id, client_meetings_db_id, internal_meetings_db_id | Page IDs | The workspace build or the workspace check, by title. Automatic |
| stage_4_objections (alias of stage_4_objection_bank), self_test | Setup Status | Automatic |
| template_version 3 | Setup Status | Automatic |

Removed from the template, never created: the Skill Guide and the Reference Hub (skills and the setup order are in the Hi5 Vault, vault.hi5success.com), and the `skill_guide_page_id` field stays in old profiles but is no longer used.

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
| voice_library_db_id (Page IDs) and default_voice (Voice Profile page) | Page IDs, Voice Profile page | /hi5-voice-creator, the first time it saves a voice. The Voice Library is a database in the workspace template, and the setup workspace check offers it to older workspaces |
| One Voice Library row per voice (guide, Learned notes, samples list), and Learned lessons saved by voice-using skills | Voice Library | /hi5-voice-creator and every Hi5 writing skill that uses a voice, with the member's OK |
| dashboards_db_id (Page IDs) | Page IDs | /hi5-dashboard, the first time it saves a dashboard. The Dashboards database is in the workspace template, and the setup workspace check offers it to older workspaces |
| One Dashboards row per dashboard (pages, widgets, data sources, connected apps, the Notion databases used, email button settings, discovery answers) | Dashboards | /hi5-dashboard |
| people_db_id (Page IDs) and people_page_id (Self Profile) | Page IDs, Self Profile | /hi5-self, the first time it saves a People row. The People database is in the workspace template, and the setup workspace check offers it to older workspaces |
| One People row and page per person (role, reports to, personality and Human Design profile, communication tips, status, profile source, profile date) | People | /hi5-self, with the member's OK |
| ai_employees_db_id (Page IDs) | Page IDs | /hi5-org-chart, the first time it saves an AI employee. The AI Employees database is in the workspace template, and the setup workspace check offers it to older workspaces |
| One AI Employees row per AI employee (role, human manager, status, review cadence and date, Claude Project link), and an Org chart link and overload threshold under Notes on the member's own People page | AI Employees, People | /hi5-org-chart, with the member's OK |
| bottlenecks_db_id (Page IDs) | Page IDs | /hi5-bottleneck, the first time it saves a bottleneck. The Bottlenecks database is in the workspace template, and the setup workspace check offers it to older workspaces |
| One Bottlenecks row per bottleneck (task, owner, hours per week, pain, automatable, fix type, status, AI employee, estimated and actual hours saved), and one job description page per AI employee on its AI Employees row | Bottlenecks, AI Employees | /hi5-bottleneck, with the member's OK |
| coach_library_db_id, advisory_board_db_id, board_meetings_db_id and coach_library_ds_id, advisory_board_ds_id, board_meetings_ds_id (Page IDs) | Page IDs | /hi5-library, /hi5-advisor, /hi5-board, the first time each one saves. The skill creates the database with the member's OK |
| Library Folders and Board Updates sections | Master Profile | /hi5-library |
| One Coach Library row per saved post, one Advisory Board row per advisor (its brain is the row's page), and one Board Meetings row per meeting (the full notes are the row's page) | Coach Library, Advisory Board, Board Meetings | /hi5-library, /hi5-advisor, /hi5-board |
| commission_rate (Business Numbers) | Business Numbers | /hi5-dashboard, the first time the Potential revenue widget needs it. Never filled from a preset |
| commission_per_side, split_to_member (Business Numbers) | Business Numbers | /hi5-dashboard, the first time the Potential revenue widget needs them. Ask once to convert an older free-text commission_rate. Never filled from a preset |
| tasks_db_id | Page IDs | Whoever creates the Tasks database writes it right away |
| A Type property on the Dashboards database | Dashboards | /hi5-dashboard adds it on first use |
| email_platform, email_format_by_segment | Tools | /hi5-email, the first time it asks the formatting choices, and after each campaign |
| results_disclaimer | Compliance Guardrails page, Inputs | /hi5-email, only if the member gives their own wording for asterisked results claims |
| content_page_id, content_settings_page_id, content_sop_page_id, cover_template_page_id (Page IDs) | Page IDs | /hi5-content-plan, the first time it sets up the content calendar |
| The Hi5 Content pages (Content Settings, Content SOP, Cover Template, a Style Guide and an Edit Log per channel), and the added Content Planner statuses, Deliverable Types, Clip Number, Needs from member, and the clip date fields | Hi5 Content page, Content Planner | /hi5-content-plan and the content roles, with the member's OK. The setup workspace check offers the new Content Planner options to older workspaces |
| One Listing Appointment row per kit | Marketing Hub | /hi5-re-listing-appt |
| mls_remarks_limit, coming_soon_policy, sold_price_policy | Tools | /hi5-re-listing-launch, asked once and only if the profile does not already say |
| One Listing Launch row per piece, and one Seller Update row per update or plan | Marketing Hub | /hi5-re-listing-launch, /hi5-re-seller-updates |
