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
> **Real estate members also install Real Estate OS.** It is a separate install and it works only for real estate. It adds `/hi5-re-crm` and `/hi5-re-listing-appt`.

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
| `/hi5-re-crm` | Runs your CRM by conversation, GoHighLevel first with a paste mode for any other CRM. Tests the connection, maps your CRM, logs leads, showings, and appointments, turns contracts and leases into CRM updates, books meetings, moves and cleans up deals, closes or loses deals, forecasts your pipeline, and drafts and sends one message at a time. Covers every client type. Shows a plan and waits for your OK before any change or send, checks texting consent, and keeps Fair Housing out of every record |
| `/hi5-re-listing-appt` | Prepares you for a listing appointment and follows up after it. Builds the game plan, the pre-appointment intake, a CMA from comps you export from your own MLS (or an optional browser-assisted search on your own login), the pricing conversation, objection answers, and the follow-up sequence. Works for home sellers, landlords, investors, 55+ community sellers, luxury, and land, new construction, and commercial. Never quotes a standard commission. Drafts only |

---

## How it stays current

Your Master Profile records the version of the Hi5 layout it was built with. When the plugin adds something new, `/hi5-setup` offers to fill in only what is new. It never overwrites or removes what you already saved.

---

## Questions or support

Visit [hi5success.com](https://hi5success.com) or ask in the Hi5 Success community.
