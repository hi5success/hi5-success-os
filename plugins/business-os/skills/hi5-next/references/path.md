# The Hi5 Success OS Path

The single source of truth for what /hi5-next recommends. Every release that adds or ships a skill MUST update this file, the README, and the Dashboard text in `hi5-setup/templates/workspace-build.md`. CI fails if a skill folder is missing from the table below, or if a skill is listed as `coming` after it has shipped.

## How to read the table
- **Skill:** the command. Every skill folder must have a row, except `hi5-context`, which is a reference file and not a command.
- **Status:** `live` means it has shipped. `coming` means it is planned or a stub. Never recommend a `coming` skill.
- **Path stage:** where it sits on the path.
- **Done when:** the signal /hi5-next reads from Notion. Treat a signal it cannot read as not done.
- **Why it matters:** one sentence, in plain words, for the recommendation.

## The path, in order
1. **Foundation:** Setup Stage 1, Stage 2, Stage 3, /hi5-self, /hi5-bizplan, /hi5-goals, /hi5-bizreview, then for real estate Setup Stage 4 and Stage 5
2. **Content strategy:** /hi5-yt-setup, /hi5-yt-research, /hi5-yt-plan
3. **Create:** /hi5-yt-script, /hi5-repurpose, /hi5-social, /hi5-blog
4. **Get found:** /hi5-seo, /hi5-site-audit, /hi5-website
5. **Nurture:** /hi5-email, /hi5-newsletter
6. **Grow:** /hi5-landing, /hi5-funnel, /hi5-casestudy

Anytime (never part of the path, offer only when it fits): /hi5-linkedin

Real estate members with Real Estate OS installed (never part of the main path, offer only when it fits): /hi5-re-crm, /hi5-re-listing-appt, /hi5-re-listing-launch, /hi5-re-seller-updates, /hi5-re-transaction, /hi5-re-daily

## Skills

| Skill | Plugin | Status | Path stage | Done when | Why it matters |
|---|---|---|---|---|---|
| `/hi5-setup` | business-os | live | Foundation | Setup Status `stage_1_core_profile` is complete | Every other skill reads your profile, so you never re-explain your business. |
| `/hi5-self` | business-os | live | Foundation | The Self Profile section has a `behavioral_style` | It lets everything I write match how you think and communicate. |
| `/hi5-bizplan` | business-os | live | Foundation | Business Numbers has `last_plan_date` | It turns your goals into numbers and a 90 day roadmap, and other skills read those numbers. |
| `/hi5-goals` | business-os | live | Foundation | Business Numbers `current_quarter` is the quarter we are in, and the Quarterly Goals page has a section for it | It breaks your plan into this quarter's targets and a 13 week plan, and a weekly check-in keeps you on track. |
| `/hi5-bizreview` | business-os | live | Foundation | Business Numbers has `last_review_date` | It compares your results with your plan by client type and lead source, shows your take-home, and tells you what to adjust. |
| `/hi5-next` | business-os | live | Anytime | Never done, always available | It tells you the best next step any time you are unsure. |
| `/hi5-yt-setup` | content-os | live | Content strategy | A Content Profile section exists | It sets your channel goals and posting rhythm so research and planning fit you. |
| `/hi5-yt-research` | content-os | live | Content strategy | The Content Planner has at least one row | It finds video ideas that are scored for your niche. |
| `/hi5-yt-plan` | content-os | live | Content strategy | The Content Planner has a row with Status Scheduled, Scripted, or Published | It turns your ideas into a calendar with publish dates. |
| `/hi5-yt-script` | content-os | live | Create | The Content Planner has a row with Status Scripted or Published | It writes the script in your voice for a scheduled video. |
| `/hi5-repurpose` | content-os | live | Create | A Content Planner row has a Repurpose Status other than Not Started | One piece of content becomes short form scripts, quotes, and snippets. |
| `/hi5-social` | content-os | live | Create | A Content Planner row has Deliverable Type Social Post, or Repurpose Status Captions Written or Posted | It writes platform specific captions so you stay visible. |
| `/hi5-blog` | content-os | live | Create | A Content Planner row has Deliverable Type Blog | A blog post gives your content a home on your website and helps people find you on Google. |
| `/hi5-seo` | marketing-os | live | Get found | The Marketing Hub has a row of Type SEO Strategy | It shows how to get found on Google in your market. |
| `/hi5-site-audit` | marketing-os | live | Get found | The Marketing Hub has a row of Type SEO Audit | It checks your website page by page and gives you a short, prioritized fix list. |
| `/hi5-website` | marketing-os | live | Get found | The Marketing Hub has a row of Type Website Copy | Clear website copy turns visitors into leads. |
| `/hi5-email` | marketing-os | live | Nurture | The Marketing Hub has a row of Type Email Sequence | A nurture sequence follows up with leads so they do not go cold. |
| `/hi5-newsletter` | marketing-os | live | Nurture | The Marketing Hub has a row of Type Newsletter | A newsletter keeps you top of mind with your list. |
| `/hi5-landing` | marketing-os | live | Grow | The Marketing Hub has a row of Type Landing Page | A focused page for one offer turns traffic into leads. |
| `/hi5-funnel` | marketing-os | live | Grow | The Marketing Hub has a row of Type Funnel | It builds a whole funnel for one offer: the message, ads, landing page, thank-you page, and follow-up emails. |
| `/hi5-casestudy` | marketing-os | live | Grow | The Marketing Hub has a row of Type Case Study | A real client story builds trust and referrals. |
| `/hi5-linkedin` | marketing-os | live | Anytime | The Marketing Hub has a row of Type LinkedIn Posts | LinkedIn reaches referral partners and professionals. |
| `/hi5-re-crm` | real-estate-os | live | Real estate | The Master Profile Page IDs has `crm_map_page_id` | It lets you run your CRM by chat: log leads and showings, turn contracts and leases into updates, and see your pipeline, with your OK before anything changes. |
| `/hi5-re-listing-appt` | real-estate-os | live | Real estate | The Marketing Hub has a row of Type Listing Appointment | It prepares you for a listing appointment and follows up until the seller decides. |
| `/hi5-re-listing-launch` | real-estate-os | live | Real estate | The Marketing Hub has a row of Type Listing Launch | It writes the listing copy, graphics brief, 30-day calendar, open house kit, and the just-sold, under contract, and price improvement posts, with Fair Housing built in. |
| `/hi5-re-seller-updates` | real-estate-os | live | Real estate | The Marketing Hub has a row of Type Seller Update | It keeps sellers informed from signing to closing, presents offers, and rescues listings that stall. |
| `/hi5-re-transaction` | real-estate-os | live | Real estate | The Marketing Hub has a row of Type Transaction | It runs a file from signed contract or lease to keys: the checklist, the key dates, client updates, repair and appraisal messages, and closing day. |
| `/hi5-re-daily` | real-estate-os | live | Real estate | Never done, always available | It shows what matters today and this week from your CRM, inbox, and calendar: who to call, which deals are at risk, and what is due. It only reads. |

