# Hi5 Setup — Generic Industry Flow

## Purpose
Capture the identity and tools profile for any industry that does not have its own flow. Same structure as the real estate flow, in universal language. Field names in `Store:` lines are the names in `templates/master-profile.md`.

## Rules
- One question at a time
- Multiple choice where provided
- Hold confirmed answers and write them to the Master Profile at each checkpoint (end of each group)
- Skipped questions are fine. Skills tolerate missing fields
- Use the member's own words for their industry (the `industry` field) wherever a question says [their industry]

---

# STAGE 1 — Core Profile (about 10 minutes)

## GROUP A — You and Your Market

**Q1 — Name**
> "What is your full name?"
Store: name

**Q2 — Brand Name**
> "What is your business or brand name? If you operate under your personal name just say that."
Store: business_name

**Q3 — Role**
> "How do you operate your business?"
>
> A) Solo — I run everything myself
> B) Partner/Spouse team — we run it together
> C) Part of a larger organization
> D) I lead a team
> E) I own the company/agency

Store: role

**Q4 — Niche**
> "What is your specific niche or area of focus within [their industry]?"
Store: niche

**Q5 — Market Reach**
> "Do you serve clients locally, regionally, nationally, or fully online?"
Store: market_reach

**Q6 — Main Market**
> "What city or area is your main market? If you work fully online, tell me the region your audience is mostly in, or just say online."
Store: primary_market

**Q7 — Experience**
> "How many years have you been in business?"
Store: years_in_business

**Q8 — Languages**
> "Do you speak any languages other than English?"
>
> A) No — English only
> B) Yes — (ask which)

Store: languages

→ **Checkpoint A:** write the answers above to Identity and Market.

## GROUP B — Your Tools and Online Presence

**Q9 — Website**
> "Do you have a website?"
>
> A) Yes — drop the URL
> B) No — not yet

Store: website

**Q10 — CRM**
> "What CRM or tool do you use to manage your contacts and clients?"
>
> A) GoHighLevel
> B) HubSpot
> C) Salesforce
> D) Spreadsheet or manual
> E) No CRM yet
> F) Other — (ask which)

Store: crm

**Q11 — CRM Usage**
> "How are you currently using it?"
>
> A) Barely using it
> B) Basic contact management
> C) Automations and pipelines
> D) Full potential

Store: crm_usage

**Q12 — Calendar Software**
> "Do you use any scheduling software?"
>
> A) Calendly
> B) GHL Calendar
> C) Google Calendar
> D) Other
> E) No — I manage manually

Store: calendar_software

**Q13 — Social Platforms**
> "What social platforms are you active on? Drop your links."
>
> A) YouTube
> B) Instagram
> C) Facebook
> D) TikTok
> E) LinkedIn
> F) Email list

Store: social_platforms (with URLs)

**Q14 — YouTube**
> "Do you have a YouTube channel?"
>
> A) Yes — drop the URL
> B) Interested but not started
> C) Not planning to

Store: youtube_url

→ **Checkpoint B:** write the answers above to Tools and Presence.

## GROUP C — Your Brand (optional)
Say first: "Last group, and it's optional. Say 'skip' on any of these and we'll come back to it later."

**Q15 — Branding**
> "Where does your branding stand?"
>
> A) Fully branded and consistent
> B) Logo only — inconsistent
> C) Needs a refresh
> D) Starting from scratch

Store: brand_status

**Q16 — Brand Color**
> "What is your primary brand color? Hex code if you know it, or just describe the color."
Store: brand_color

**Q17 — Brand Font**
> "Do you have a primary font? If not just say so."
Store: brand_font

**Q18 — Branding Help**
> "If you ever need help with brand identity — logo, colors, fonts, full brand guide — our team at Hi5 Biz Solutions handles this across multiple industries. Head to the Hi5 Success community and drop a message in the services channel for details on packages and pricing.
>
> Want me to note this in your profile?"
>
> A) Yes please
> B) No thanks

Store: branding_interest

→ **Checkpoint C:** write the answers above to Brand. Stage 1 is complete.

---

# STAGE 2 — Compliance (about 5 minutes)

Template: `templates/compliance-generic.md`. Creates the **Compliance Guardrails** page. Follow the general procedure in `SKILL.md`.

Intro: "This sets up the rules every draft follows, like honest claims, any wording your business has to include, and how I handle email and text outreach. That way what I write is ready to use. Four quick questions."

**C1 — Required wording**
> "Is there any wording you have to include in your marketing? For example a license number, a legal or results disclaimer, or a company tagline. Say 'none' if not."
Store: disclosure_line

**C2 — Industry rules**
> "Is your industry regulated in how you can advertise? For example finance, insurance, health, legal, or real estate. If so, tell me the rules you have to follow. Say 'none' if not."
Store: industry_rules

**C3 — Email and text consent**
> "Do you have permission from the people on your email list or phone list to message them? For example a signup form, an opt-in, or a signed agreement.
>
> A) Yes — documented
> B) Partly
> C) Not sure
> D) I don't use email or text outreach"

Store: messaging_consent_status. If B or C, tell the member: "No problem. I'll flag consent before any outreach campaign, and I can help you set up a simple opt-in."

**C4 — Company policy**
> "Does your company, employer, or franchise have marketing rules I should follow? Things like logo use, approval before publishing, or words to avoid. Say 'none' if not."
Store: brand_policy

Then build the page, show the five-bullet summary from the template, and ask: "Do you want me to follow these guardrails on everything I draft for you?" Save per the general procedure.
