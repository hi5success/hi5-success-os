# Master Profile: Page Layout and Field Names

The Master Profile is one Notion page called "Master Profile" inside the root page titled "Hi5 Success OS Workspace" (the root's first line is the marker `hi5-os-root: v1`; see FINDING THE HI5 SUCCESS OS WORKSPACE in `SKILL.md`). Every Hi5 skill reads it. This file is the contract: the section names and field names below are exactly what skills look for.

## Rules that never change
- **Fields are append-only.** Never rename or delete an existing field or section. Only add new ones. Members already have profiles saved, and every skill relies on the names below.
- **Never append to the end of the page.** The last section is always the **Linked pages** heading, and child pages (Compliance Guardrails, Voice Profile, Objection Bank, Neighborhoods) appear below it. Insert every new section or bullet inside its own section, before the Linked pages heading.
- **Ask once for a missing field.** If a skill needs a field the profile does not have, ask the member for it once, save it in the right section, and continue. Do not ask again.
- **`profile_version`** in Setup Status says which release of this layout the profile has. /hi5-setup compares it with the current version (see `profile-changes.md`) and offers to fill in anything new.

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
- profile_version: the layout version this profile was built with. The current version is 2. A profile with no value was built before versioning, so treat it as version 1
- industry: the member's own words (for example "real estate agent", "business coach")
- industry_flow: `real-estate` or `generic`. Skills use this to load the right `industries/` file
- stage_1_core_profile: `not started`, `in progress: <what is done>`, or `complete <date>`
- stage_2_compliance: same values
- stage_3_voice: same values
- stage_4_objection_bank: same values (real estate only; leave out for other industries)
- stage_5_neighborhoods: same values (real estate only; leave out for other industries)
- self_test: `passed <date>` or `needs work <date>: <gaps>` (written by the setup self-test)
- projects_offered: the date /hi5-next offered the Claude Projects tip. It is set once, and it is the only thing /hi5-next ever writes. Not a setup question

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
- niche: their specific focus within the industry (asked in Stage 1)

### Tools
- website
- crm
- crm_usage
- calendar_software

### Presence
- social_platforms: each platform with its URL
- youtube_url
- google_reviews: Google review count (written by /hi5-seo)
- newsletter_name, newsletter_frequency, newsletter_audience (written by /hi5-newsletter)

### Brand
- brand_status
- brand_color
- brand_font
- branding_interest: yes or no (a follow-up from Hi5 Biz Solutions)

### Business
- price_range (real estate): typical price range of the homes they work with
- market_conditions: what their market is doing right now, in their words
- focus (real estate): buyers, sellers, or both
- client_categories: the client types they work with, as a list. Choices: buyers, sellers, renters or tenants, landlords, investors, 55+ communities, luxury, first-time buyers, new construction, relocation, commercial sales, commercial leases, land, plus anything else they add
- offer (any industry): what they sell or offer, with the typical price
- lead_sources_ranked: lead or customer sources, biggest first
- goal_12_month: their 12-month goal in their own words. /hi5-bizplan turns it into numbers

### Business Numbers
Written by /hi5-bizplan, not by setup. Skills that need these numbers read them here instead of the plan text. Fields are added over time and never renamed. Real estate and any-industry plans use the same section.
- deals_closed_last_year, deals_closed_ytd: deals, clients, or projects
- total_volume_last_year, gci_last_year, gci_ytd (real estate)
- revenue_last_year, revenue_ytd, avg_deal_value (any industry)
- leads_received, agreements_signed, closed_transactions
- avg_sale_price, buyer_seller_split (real estate)
- brokerage_split, cap_amount, cap_year_reset, brokerage_fees: the member's own commission model in their words (real estate). Never filled from a preset
- take_home_note, capacity_note (any industry)
- team_deals_count_to_leader: yes or no (teams)
- plan_period: the period the goal covers
- goal_type: gci, take-home, deals, revenue, or clients
- gci_goal, take_home_goal, transaction_goal, revenue_goal, client_goal
- milestone_goal: any award, level, or milestone, with what it takes, in the member's words
- gbp_status: Google Business Profile status
- social_frequency, paid_ads, marketing_goals, top_lead_source, desired_lead_source
- last_plan_date
- client_mix: the member's share of business by client type or offer, in their words
- quarter_basis, seasonality_note, avg_days_to_close: asked once by /hi5-goals
- current_quarter (for example 2026-Q4), goals_last_set, last_check_in: written by /hi5-goals
- quarter_deals_goal, quarter_gci_goal, quarter_take_home_goal (real estate)
- quarter_clients_goal, quarter_revenue_goal, quarter_take_home_goal (any industry)

### Edge
Written by Stage 3.
- client_situations: the 2 or 3 situations they handle best, described as situations, never as demographics
- differentiator
- proof_point: `[ADD PROOF]` if they had none
- client_words: three words their best clients would use

### Self Profile
Written by /hi5-self. Not part of /hi5-setup.

### Content Profile
Added by /hi5-yt-setup (Content OS). Not created by /hi5-setup; the skeleton does not include it. Fields: `channels` (list of channel names), `offer`, `youtube_audience`, `affiliate_links`, `channel_goal`, `content_model`, `posting_frequency`, `weekly_rhythm`, `recording_schedule`, `edit_turnaround_days`, `competitor_channel_ids`, `content_categories`, `distribution`, `default_deliverable_type`, `primary_platform`, and the operator preferences `output_format`, `script_depth`, `number_of_options`, `explanation_level`. With more than one channel, each extra channel is a child page "Channel – [name]" whose fields override these.

### Compliance Guardrails (child page, not a section)
A child page of the Master Profile created by Stage 2, ID in `compliance_page_id`. Its Inputs section holds `disclosure_line`, `last_confirmed`, and (real estate) `protected_class_jurisdictions`, `brokerage_ad_rules`, `sms_consent_status`, or (any industry) `industry_rules`, `messaging_consent_status`, `brand_policy`. Below the inputs are the guardrails every writing skill follows. Templates: `compliance-real-estate.md`, `compliance-generic.md`.

### Voice Profile (child page, not a section)
A child page of the Master Profile, ID in `voice_profile_page_id`. Bullets: `vocabulary_style`, `sentence_rhythm`, `emoji_use`, `preferred_length`, `phrases_used`, `phrases_never_used`, `how_to_come_across`, `energy_level`, `cta_style`, followed by a voice summary, proof samples, and gaps. Stage 3 of /hi5-setup creates it (template `voice-profile.md`). /hi5-yt-setup adds `energy_level` and `cta_style` if missing, and creates the page only if the member has not done Stage 3.

### Linked pages
Always the last section. It holds only the heading. Child pages created by the stages appear below it.

Later releases add more sections to this layout. Add them here when they are defined, and add them to `profile-changes.md`.

## Renamed fields (before the first release only. Fields are never renamed after release)
| Old name | Use now |
|---|---|
| `PROFILE.re_role` | `role` |
| `PROFILE.years_licensed` | `years_in_business` |
| `PROFILE.location` (generic flow) | `primary_market` |
| `PROFILE.industry` (never stored before) | `industry` and `industry_flow` |
| `PROFILE.storage` / `STORAGE` | `storage` (always `notion`) |
