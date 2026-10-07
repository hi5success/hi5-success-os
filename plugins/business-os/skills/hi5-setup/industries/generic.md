# Hi5 Setup: Generic Industry Flow

## Purpose
Capture the identity and tools profile for any industry that does not have its own flow. Same structure as the real estate flow, in universal language. Field names in `Store:` lines are the names in `templates/master-profile.md`.

## Rules
- One question at a time
- Multiple choice where provided
- Hold confirmed answers and write them to the Master Profile at each checkpoint (end of each group)
- Skipped questions are fine. Skills tolerate missing fields
- Use the member's own words for their industry (the `industry` field) wherever a question says [their industry]

---

# STAGE 1: Core Profile (about 10 minutes)

## GROUP A: You and Your Market

**Q1: Name**
> "What is your full name?"
Store: name

**Q2: Brand Name**
> "What is your business or brand name? If you operate under your personal name just say that."
Store: business_name

**Q3: Role**
> "How do you operate your business?"
>
> A) Solo: I run everything myself
> B) Partner/Spouse team: we run it together
> C) Part of a larger organization
> D) I lead a team
> E) I own the company/agency

Store: role

**Q4: Niche**
> "What is your specific niche or area of focus within [their industry]?"
Store: niche

**Q5: Market Reach**
> "Do you serve clients locally, regionally, nationally, or fully online?"
Store: market_reach

**Q6: Main Market**
> "What city or area is your main market? If you work fully online, tell me the region your audience is mostly in, or just say online."
Store: primary_market

**Q7: Experience**
> "How many years have you been in business?"
Store: years_in_business

**Q8: Languages**
> "Do you speak any languages other than English?"
>
> A) No: English only
> B) Yes: (ask which)

Store: languages

→ **Checkpoint A:** write the answers above to Identity and Market.

## GROUP B: Your Tools and Online Presence

**Q9: Website**
> "Do you have a website?"
>
> A) Yes: drop the URL
> B) No: not yet

Store: website

**Q10: CRM**
> "What CRM or tool do you use to manage your contacts and clients?"
>
> A) GoHighLevel
> B) HubSpot
> C) Salesforce
> D) Spreadsheet or manual
> E) No CRM yet
> F) Other: (ask which)

Store: crm

**Q11: CRM Usage**
> "How are you currently using it?"
>
> A) Barely using it
> B) Basic contact management
> C) Automations and pipelines
> D) Full potential

Store: crm_usage

**Q12: Calendar Software**
> "Do you use any scheduling software?"
>
> A) Calendly
> B) GHL Calendar
> C) Google Calendar
> D) Other
> E) No: I manage manually

Store: calendar_software

**Q13: Social Platforms**
> "What social platforms are you active on? Drop your links."
>
> A) YouTube
> B) Instagram
> C) Facebook
> D) TikTok
> E) LinkedIn
> F) Email list

Store: social_platforms (with URLs)

**Q14: YouTube**
> "Do you have a YouTube channel?"
>
> A) Yes: drop the URL
> B) Interested but not started
> C) Not planning to

Store: youtube_url

→ **Checkpoint B:** write the answers above to Tools and Presence.

## GROUP C: Your Business
Say first: "A few questions about your business. They're what I use to build your plan and write like someone who knows your market. Say 'skip' on any you'd rather answer later."

**Q15: Offer**
> "What do you sell or offer, and what's the typical price or price range?"
Store: offer

**Q16: Market Right Now**
> "What's changing in your market or industry right now that affects your business? Rough impressions are fine."
Store: market_conditions

**Q17: Lead Sources**
> "Rank where your clients or customers come from by how much business each one produces, biggest first. Pick from this list or add your own:
>
> Referrals · Social media (organic) · YouTube · Paid ads · Email list · Events and networking · Cold outreach · Partnerships · Other"

Store: lead_sources_ranked (an ordered list, biggest first)

**Q18: 12-Month Goal**
> "What is your goal for the next 12 months? Revenue, clients, or a lifestyle goal. Say it in your own words. In /hi5-bizplan we'll turn it into exact numbers."
Store: goal_12_month

→ **Checkpoint C:** write the answers above to Business.

