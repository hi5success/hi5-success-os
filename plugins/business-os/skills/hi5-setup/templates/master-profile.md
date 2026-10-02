# Master Profile — Page Layout and Field Names

The Master Profile is one Notion page called "Master Profile" inside the root page titled "Hi5 Success OS Workspace" (the root's first line is the marker `hi5-os-root: v1`; see FINDING THE HI5 SUCCESS OS WORKSPACE in `SKILL.md`). Every Hi5 skill reads it. This file is the contract: the section names and field names below are exactly what skills look for.

## Format
- Each section is a heading 2.
- Under it, one bullet per field in the form `- field_name: value`.
- Use the exact snake_case field names below. Do not rename them.
- Multiple values go on one line separated by commas. Longer text goes on one line too.
- A field the member skipped is left out or written `not provided`. Skills must tolerate a missing field.
- Never put these field names in front of the member. Talk about them in plain language.

## Sections and fields

### Setup Status
- storage: notion
- industry: the member's own words (for example "real estate agent", "business coach")
- industry_flow: `real-estate` or `generic`. Skills use this to load the right `industries/` file
- stage_1_core_profile: `not started`, `in progress — <what is done>`, or `complete <date>`
- stage_2_compliance: same values
- stage_3_voice: same values
- stage_4_objection_bank: same values (real estate only; leave out for other industries)
- stage_5_neighborhoods: same values (real estate only; leave out for other industries)

### Page IDs
Written by Phase 4 of /hi5-setup and by later stages. Skills read these instead of searching. Never show these to the member.
- root_page_id
- dashboard_page_id
- business_os_page_id
- business_plan_page_id
- quarterly_goals_page_id
- business_reviews_page_id
- content_planner_db_id
- marketing_hub_db_id
- skill_guide_page_id
- keyword_tracker_db_id (added by /hi5-yt-setup)
- channel_pages (added by /hi5-yt-setup, only with multiple channels): `Name = page id` pairs, comma separated
- compliance_page_id (added by Stage 2)
- voice_profile_page_id (added by Stage 3, or by /hi5-yt-setup if the member has not done Stage 3)
- objection_bank_page_id (added by Stage 4)
- neighborhoods: `Name = page id` pairs, comma separated (added by Stage 5)

### Identity
- name
- business_name
- role: how they operate (solo, team, team leader, and so on), in the industry file's wording
- years_in_business: for real estate this is years licensed
- languages
- brokerage (real estate only)
- states_licensed (real estate only)
- team_details (real estate only): the answers to the role follow-up questions, as one line

### Market
- primary_market: main city or area. Fully online members give their main audience region or "online"
- surrounding_areas
- market_reach (generic flow): local, regional, national, or online
- niche: their specific focus within the industry

### Tools
- website
- crm
- crm_usage
- calendar_software

### Presence
- social_platforms: each platform with its URL
- youtube_url

### Brand
- brand_status
- brand_color
- brand_font
- branding_interest: yes or no (a follow-up from Hi5 Biz Solutions)

### Self Profile
Written by /hi5-self. Not part of /hi5-setup.

### Content Profile
Added by /hi5-yt-setup (Content OS). Not created by /hi5-setup; the skeleton does not include it. Fields: `channels` (list of channel names), `offer`, `youtube_audience`, `affiliate_links`, `channel_goal`, `content_model`, `posting_frequency`, `weekly_rhythm`, `recording_schedule`, `edit_turnaround_days`, `competitor_channel_ids`, `content_categories`, `distribution`, `default_deliverable_type`, `primary_platform`, and the operator preferences `output_format`, `script_depth`, `number_of_options`, `explanation_level`. With more than one channel, each extra channel is a child page "Channel – [name]" whose fields override these.

### Compliance Guardrails (child page, not a section)
A child page of the Master Profile created by Stage 2, ID in `compliance_page_id`. Its Inputs section holds `disclosure_line`, `last_confirmed`, and (real estate) `protected_class_jurisdictions`, `brokerage_ad_rules`, `sms_consent_status`, or (any industry) `industry_rules`, `messaging_consent_status`, `brand_policy`. Below the inputs are the guardrails every writing skill follows. Templates: `compliance-real-estate.md`, `compliance-generic.md`.

### Voice Profile (child page, not a section)
A child page of the Master Profile, ID in `voice_profile_page_id`. Bullets: `vocabulary_style`, `sentence_rhythm`, `energy_level`, `cta_style`, `phrases_used`, `phrases_never_used`. Stage 3 of /hi5-setup defines and extends it; /hi5-yt-setup creates it only if the member has not done Stage 3 yet.

Later stages and commits add more sections to this layout (compliance links, voice, business context). Add them here when they are defined.

## Renamed fields (older skills may still use the old names)
| Old name | Use now |
|---|---|
| `PROFILE.re_role` | `role` |
| `PROFILE.years_licensed` | `years_in_business` |
| `PROFILE.location` (generic flow) | `primary_market` |
| `PROFILE.industry` (never stored before) | `industry` and `industry_flow` |
| `PROFILE.storage` / `STORAGE` | `storage` (always `notion`) |
