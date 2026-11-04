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
- profile_version: the layout version this profile was built with. The current version is 4. A profile with no value was built before versioning, so treat it as version 1
- industry: the member's own words (for example "real estate agent", "business coach")
- industry_flow: `real-estate` or `generic`. Skills use this to load the right `industries/` file
- stage_1_core_profile: `not started`, `in progress: <what is done>`, or `complete <date>`
- stage_2_compliance: same values
- stage_3_voice: same values
- stage_4_objection_bank: same values (real estate only; leave out for other industries)
- stage_5_neighborhoods: same values (real estate only; leave out for other industries). The template skeleton also lists `stage_4_objections`: read it as the same field as `stage_4_objection_bank`, and never create both
- workspace_source: `template` (copied the official Hi5 template) or `built` (created by setup). Set automatically, never asked
- template_version: the version of the template layout (`3` for the current template, `2` for the previous one, `none` for a workspace the Hi5 template was not used for). A built workspace has the same layout as the current template. Set automatically, never asked
- self_test: `passed <date>` or `needs work <date>: <gaps>` (written by the setup self-test)
- hi5_first_shown: the date setup showed the Hi5 first line (the one line the member pastes into Claude's personal preferences). It is written once and never asked again. Not a setup question
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
- skill_guide_page_id (no longer used: the Skill Guide moved to the Hi5 Vault, vault.hi5success.com. Never create it. An old value is left in place)
- brain_index_page_id (the Brain Index page, the map of the brain every AI reads first)
- tasks_db_id (the Tasks database. Whoever creates it writes the ID right away)
- sops_db_id, software_stack_db_id, offers_db_id, proof_db_id, decisions_log_db_id, ai_memory_db_id (added by the workspace build, or by the setup workspace check)
- client_meetings_db_id, internal_meetings_db_id (the two meeting notes databases, written by /hi5-meetings)
- crm_map_page_id (added by /hi5-re-crm)
- keyword_tracker_db_id (added by /hi5-content-plan)
- channel_pages (added by /hi5-content-plan, only with multiple channels): `Name = page id` pairs, comma separated
- compliance_page_id (added by Stage 2)
- voice_profile_page_id (added by Stage 3, or by /hi5-content-plan if the member has not done Stage 3)
- voice_library_db_id (added by /hi5-voice-creator, or by the setup workspace check)
- dashboards_db_id (added by /hi5-dashboard, or by the setup workspace check)
- people_db_id (added by /hi5-self, or by the setup workspace check)
- content_page_id, content_settings_page_id, content_sop_page_id, cover_template_page_id (added by /hi5-content-plan, only for members who set up the content calendar)
- ai_employees_db_id (added by /hi5-org-chart, or by the setup workspace check)
- bottlenecks_db_id (added by /hi5-bottleneck, or by the setup workspace check)
- coach_library_db_id, advisory_board_db_id, board_meetings_db_id, and the data source IDs next to them: coach_library_ds_id, advisory_board_ds_id, board_meetings_ds_id (added by /hi5-library, /hi5-advisor, and /hi5-board, the first time each one saves, with the member's OK. Queries and new rows use the data source ID)
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
- bio, story, mission: the member's short bio, their story, and their mission, in their own words (asked in Stage 1, and used by every writing skill)

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
- meeting_transcripts: where the member's meeting transcripts come from (Google Meet, Zoom, Fathom, Otter, Fireflies, a Drive folder, or pasted), as a list. Used by /hi5-meetings
- file_storage: the synced folder the member keeps files in (Google Drive, Dropbox, or OneDrive) and its path. Content skills read this before `synced_folder_path` in Content Settings, and files go only there
- content_roles: for each content role (Content Manager, Video Editor, Social Media, YouTube Producer, Blog Writer), `Role = Claude`, `Role = <person name>`, or `Role = nobody`
- crm_connection: `ghl-connector`, `other-connector`, or `paste-mode` (written by /hi5-re-crm)
- ghl_location_name: the GoHighLevel sub-account the member normally uses (written by /hi5-re-crm)
- last_crm_map: the date the CRM Map was last updated (written by /hi5-re-crm)
- email_platform: GoHighLevel, Mailchimp, Constant Contact, Klaviyo, Gmail, or other (asked once by /hi5-email, only if the profile does not already say)
- email_format_by_segment: the last formatting style and emoji choice used for each audience segment, as `Segment = style/emojis` pairs, for example `Past buyers = B/C` (written by /hi5-email)
- mls_name: the member's MLS (asked once by /hi5-re-listing-appt)
- cma_adjustments: the member's own adjustment values for a CMA, in their words (asked once by /hi5-re-listing-appt)
- mls_remarks_limit: the member's MLS remarks length limit (asked once by /hi5-re-listing-launch, only if unknown)
- coming_soon_policy: whether the member's MLS and broker allow coming soon marketing before the list date (asked once by /hi5-re-listing-launch, only if unknown)
- sold_price_policy: whether sold prices may be published in the member's state and MLS (asked once by /hi5-re-listing-launch, only if unknown)

### Presence
- social_platforms: each platform with its URL
- youtube_url
- google_reviews: Google review count (written by /hi5-seo)
- website_platform: GoHighLevel, Astro, WordPress, Squarespace, Wix, a real estate website provider, or other. Detected and confirmed by /hi5-site-audit, saved once
- languages_published: the languages the member publishes website content in (written by /hi5-site-audit or /hi5-seo)
- nap_name, nap_address, nap_phone: the business name, address (or "service area business, address hidden"), and phone to use exactly everywhere. Asked once by /hi5-seo
- gbp_url: the member's Google Business Profile address (asked once by /hi5-seo)
- last_site_audit, last_citation_check: dates written by /hi5-site-audit and /hi5-seo
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
- brokerage_split, cap_amount, cap_year_reset, cap_progress: the member's own split, cap, cap year start date, and how much of the cap is used so far (real estate). Never filled from a preset
- commission_rate (real estate): the member's own commission rate as they state it, per side if it differs. Added by /hi5-dashboard the first time the Potential revenue widget needs it. Never filled from a preset or a typical rate
- commission_per_side, split_to_member (real estate): the member's own commission per side as a percent, and the share of it they keep after their brokerage split, as a percent. Added by /hi5-dashboard the first time the Potential revenue widget needs them, or when the member converts an older free-text commission_rate. Never filled from a preset or a typical rate
- per_deal_fees: one line per fee: name, amount, continues after cap, counts toward cap (real estate)
- post_cap_terms, royalty_percent, royalty_annual_cap, royalty_ytd: after cap terms, and any franchise or royalty fee with its own annual cap and the amount paid so far (real estate)
- recurring_fees, team_split, referral_fees, outside_costs: recurring brokerage fees, team split, referral fees, and costs the member wants counted. Lines may be "none" or "not sure"
- fee_order_note: the order of deductions the member confirmed in plain words
- brokerage_fees: a one line summary of the structure, kept for older skills
- per_sale_fees, processing_fees, partner_fees, recurring_costs (any industry): fees and costs on each sale, payment processing, partner or referral fees, and recurring costs
- take_home_note, capacity_note (any industry)
- team_deals_count_to_leader: yes or no (teams)
- plan_period: the period the goal covers
- goal_type: gci, take-home, deals, revenue, or clients
- gci_goal, take_home_goal, transaction_goal, revenue_goal, client_goal
- milestone_goal: any award, level, or milestone, with what it takes, in the member's words
- gbp_status: Google Business Profile status
- social_frequency, paid_ads, marketing_goals, top_lead_source, desired_lead_source
- last_plan_date
- offers: one line per thing the member sells: name, who buys it, typical price (asked once by /hi5-funnel)
- offer_categories: which rule categories the offer touches: health or medical results, income or earnings, housing or real estate, credit or loans, a job or career opportunity, social issues or politics, or none (asked once by /hi5-funnel)
- agent_facing_offers: yes only if a real estate member has said they recruit agents or sell products to agents. Never assumed or asked
- client_mix: the member's share of business by client type or offer, in their words
- quarter_basis, seasonality_note, avg_days_to_close: asked once by /hi5-goals
- current_quarter (for example 2026-Q4), goals_last_set, last_check_in: written by /hi5-goals
- last_review_date, review_quarter, lead_source_costs: written by /hi5-bizreview (the date of the last review, the quarter reviewed, and monthly spend per lead source, one line per source)
- quarter_deals_goal, quarter_gci_goal, quarter_take_home_goal (real estate)
- quarter_clients_goal, quarter_revenue_goal, quarter_take_home_goal (any industry)

### Edge
Written by Stage 3.
- client_situations: the 2 or 3 situations they handle best, described as situations, never as demographics
- differentiator
- proof_point: `[ADD PROOF]` if they had none
- client_words: three words their best clients would use

### Self Profile
Written by /hi5-self. Not part of /hi5-setup. It ends with `people_page_id`, the member's own page in the People database.

### Content Profile
Added by /hi5-content-plan (Content OS). Not created by /hi5-setup; the skeleton does not include it. Fields: `channels` (list of channel names), `offer`, `youtube_audience`, `affiliate_links`, `channel_goal`, `content_model`, `posting_frequency`, `weekly_rhythm`, `recording_schedule`, `competitor_channel_ids`, `content_categories`, `distribution`, `default_deliverable_type`, `primary_platform`, and the operator preferences `output_format`, `script_depth`, `number_of_options`, `explanation_level`. With more than one channel, each extra channel is a child page "Channel – [name]" whose fields override these.

### Compliance Guardrails (child page, not a section)
A child page of the Master Profile created by Stage 2, ID in `compliance_page_id`. Its Inputs section holds `disclosure_line`, `last_confirmed`, and (real estate) `protected_class_jurisdictions`, `brokerage_ad_rules`, `sms_consent_status`, or (any industry) `industry_rules`, `messaging_consent_status`, `brand_policy`. Below the inputs are the guardrails every writing skill follows. Templates: `compliance-real-estate.md`, `compliance-generic.md`.

### Voice Profile (child page, not a section)
A child page of the Master Profile, ID in `voice_profile_page_id`. Bullets: `vocabulary_style`, `sentence_rhythm`, `emoji_use`, `preferred_length`, `phrases_used`, `phrases_never_used`, `how_to_come_across`, `energy_level`, `cta_style`, `default_voice` (the Skill Name of the member's own voice in the Voice Library, added by /hi5-voice-creator), followed by a voice summary, proof samples, and gaps. Stage 3 of /hi5-setup creates it (template `voice-profile.md`). /hi5-content-plan adds `energy_level` and `cta_style` if missing, and creates the page only if the member has not done Stage 3.

### Library Folders
Added by /hi5-library when the member pulls a saved folder. Not created by /hi5-setup. One bullet per folder: `- platform | folder name | folder URL | last synced <date and time>`. It sits in its own section above Linked pages, never at the end of the page.

### Board Updates
Added by the monthly creator check that /hi5-library can schedule. One bullet per finding, `- advisor key | what's new | found <date>`, so /hi5-board and /hi5-advisor can offer a refresh. A line the member declined ends with `| declined <date>`. A refresh of that advisor clears its lines. It also holds `- master_coach_refresh_declined: <date and time> | <n> posts`, saved when the member says no to a Master Coach refresh (n is the number of Business advice, Sales pitch, and Story posts at that moment). It sits in its own section above Linked pages.

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
