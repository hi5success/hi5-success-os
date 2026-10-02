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

## GROUP C — Your Business
Say first: "A few questions about your business. They're what I use to build your plan and write like someone who knows your market. Say 'skip' on any you'd rather answer later."

**Q16 — Price Range**
> "What's the typical price range of the homes you work with?"
Store: price_range

**Q17 — Market Right Now**
> "In your own words, what is your market doing right now? Prices, inventory, how fast homes are selling. Rough impressions are fine."
Store: market_conditions

**Q18 — Focus**
> "Do you mostly work with buyers, sellers, or both?"
>
> A) Mostly buyers
> B) Mostly sellers
> C) Both about equally

Store: focus

**Q19 — Niche**
> "Do you focus on a specific niche or client type?"
>
> A) Luxury / high end
> B) First time buyers
> C) Investors
> D) Relocation
> E) New construction
> F) General — I work with everyone
> G) Other — (ask what)

Store: niche

**Q20 — Lead Sources**
> "Rank your lead sources by how much business each one produces, biggest first. Pick from this list or add your own:
>
> Sphere of influence / referrals · Social media (organic) · YouTube · Paid ads · Open houses · Cold outreach / door knocking · Online leads (Zillow, Realtor.com, etc.) · Other"

Store: lead_sources_ranked (an ordered list, biggest first)

**Q21 — 12-Month Goal**
> "What is your goal for the next 12 months? Deals, GCI, or a lifestyle goal. Say it in your own words. In /hi5-bizplan we'll turn it into exact numbers."
Store: goal_12_month

→ **Checkpoint C:** write the answers above to Business (and `niche` to Market).

## GROUP D — Your Brand (optional)
Say first: "Last group, and it's optional. Say 'skip' on any of these and we'll come back to it later."

**Q22 — Branding**
> "Where does your branding stand right now?"
>
> A) Fully branded — logo, colors, fonts, everything consistent
> B) Logo only — but inconsistent across platforms
> C) Needs a refresh — I have something but it feels outdated
> D) Starting from scratch — I need everything

Store: brand_status

**Q23 — Brand Color**
> "What is your primary brand color? If you know your hex code drop it here, otherwise just describe the color family and we will work with it."
Store: brand_color

**Q24 — Brand Font**
> "Do you have a primary font you use in your marketing? If you are not sure just say so."
Store: brand_font

**Q25 — Branding Help**
> "One last thing on branding — if you ever want professional help with your brand identity (logo, colors, fonts, full brand guide), our team at Hi5 Biz Solutions works specifically with real estate agents on this. Head over to the Hi5 Success community and drop a message in the services channel and we will get you the details on packages and pricing."
>
> "Would you like me to make a note of this in your profile so we follow up with you?"
>
> A) Yes please
> B) No thanks — I have got it covered

Store: branding_interest

→ **Checkpoint D:** write the answers above to Brand. Stage 1 is complete.

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

---

# STAGE 3 — Voice and Edge (about 8 minutes)

Template: `templates/voice-profile.md`. Creates the **Voice Profile** page and an **Edge** section on the Master Profile. Follow the general procedure in `SKILL.md`.

Intro: "This is what makes my writing sound like you instead of a generic agent: who you serve best, what sets you apart, and how you actually talk. A few questions, then I'll write you a short voice profile you can approve."

## Part 1 — Your Edge

**E1 — Client situations**
> "What are the 2 or 3 client situations you handle best? Describe the situation, not the person. For example 'sellers who need to sell before they can buy' or 'buyers relocating on a deadline'."
Store: client_situations
(Fair Housing: if the member describes people by a protected class, such as family status, age, or religion, gently steer them: "Let's describe the situation instead, like the timeline, the goal, or the challenge." Rewrite it with them.)

**E2 — Your differentiator**
> "What do you do that other agents in your market don't? Give me one proof point too: a stat, a result, or a step in your process."
Store: differentiator and proof_point. If they give no proof, ask once: "Do you have a number, result, or story that backs that up?" If still none, store the differentiator and write `proof_point: [ADD PROOF]`.

**E3 — Client words**
> "What three words would your best clients use to describe working with you?"
Store: client_words

## Part 2 — Your Voice

**V1 — Words to avoid**
> "Are there words, phrases, or habits you never want in your writing? For example words you'd never say, or things that sound fake to you."
Store: phrases_never_used

**V2 — Formality**
> "How formal is your writing?
>
> A) Casual and conversational
> B) Professional and polished
> C) Somewhere in between"

Store: vocabulary_style

**V3 — Sentences**
> "How would you describe your sentences?
>
> A) Short and punchy
> B) Long and flowing
> C) A mix"

Store: sentence_rhythm

**V4 — Emoji**
> "How do you feel about emoji in your writing?
>
> A) Never
> B) Sometimes
> C) Often"

Store: emoji_use

**V5 — Length**
> "What length do you usually prefer for messages, captions, and emails?
>
> A) Short — get to the point
> B) Medium
> C) Long and detailed"

Store: preferred_length

**V6 — Phrases you use** *(skippable)*
> "Any phrases you say all the time, in conversations, on calls, or in your content? Just a few that come to mind."
Store: phrases_used

**V7 — How you want to come across** *(skippable)*
> "In a few words, how do you want to come across? For example calm expert, friendly neighbor, or straight shooter."
Store: how_to_come_across

## Part 3 — Writing samples (optional)
> "If you'd like, paste 3 to 5 things you wrote yourself: texts to clients, emails, captions, or your bio. A mix of casual and professional is best. I'll use them to match your voice closely. Say 'skip' to finish without them."

