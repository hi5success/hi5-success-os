# Hi5 Setup — Real Estate Industry Flow

## Purpose
Capture the identity and tools profile for a real estate agent, team, or broker. This data fills the Master Profile and is read by every other Hi5 skill. Field names in `Store:` lines are the names in `templates/master-profile.md`.

## Rules
- One question at a time
- Multiple choice where provided — they can always add more detail
- Hold confirmed answers and write them to the Master Profile at each checkpoint (end of each group)
- Skipped questions are fine. Skills tolerate missing fields

---

# STAGE 1 — Core Profile (about 10 minutes)

## GROUP A — You and Your Market

**Q1 — Name**
> "What is your full name?"
Store: name

**Q2 — Brand Name**
> "What is your business or brand name? If you operate under your personal name just say that."
Store: business_name

**Q3 — Brokerage**
> "What brokerage are you with?"
Store: brokerage

**Q4 — Role**
> "How do you operate your real estate business?"
>
> A) Solo agent — I run everything independently
> B) Spouse/Partner team — we work together as a unit
> C) On a team — I am part of someone else's team
> D) Team Leader — I run my own team
> E) Broker/Owner — I own the brokerage

Store: role

Branch follow-ups (store the answers together as one line in `team_details`):
- Spouse/Partner → "Do you both create content together or separately?" + "Is your brand joint or individual?"
- On a team → "Does your team have a brand you operate under or do you build your personal brand alongside it?"
- Team Leader → "How many agents are on your team?" + "Are you still personally producing or focused purely on leading?"
- Broker/Owner → "How many agents are in your office?" + "Are you still actively selling or focused on recruiting and leadership?"

**Q5 — Experience**
> "How many years have you been a licensed real estate agent?"
Store: years_in_business

**Q6 — Market**
> "What city or market do you primarily serve?"
Store: primary_market

**Q7 — Surrounding Areas**
> "Do you serve any surrounding areas, counties, or neighborhoods worth mentioning?"
Store: surrounding_areas

**Q8 — Multi-State**
> "Are you licensed in multiple states or provinces?"
>
> A) No — just one state
> B) Yes — (ask which states)

Store: states_licensed

**Q9 — Languages**
> "Do you speak any languages other than English?"
>
> A) No — English only
> B) Yes — (ask which languages)

Store: languages

→ **Checkpoint A:** write the answers above to Identity and Market.

## GROUP B — Your Tools and Online Presence

**Q10 — Website**
> "Do you have a website?"
>
> A) Yes — drop the URL
> B) No — not yet

Store: website

**Q11 — CRM**
> "What CRM are you using to manage your contacts and leads?"
>
> A) GoHighLevel
> B) Follow Up Boss
> C) KVCore
> D) CINC
> E) Spreadsheet or manual tracking
> F) No CRM yet

Store: crm

**Q12 — CRM Usage**
> "How are you currently using your CRM?"
>
> A) Barely scratching the surface
> B) Basic contact management
> C) Using automations and pipelines
> D) Using it to its full potential

Store: crm_usage

**Q13 — Calendar Software**
> "Do you use any calendar or scheduling software?"
>
> A) Calendly
> B) GHL Calendar
> C) Google Calendar
> D) Other — (ask which)
> E) No — I manage manually

Store: calendar_software

**Q14 — Social Platforms**
> "What social media platforms are you active on? Share your profile links for any you use."
>
> Select all that apply:
> A) YouTube
> B) Instagram
> C) Facebook
> D) TikTok
> E) LinkedIn
> F) Email list

Store: social_platforms (with URLs)

**Q15 — YouTube**
> "Do you have a YouTube channel?"
>
> A) Yes — drop the URL
> B) No, but I am interested in starting one
> C) No and not planning to

Store: youtube_url

→ **Checkpoint B:** write the answers above to Tools and Presence.

## GROUP C — Your Brand (optional)
Say first: "Last group, and it's optional. Say 'skip' on any of these and we'll come back to it later."