## GROUP D: Your Brand (optional)
Say first: "Last group, and it's optional. Say 'skip' on any of these and we'll come back to it later."

**Q19: Branding**
> "Where does your branding stand?"
>
> A) Fully branded and consistent
> B) Logo only: inconsistent
> C) Needs a refresh
> D) Starting from scratch

Store: brand_status

**Q20: Brand Color**
> "What is your primary brand color? Hex code if you know it, or just describe the color."
Store: brand_color

**Q21: Brand Font**
> "Do you have a primary font? If not just say so."
Store: brand_font

**Q22: Branding Help**
First ask: "Do you already have a designer or agency who handles your brand, or do you run your own marketing agency?" If yes, skip the offer below, store `branding_interest: no`, and move on. Never make this offer more than once: if `branding_help_asked` is already yes, skip it. Update ID: S1-BRANDING-ASKED
> "If you ever need help with brand identity, logo, colors, fonts, full brand guide, our team at Hi5 Biz Solutions handles this across multiple industries. Head to the Hi5 Success community and drop a message in the services channel for details on packages and pricing.
>
> Want me to note this in your profile?"
>
> A) Yes please
> B) No thanks

Store: branding_interest, and branding_help_asked: yes (set it whether they said yes or no)

→ **Checkpoint D:** write the answers above to Brand. Stage 1 is complete.

---

# STAGE 2: Compliance (about 5 minutes)

Template: `templates/compliance-generic.md`. Creates the **Compliance Guardrails** page. Follow the general procedure in `SKILL.md`.

Intro: "This sets up the rules every draft follows, like honest claims, any wording your business has to include, and how I handle email and text outreach. That way what I write is ready to use. A few quick questions."

**C1: Required wording**
> "Is there any wording you have to include in your marketing? For example a license number, a legal or results disclaimer, or a company tagline. Say 'none' if not."
Store: disclosure_line_full. Also store the same text as disclosure_line, the older field name, which stays for older skills.

**C2: Short version** (skip if the answer to C1 was none)
> "Do you use a shorter version for captions, ads, and short posts, where there isn't room for the full wording? If you don't have one, I'll use the full wording everywhere."
Store: disclosure_line_short (the full wording if they have no short one). Update ID: S2-SHORT-LINE

**C3: Required notices**
> "Does your industry or company require certain notices or links in some communications? For example a privacy policy, a disclaimer page, or a licensing notice. For each one, tell me the link and where you use it. Please confirm with the right professional where each one is required, because I won't guess. Say 'none' if not."
Store: required_notices (a list. Write each as: notice name | link | where the member uses it). Update ID: S2-NOTICES. Never assert where a notice is required. Use only what the member tells you.

**C4: Industry rules**
> "Is your industry regulated in how you can advertise? For example finance, insurance, health, legal, or real estate. If so, tell me the rules you have to follow. Say 'none' if not."
Store: industry_rules

**C5: Email and text consent**
> "Do you have permission from the people on your email list or phone list to message them? For example a signup form, an opt-in, or a signed agreement.
>
> A) Yes: documented
> B) Partly
> C) Not sure
> D) I don't use email or text outreach"

Store: messaging_consent_status. If B or C, tell the member: "No problem. I'll flag consent before any outreach campaign, and I can help you set up a simple opt-in."

**C6: Company policy**
> "Does your company, employer, or franchise have marketing rules I should follow? Things like logo use, approval before publishing, or words to avoid. Say 'none' if not."
Store: brand_policy

Then build the page, show the five-bullet summary from the template, and ask: "Do you want me to follow these guardrails on everything I draft for you?" Save per the general procedure.

---

# STAGE 3: Voice and Edge (about 8 minutes)

Template: `templates/voice-profile.md`. Creates the **Voice Profile** page and an **Edge** section on the Master Profile. Follow the general procedure in `SKILL.md`.

Intro: "This is what makes my writing sound like you instead of a generic business: who you serve best, what sets you apart, and how you actually talk. A few questions, then I'll write you a short voice profile you can approve."

## Part 1: Your Edge

**E1: Client situations**
> "What are the 2 or 3 client situations you handle best? Describe the situation, not the person. For example 'founders who need a plan before a launch' or 'owners whose team has outgrown their systems'."
Store: client_situations