If they paste samples, produce all three, then check the voice summary against their originals:
1. **Voice summary** — bullets, under 150 words: sentence length, vocabulary level, how they open and close messages, humor, punctuation habits, words they repeat, words they never use.
2. **Three proof samples in their voice** — a 2-sentence text to a past client, a 4-sentence intro of their services, and a short social caption about the market.
3. **Three gaps** — places their samples are weaker than they could be (for example no clear ask, too much filler) and how the profile should correct them without losing their personality.

Before showing it, compare each proof sample to their originals. If a sample uses a word or rhythm they would never use, fix it. Cut clichés like "dream home", "nestled", and "don't hesitate to reach out". Never use anything on their avoid list. Show the result and ask: "Does this sound like you? Tell me what to change." Revise until they approve.

Save: the Edge fields to the Master Profile's Edge section, and everything else to the Voice Profile page using the template. Then continue the general procedure (confirm, save, say where it is saved).

---

# STAGE 4 — Objection Bank (about 10 minutes)

Template: `templates/objection-bank.md`. Creates the **Objection Bank** page. Follow the general procedure in `SKILL.md`.

Before starting, open the Voice Profile page and the Edge section if they exist. You will write in the member's voice and use their proof point. If Stage 3 is not done, say: "This works best after Stage 3 (voice and edge), because I'll write the answers in your voice. Want to do that first, or go ahead now with a general voice?" Follow their choice.

Intro: "Sellers push back in predictable ways. I've already written answers to the five most common objections, and I'll rewrite them in your voice with your real proof points. You'll end up with a bank you can reuse on calls, in texts, and in follow-up. Two quick questions first."

Show the five objections so they know what is covered:
1. "We'll wait for the market to get better."
2. "We're going to try selling it ourselves."
3. "Another agent will do it for less."
4. "We want to list higher than your number."
5. "We're just looking / not ready yet."

**O1 — Extra objections**
> "Which other objections do you hear a lot? Add as many as you like, or say 'none'."
Store: extra_objections

**O2 — Proof points**
> "What proof points can I use in your answers? Results, stats, steps in your process, or client testimonials. Paste whatever you have. I won't make anything up. Where I don't have proof for an answer, I'll mark it [ADD PROOF] so you can fill it in later."
Pre-fill from `proof_point` on the Edge section if one exists, and ask "Anything else to add?"
Store: proof_points

Then build the page from the template: rewrite all five drafts and any extra objections in the member's voice, put one specific proof point in each response (or `[ADD PROOF]`), and run the template's final check. Show the member the finished bank (the full text of each response) and ask for changes. Save per the general procedure.

When saved, tell the member: "Your Objection Bank is saved as a page under your Master Profile. You don't need to save it anywhere else, because the Hi5 skills read it from Notion. To add an objection or fill in an [ADD PROOF] spot later, run /hi5-setup and choose Redo a stage."

---

# STAGE 5 — Neighborhoods (about 10 minutes per area)

Template: `templates/neighborhood-profile.md`. Creates one **Neighborhood – [Name]** page per area. Follow the general procedure in `SKILL.md`. This stage is repeatable: run it once for each area. From the re-run menu, "Add a neighborhood" runs this stage for one new area.

Check the `neighborhoods` list in Page IDs. If the area already has a page, ask "Replace it or add to it?"

Intro: "A neighborhood fact file gives me real local detail to draw on in your listings, posts, and emails. It covers the place, the homes, and the amenities, and never who lives there. Twelve short questions, four groups. Which neighborhood or area would you like to start with?"
Store: area_name

Ask the questions one at a time. Skip anything about who lives there. If the member describes residents, school quality, or safety, say kindly: "I'll leave that part out, since it can read as steering under Fair Housing. Let's stick to the place, the homes, and the amenities." and move on.

## Group 1 — Market facts you can verify

**N1 — Homes and prices**
> "What's the typical price range in [area], and what are the most common home styles and lot sizes?"

**N2 — Pace**
> "How fast are homes selling there lately, and how does inventory feel? Share any numbers you can verify. I'll mark them to double-check, with a date."

**N3 — HOA and community details**
> "Is there an HOA or community association? What are the fees, what do they cover, and what rules come up often?"

## Group 2 — Lifestyle and amenities

**N4 — Close by**
> "What parks, trails, dining, and shopping nearby do you point people to?"

**N5 — Getting around**
> "How do people get around? Main routes, access to highways or transit, and typical drive times to downtown or major employers."

**N6 — Events and seasons**
> "What events or seasonal happenings are part of life in [area]?"

## Group 3 — Insider knowledge

**N7 — Best streets for a feature**
> "Which streets or sections are best for specific features, like flat lots, mature trees, bigger yards, or walkable access?"

**N8 — What surprises newcomers**
> "What tends to surprise people who are new to [area]?"

**N9 — Seasonal quirks**
> "Are there seasonal quirks you've personally seen, like traffic patterns, drainage after heavy rain, or busy times of year? I'll tell readers to verify anything like that with the official source."

## Group 4 — Buyer and seller considerations

**N10 — What sells fast**
> "What types of homes sell fastest in [area], and what do those homes usually have in common?"

**N11 — Inspection and maintenance**
> "What inspection issues or maintenance items come up often with homes there?"

**N12 — Questions and prep**
> "What should buyers ask about before buying in [area], and what should sellers know before listing?"

Then build the page from the template, mark every stat [VERIFY + DATE], and run the template's rules, including removing any line that describes residents, school quality, or safety as fact. Show the member the Snapshot and Content Angles and ask whether it looks right. Save per the general procedure, and add the area to the `neighborhoods` list.

Update Setup Status: `stage_5_neighborhoods: complete <date> (N areas)`.

When saved, tell the member: "Your [area] fact file is saved as a page under your Master Profile. To add another area later, run /hi5-setup and choose Add a neighborhood. To refresh the numbers, choose Redo a stage."

Ask: "Want to add another area now, or stop here?"