**Q16 — Branding**
> "Where does your branding stand right now?"
>
> A) Fully branded — logo, colors, fonts, everything consistent
> B) Logo only — but inconsistent across platforms
> C) Needs a refresh — I have something but it feels outdated
> D) Starting from scratch — I need everything

Store: brand_status

**Q17 — Brand Color**
> "What is your primary brand color? If you know your hex code drop it here, otherwise just describe the color family and we will work with it."
Store: brand_color

**Q18 — Brand Font**
> "Do you have a primary font you use in your marketing? If you are not sure just say so."
Store: brand_font

**Q19 — Branding Help**
> "One last thing on branding — if you ever want professional help with your brand identity (logo, colors, fonts, full brand guide), our team at Hi5 Biz Solutions works specifically with real estate agents on this. Head over to the Hi5 Success community and drop a message in the services channel and we will get you the details on packages and pricing."
>
> "Would you like me to make a note of this in your profile so we follow up with you?"
>
> A) Yes please
> B) No thanks — I have got it covered

Store: branding_interest

→ **Checkpoint C:** write the answers above to Brand. Stage 1 is complete.

---

# STAGE 2 — Compliance (about 5 minutes)

Template: `templates/compliance-real-estate.md`. Creates the **Compliance Guardrails** page. Follow the general procedure in `SKILL.md`.

Intro: "This sets up the rules every draft follows: Fair Housing, advertising rules, and your required disclosure line. That way I never have to guess, and everything I write for you is ready to use. A few questions about your brokerage and state."

**C1 — Brokerage name as licensed**
> "In your profile your brokerage is [brokerage]. Is that exactly how it appears on your license and in your advertising? If not, tell me the exact wording."
Store: part of disclosure_line (if `brokerage` is empty, ask "What is your brokerage name exactly as it is licensed?")

**C2 — License number**
> "What is your real estate license number? If your state also requires a broker or team license number in ads, include that too."
Store: part of disclosure_line

**C3 — Equal Housing wording**
> "How do you show Equal Housing Opportunity in your marketing? Most agents use the words 'Equal Housing Opportunity', often with the logo. Tell me your wording or say 'standard'."
Store: part of disclosure_line (standard = "Equal Housing Opportunity")

**C4 — State-required text**
> "Does your state or brokerage require any other wording in advertising? For example the REALTOR® mark, a team name next to your brokerage, or a statement about where you are licensed. Say 'none' if you're not sure. We can add it later."
Store: part of disclosure_line

Compose `disclosure_line` as one line, for example: `[Name], [Brokerage], License #[number]. [Equal Housing wording]. [Any other required text]`. Show it to the member and ask whether it is exactly what they want at the end of every public piece.

**C5 — Protected classes in your area**
> "Fair Housing protects certain groups everywhere in the US, and some states and cities protect more. I have your market as [primary_market] and your licensing as [states_licensed, or 'one state']. Which state or states and which city should I treat as covered? I'll make sure drafts avoid every class protected there. Please confirm the full list with your broker or attorney. I won't claim to know your local law."
Store: protected_class_jurisdictions (derive a suggestion from `primary_market` and `states_licensed`, then confirm)

**C6 — Brokerage advertising rules**
> "Does your brokerage have advertising rules I should follow? Things like how to use a team name, whether ads need broker approval before they go live, or anything else. Say 'none' if not."
Store: brokerage_ad_rules

**C7 — Texting consent**
> "Do you have documented consent, like a signed form or an opt-in, to text the people in your database?
>
> A) Yes
> B) No
> C) Not sure"

Store: sms_consent_status (yes, no, or unsure). If no or unsure, tell the member: "No problem. I'll keep text campaigns off the table until that's sorted, and I can show you how to collect consent."

Then build the page, show the five-bullet summary from the template, and ask: "Do you want me to follow these guardrails on everything I draft for you?" Save per the general procedure.