**E2: Your differentiator**
> "What do you do that others in your field don't? Give me one proof point too: a stat, a result, or a step in your process."
Store: differentiator and proof_point. If they give no proof, ask once: "Do you have a number, result, or story that backs that up?" If still none, store the differentiator and write `proof_point: [ADD PROOF]`.
If they gave a proof point, ask: "Is it OK to use that publicly in your marketing, or is it just for your own conversations?"
Store: proof_point_public (yes or no). Update ID: S3-PUBLIC

**E3: Client words**
> "What three words would your best clients use to describe working with you?"
Store: client_words

## Part 2: Your Voice

**V1: Words to avoid**
> "Are there words, phrases, or habits you never want in your writing? For example words you'd never say, or things that sound fake to you."
Store: phrases_never_used

**V2: Formality**
> "How formal is your writing?
>
> A) Casual and conversational
> B) Professional and polished
> C) Somewhere in between"

Store: vocabulary_style

**V3: Sentences**
> "How would you describe your sentences?
>
> A) Short and punchy
> B) Long and flowing
> C) A mix"

Store: sentence_rhythm

**V4: Emoji**
> "How do you feel about emoji in your writing?
>
> A) Never
> B) Sometimes
> C) Often"

Store: emoji_use

**V5: Length**
> "What length do you usually prefer for messages, captions, and emails?
>
> A) Short: get to the point
> B) Medium
> C) Long and detailed"

Store: preferred_length

**V6: Phrases you use** *(skippable)*
> "Any phrases you say all the time, in conversations, on calls, or in your content? Just a few that come to mind."
Store: phrases_used

**V7: How you want to come across** *(skippable)*
> "In a few words, how do you want to come across? For example calm expert, friendly peer, or straight shooter."
Store: how_to_come_across

**V8: Em dashes**
> "One more style question. Do you want me to avoid em dashes (the long dash some writers use to join two thoughts) in everything I write for you? Many readers find they make writing sound like it was written by AI.
>
> A) Yes, avoid them (recommended)
> B) No, they're fine"

Store: avoid_em_dashes (yes for A or if skipped, no for B). Update ID: S3-EMDASH

## Part 3: Writing samples (optional)
> "If you'd like, paste 3 to 5 things you wrote yourself: messages to clients, emails, captions, or your bio. A mix of casual and professional is best. I'll use them to match your voice closely. Say 'skip' to finish without them."

If they paste samples, produce all three, then check the voice summary against their originals:
1. **Voice summary**: bullets, under 150 words: sentence length, vocabulary level, how they open and close messages, humor, punctuation habits, words they repeat, words they never use.
2. **Three proof samples in their voice**: a 2-sentence message to a past client, a 4-sentence intro of what they do, and a short social post about their industry.
3. **Three gaps**: places their samples are weaker than they could be (for example no clear ask, too much filler) and how the profile should correct them without losing their personality.

Before showing it, compare each proof sample to their originals. If a sample uses a word or rhythm they would never use, fix it. Cut clichés like "game-changer", "take it to the next level", and "don't hesitate to reach out". Never use anything on their avoid list. Show the result and ask: "Does this sound like you? Tell me what to change." Revise until they approve.

Save: the Edge fields to the Master Profile's Edge section, and everything else to the Voice Profile page using the template. Then continue the general procedure (confirm, save, say where it is saved).

---

# SELF-TEST SCENARIO

Used by the SELF-TEST section in `SKILL.md`. Fill the brackets from the member's profile.

- [OFFER] → `offer`, otherwise `niche` or `industry`
- [MARKET] → `primary_market`
- Tell the member which scenario details you filled in.

**Scenario:**
"A prospect I met this week in [MARKET] likes my approach to [OFFER], but says my price is higher than they planned to spend and asks me to guarantee a specific result. I'm competing with two other providers."

**Deliverables:**
1. **Value strategy:** how to frame the price gap without arguing (3 bullets).
2. **Handling the hesitation:** how to respond to the request for a guarantee (2 phrases I could use).
3. **Follow-up email** I can send tonight: under 150 words, in my voice, ending with my disclosure line (if I have one).
4. **One-line social post** about the value of [OFFER] that does not promise a result and follows my compliance guardrails.
