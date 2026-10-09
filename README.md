# Hi5 Success OS

Hi5 Success OS is a set of Claude plugins that gives you a business operating system: setup, personality profiling, business planning, content creation, and marketing. It saves everything to your own Notion workspace, so every skill already knows your business and you never re-explain it.

It works for any industry. It is strongest for real estate agents, teams, and brokers, and real estate members get extra setup steps for their client types and market.

---

## What you need

- **Claude** (the Cowork plugin marketplace)
- **Notion** (free at [notion.so](https://www.notion.so)). Notion is required for now, because that is where your profile and your work are saved. If you don't have it, `/hi5-setup` walks you through creating a free account and connecting it, which takes about 2 minutes.
- **A YouTube Data API key** (free), only if you use the YouTube research skills. `/hi5-yt-setup` walks you through getting one.

---

## How to install

> **[PLACEHOLDER: Cowork install steps. To be filled in with the exact clicks.]**
>
> Marketplace link to add: `https://github.com/hi5success/hi5-success-os`
>
> Plugins to install: Business OS, Content OS, and Marketing OS. Business OS comes first, because it holds `/hi5-setup`.
>
> **Real estate members also install Real Estate OS.** It is a separate install and it works only for real estate. It adds `/hi5-re-crm`, `/hi5-re-listing-appt`, `/hi5-re-listing-launch`, `/hi5-re-seller-updates`, `/hi5-re-transaction`, `/hi5-re-daily`, `/hi5-re-sphere`, `/hi5-re-prospect`, `/hi5-re-buyer`, `/hi5-re-ads`, `/hi5-re-roleplay`, `/hi5-re-rental`, `/hi5-re-investor`, `/hi5-re-commercial`, and `/hi5-re-land-newbuild`.

---

## Your Hi5 workspace template

Hi5 Success OS saves everything to a Notion workspace you copy once. `/hi5-setup` walks you through it, or you can copy it yourself first: open the link, choose Duplicate, and then run `/hi5-setup`.

Template link: https://zest-slipper-053.notion.site/Hi5-Success-OS-Workspace-369e3ca532e58179a559c5b482271a85

---

## Your first 10 minutes

1. In Claude, type `/hi5-setup`.
2. Claude gets Notion ready and helps you copy the Hi5 workspace template into your Notion (the link is above). It asks about your industry and then asks about 20 questions about you and your business, one at a time.
3. When it finishes, you can start using any skill right away.

Setup is in stages, and you can stop and pick up later by running `/hi5-setup` again. Each stage after the first makes specific skills better:

| Stage | What it adds | Time |
|---|---|---|
| 1. Core profile | Who you are, your market and business, tools, social links | about 10 min |
| 2. Compliance | Your disclosure line and advertising and messaging rules, so everything is ready to publish | about 5 min |
| 3. Voice and edge | Who you serve best, what sets you apart, and how you write | about 8 min |
| 4. Objection bank (real estate) | Your answers to common pushback from each client type | about 10 min per client type |
| 5. Neighborhoods (real estate) | A fact file for each area you serve | about 10 min per area |

Then run `/hi5-self` (a 30 question personality profile, so everything is written for you) and `/hi5-bizplan` (your business plan).

**Not sure what to do next at any point? Run `/hi5-next`.** It reads your progress and tells you your best next step, with two alternatives. It never changes anything in your Notion.

---

## The skills

### Business OS
| Command | What it does |
|---|---|
| `/hi5-next` | Tells you your best next step, based on what you have finished. Run it any time you are unsure. It only reads your Notion and never changes it |
| `/hi5-setup` | Gets Notion ready, helps you copy the Hi5 workspace template into it, and fills your Master Profile in stages. Run it again any time to continue, update, or add a neighborhood |
| `/hi5-self` | A 30 question assessment of how you work, communicate, and decide. Accepts results you already have from DISC, Human Design, Enneagram, 16 Personalities, CliftonStrengths, Kolbe, and others |
| `/hi5-bizplan` | Builds your business plan with the math shown step by step, using your own split, fees, and goals. Works for any brokerage or business |
| `/hi5-goals` | Breaks your plan into this quarter's targets and a 13 week plan, shows the math from your own numbers, and runs a weekly check-in. Never assumes anyone's commission rules |
| `/hi5-bizreview` | Reviews how you are doing against your plan for this quarter, last quarter, or the year to date. Compares actual with plan by client type or offer and by lead source, shows take-home using your own fees, finds the bottleneck, and gives up to three adjustments. Saves each review to your Business Reviews page. Works for any business |

### Content OS
| Command | What it does |
|---|---|
| `/hi5-yt-setup` | Adds your content and voice details to your Master Profile and helps you get a YouTube API key |
| `/hi5-yt-research` | Finds video ideas from keywords and competitors, scores them, and adds them to your Content Planner |
| `/hi5-yt-plan` | Builds your monthly content calendar in Notion |
| `/hi5-yt-script` | Writes a script or outline in your voice |
| `/hi5-repurpose` | Turns a video or script into short form scripts, pull quotes, and snippets |
| `/hi5-blog` | Writes an SEO blog post from a video, script, or topic |
| `/hi5-social` | Writes platform specific captions |

### Marketing OS
| Command | What it does |
|---|---|
| `/hi5-email` | Builds email nurture sequences |
| `/hi5-newsletter` | Writes a weekly or monthly newsletter issue |
| `/hi5-seo` | Builds a local SEO and Google Business Profile plan |
| `/hi5-site-audit` | Audits your live website page by page: titles, descriptions, headings, schema, speed, links, languages, and Fair Housing language. Gives a prioritized fix list with steps for your platform, and compares with your last audit |
| `/hi5-linkedin` | Writes LinkedIn posts from your existing content |
| `/hi5-website` | Writes website page copy |
| `/hi5-landing` | Writes landing page copy for a single offer |
| `/hi5-funnel` | Builds a complete funnel for any offer in any industry: an Offer Brief, one core message, compliant ads, the landing page, the thank-you page, and follow-up emails, plus step by step build instructions for your platform. Can also audit a page, ad, or email. Drafts only |
| `/hi5-casestudy` | Turns a client win into a case study |

### Real Estate OS (real estate members only, a separate install)
| Command | What it does |
|---|---|
| `/hi5-re-crm` | Runs your CRM by conversation, GoHighLevel first with a paste mode for any other CRM. Tests the connection, maps your CRM, logs leads, showings, and appointments, turns contracts and leases into CRM updates, books meetings, moves and cleans up deals, closes or loses deals, forecasts your pipeline, runs a CRM tune-up from the gaps you confirm, and drafts and sends one message at a time. Covers every client type. Shows a plan and waits for your OK before any change or send, checks texting consent, and keeps Fair Housing out of every record |
| `/hi5-re-listing-appt` | Prepares you for a listing appointment and follows up after it. Builds the game plan, the pre-appointment intake, a CMA from comps you export from your own MLS (or an optional browser-assisted search on your own login), the pricing conversation, objection answers, and the follow-up sequence. Works for home sellers, landlords, investors, 55+ community sellers, luxury, and land, new construction, and commercial. Never quotes a standard commission. Drafts only |
| `/hi5-re-listing-launch` | Launches a listing: MLS remarks and a social version, caption angles, a ten-post content pack, a just-listed email, a graphics brief (with an optional build in your own Canva as drafts), a 30-day marketing calendar, an open house kit, and the just-sold, under contract, and price improvement posts. Works for homes, rentals, investor properties, 55+ communities, luxury, and land, new construction, and commercial. Every draft goes through a Fair Housing scan, and nothing is posted or sent for you |
| `/hi5-re-seller-updates` | Keeps sellers informed from signing to closing and rescues listings that stall: prep plan, honest weekly updates (including slow weeks), showing feedback requests, offer presentations, the final two weeks to closing, the review and referral ask, price adjustment cases, stalled listing diagnoses, condition plans, withdraw and relaunch plans, hard seller conversations, and re-earning an expired listing. Filters steering remarks out of showing feedback. Drafts only |
| `/hi5-re-transaction` | Runs a file from signed contract or lease to keys. Reads the executed document, builds the phase-by-phase checklist and the key dates calendar, writes the weekly client status update, offer acknowledgments and buyer cover letters, inspection repair requests and responses, appraisal gap briefs, the final walkthrough sheet, the closing day message, and the message after a deal falls apart. Works for buyers, sellers, tenants, landlords, investors, 55+ resales, new construction, land, and commercial files. Every date comes from the executed document, and nothing is sent or changed without your OK |
| `/hi5-re-daily` | Shows what matters today and this week from your CRM, inbox, and calendar, read only: a morning briefing, who to call today, who needs attention this week, a Friday deal rescue review, an end-of-day shutdown, week-ahead calendar prep, and inbox triage that rescues forgotten leads. Optional browser-assisted jobs on your own MLS login (market pulse, active listing pricing check, buyer alert matching, and competing listing positioning), with export or paste as the fallback. Never writes or sends anything |
| `/hi5-re-sphere` | Keeps past clients and your sphere close: a database touch plan, the 12 month post-close plan, past client reconnect as Gmail drafts, no-agenda check-in texts, the home anniversary note, referral and review asks, a milestone calendar, closing gift ideas and card notes, and handwritten notes. Texting consent and do-not-contact status are checked on every touch, and nothing of value is ever tied to a referral or a review. |
| `/hi5-re-prospect` | Runs your own prospecting to expireds, FSBOs, and a farm: ranks expired listings from an export or an optional browser-assisted review on your own MLS login, writes the comeback and FSBO sequences, farm plans and letters, door-knock and call scripts, and equity conversation questions. Works with lists from your own data vendor. It never skip traces, never bulk texts, and checks Do Not Call and texting consent on every touch. |
| `/hi5-re-buyer` | Guides buyers and renters from the first conversation to an offer: the consultation game plan, a one-page Buyer Brief built on property needs only, the buyer agreement conversation (compensation is set by agreement, never a standard rate), search and showing plans, after-showing follow-up, offer strategy and multiple-offer prep, weekly buyer updates, nurture for buyers who are not ready yet, and answers to "I want to wait". Covers first-time, move-up, relocation, investor, luxury, 55+ community, new construction, land, and tenant representation. Drafts only. |
| `/hi5-re-ads` | Writes Meta and Google ad packs as drafts that follow the Meta Housing Special Ad Category (no age, gender, or ZIP targeting, a radius of at least 15 miles, no lookalikes). Campaign brief and setup steps, seller ads, listing and open house ads, buyer and relocation ads, retargeting, Google search ads, the 5-minute follow-up for ad leads with texting consent checked, a weekly ad review, and an audit of an ad you already have. It never connects to an ad account and never launches anything. |
| `/hi5-re-roleplay` | Practice a hard conversation before it counts: a listing appointment, the fee conversation, a buyer who wants to wait, a multiple-offer talk, a cold call to an expired or FSBO owner, an investor, a tenant, or a steering request. It plays the other person, scores you, quotes where you lost them, and rewrites your weakest answer in your voice. Practice only, nothing is sent. |
| `/hi5-re-rental` | Runs the landlord side of a rental: a rent pricing brief from rental comps you supply, written screening criteria applied the same way to every applicant, the rental listing plan, an anonymous applications tracker and decision script, the renewal plan, the move-out checklist, and a monthly owner update. Leases, notices, and adverse-action wording stay with the owner and their attorney. |
| `/hi5-re-investor` | Works with investor clients: the buy box, a deal numbers worksheet where the investor supplies every figure and the math is shown, side by side property comparisons, the due diligence checklist, the portfolio sale and exchange timeline, and investor updates. It never states or promises a return. |
| `/hi5-re-commercial` | Supports commercial sales and leases: the requirements intake, a total occupancy cost comparison from the documents, a letter of intent outline for the client and attorney to complete, tenant rep and landlord rep talk tracks, the due diligence and lease review checklist, and the weekly client update. Attorney review is a step in every phase. |
| `/hi5-re-land-newbuild` | Supports land and new construction: a land due diligence plan, the new construction buyer guide (builder contract questions, selections tracker, inspections, punch list), builder and community comparisons from the builders' own materials, and the timeline. It never states what can be built or a cost to build. |

---

## How it stays current

Your Master Profile records the version of the Hi5 layout it was built with. When the plugin adds something new, `/hi5-setup` offers to fill in only what is new. It never overwrites or removes what you already saved.

---

## Questions or support

Visit [hi5success.com](https://hi5success.com) or ask in the Hi5 Success community.