## Setup stages
These are not separate commands. They are stages of /hi5-setup. Recommend them as "run /hi5-setup and choose Continue setup". Real estate only means skip for other industries.

| Stage | Done when | Why it matters |
|---|---|---|
| Stage 2: Compliance | Setup Status `stage_2_compliance` is complete | It makes everything I write ready to publish, with your disclosure line and rules built in. |
| Stage 3: Voice and edge | Setup Status `stage_3_voice` is complete | It makes my writing sound like you and shows what sets you apart. |
| Stage 4: Objection bank (real estate only) | Setup Status `stage_4_objection_bank` is complete | It gives you answers to common pushback from each kind of client. |
| Stage 5: Neighborhoods (real estate only) | Setup Status `stage_5_neighborhoods` is complete | It gives me real local detail for listings, posts, and emails. |

## Goal menu
Used by /hi5-next ("Show me everything") and by the "Show me what I can do" option in /hi5-setup. Show only `live` skills.

| Goal | Skills |
|---|---|
| YouTube content | /hi5-yt-setup, /hi5-yt-research, /hi5-yt-plan, /hi5-yt-script, /hi5-repurpose |
| Social media | /hi5-social, /hi5-repurpose, /hi5-linkedin |
| Blog and SEO | /hi5-blog, /hi5-seo |
| Email and newsletter | /hi5-email, /hi5-newsletter |
| Website and landing pages | /hi5-website, /hi5-landing |
| Business plan and goals | /hi5-self, /hi5-bizplan |
| Proof and trust | /hi5-casestudy |
| Run my CRM by chat (real estate) | /hi5-re-crm |
| Listing appointments (real estate) | /hi5-re-listing-appt |
| Launch a listing (real estate) | /hi5-re-listing-launch |
| Keep sellers informed and rescue a stalled listing (real estate) | /hi5-re-seller-updates |
| Run a file from contract to keys (real estate) | /hi5-re-transaction |
| Plan my day and week from my CRM, inbox, and calendar (real estate) | /hi5-re-daily |

## Skip rules
- **Real estate only steps:** skip Stage 4 and Stage 5 when `industry_flow` is not `real-estate`.
- **Members with no YouTube channel:** if the member said they have no channel and are not planning one (`youtube_url` says so), skip /hi5-yt-setup, /hi5-yt-research, /hi5-yt-plan, /hi5-yt-script, and /hi5-repurpose. In the Create stage, point to /hi5-blog and /hi5-social instead. If they have not answered yet, or said they are interested in starting a channel, keep YouTube in the path.
- **Not installed:** only recommend a skill that is in your available skills list. If the next step is in a plugin that is not installed, name the plugin and say to install it from the Hi5 marketplace.
- **Real estate stage:** /hi5-re-crm, /hi5-re-listing-appt, /hi5-re-listing-launch, /hi5-re-seller-updates, /hi5-re-transaction, and /hi5-re-daily are for real estate members only. Skip them when `industry_flow` is not `real-estate`, and when Real Estate OS is not installed, say it is a separate install from the Hi5 marketplace. They are never the main recommendation unless the member asks for one of them or Step 4 says so.
- **Never recommend `coming` skills.**
