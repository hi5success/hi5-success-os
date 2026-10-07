# Hi5 Setup: Real Estate Industry Flow

## Purpose
Capture the identity and tools profile for a real estate agent, team, or broker. This data fills the Master Profile and is read by every other Hi5 skill. Field names in `Store:` lines are the names in `templates/master-profile.md`.

## Rules
- One question at a time
- Multiple choice where provided. They can always add more detail
- Hold confirmed answers and write them to the Master Profile at each checkpoint (end of each group)
- Skipped questions are fine. Skills tolerate missing fields

---

# STAGE 1: Core Profile (about 10 minutes)

## GROUP A: You and Your Market

**Q1: Name**
> "What is your full name?"
Store: name

**Q2: Brand Name**
> "What is your business or brand name? If you operate under your personal name just say that."
Store: business_name

**Q3: Brokerage**
> "What brokerage are you with?"
Store: brokerage

**Q4: Role**
> "How do you operate your real estate business?"
>
> A) Solo agent: I run everything independently
> B) Spouse/Partner team: we work together as a unit
> C) On a team: I am part of someone else's team
> D) Team Leader: I run my own team
> E) Broker/Owner: I own the brokerage

Store: role

Branch follow-ups (store the answers together as one line in `team_details`):
- Spouse/Partner → "Do you both create content together or separately?" + "Is your brand joint or individual?"
- On a team → "Does your team have a brand you operate under or do you build your personal brand alongside it?"
- Team Leader → "How many agents are on your team?" + "Are you still personally producing or focused purely on leading?"
- Broker/Owner → "How many agents are in your office?" + "Are you still actively selling or focused on recruiting and leadership?"

**Q5: Experience**
> "How many years have you been a licensed real estate agent?"
Store: years_in_business

**Q6: Market**
> "What city or market do you primarily serve?"
Store: primary_market

**Q7: Surrounding Areas**
> "Do you serve any surrounding areas, counties, or neighborhoods worth mentioning?"
Store: surrounding_areas

**Q8: Multi-State**
> "Are you licensed in multiple states or provinces?"
>
> A) No: just one state
> B) Yes: (ask which states)

Store: states_licensed

**Q9: Languages**
> "Do you speak any languages other than English?"
>
> A) No: English only
> B) Yes: (ask which languages)

Store: languages

→ **Checkpoint A:** write the answers above to Identity and Market.

## GROUP B: Your Tools and Online Presence

**Q10: Website**
> "Do you have a website?"
>
> A) Yes: drop the URL
> B) No: not yet

Store: website

**Q11: CRM**
> "What CRM are you using to manage your contacts and leads?"
>
> A) GoHighLevel
> B) Follow Up Boss
> C) KVCore
> D) CINC
> E) Spreadsheet or manual tracking
> F) No CRM yet

Store: crm

**Q12: CRM Usage**
> "How are you currently using your CRM?"
>
> A) Barely scratching the surface
> B) Basic contact management
> C) Using automations and pipelines
> D) Using it to its full potential

Store: crm_usage

**Q13: Calendar Software**
> "Do you use any calendar or scheduling software?"
>
> A) Calendly
> B) GHL Calendar
> C) Google Calendar
> D) Other: (ask which)
> E) No: I manage manually

Store: calendar_software

**Q14: Social Platforms**
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

**Q15: YouTube**
> "Do you have a YouTube channel?"
>
> A) Yes: drop the URL
> B) No, but I am interested in starting one
> C) No and not planning to

Store: youtube_url

→ **Checkpoint B:** write the answers above to Tools and Presence.

## GROUP C: Your Business
Say first: "A few questions about your business. They're what I use to build your plan and write like someone who knows your market. Say 'skip' on any you'd rather answer later."

**Q16: Price Range**
> "What's the typical price range of the homes you work with?"
Store: price_range

**Q17: Market Right Now**
> "In your own words, what is your market doing right now? Prices, inventory, how fast homes are selling. Rough impressions are fine."
Store: market_conditions

**Q18: Focus**
> "Do you mostly work with buyers, sellers, or both?"
>
> A) Mostly buyers
> B) Mostly sellers
> C) Both about equally

Store: focus

**Q19: Client types**
> "Which kinds of clients do you work with? Pick all that apply:
>
> Buyers · Sellers · Renters or tenants · Landlords · Investors · 55+ communities · Luxury · First-time buyers · New construction · Relocation · Commercial sales · Commercial leases · Land · Other (tell me)"

Store: client_categories (a list). Update ID: S1-CATEGORIES. Every skill reads this list to adapt to the member's clients, so make sure it is complete.

**Q20: Main specialty**
> "Of those, is there one you'd call your specialty? Or do you work with everyone about equally?"

Offer the client types they picked plus "General: I work with everyone". Skip this question if they picked only one client type.
Store: niche (the specialty in their words, or "general")

**Q21: Lead Sources**
> "Rank your lead sources by how much business each one produces, biggest first. Pick from this list or add your own:
>
> Sphere of influence / referrals · Social media (organic) · YouTube · Paid ads · Open houses · Cold outreach / door knocking · Online leads (Zillow, Realtor.com, etc.) · Other"

Store: lead_sources_ranked (an ordered list, biggest first)

**Q22: 12-Month Goal**
> "What is your goal for the next 12 months? Deals, GCI, or a lifestyle goal. Say it in your own words. In /hi5-bizplan we'll turn it into exact numbers."
Store: goal_12_month

→ **Checkpoint C:** write the answers above to Business (`client_categories`) and Market (`niche`).

## GROUP D: Your Brand (optional)
Say first: "Last group, and it's optional. Say 'skip' on any of these and we'll come back to it later."

**Q23: Branding**
> "Where does your branding stand right now?"
>
> A) Fully branded: logo, colors, fonts, everything consistent
> B) Logo only: but inconsistent across platforms
> C) Needs a refresh: I have something but it feels outdated
> D) Starting from scratch: I need everything

Store: brand_status

**Q24: Brand Color**
> "What is your primary brand color? If you know your hex code drop it here, otherwise just describe the color family and we will work with it."
Store: brand_color

**Q25: Brand Font**
> "Do you have a primary font you use in your marketing? If you are not sure just say so."
Store: brand_font

**Q26: Branding Help**
> "One last thing on branding, if you ever want professional help with your brand identity (logo, colors, fonts, full brand guide), our team at Hi5 Biz Solutions works specifically with real estate agents on this. Head over to the Hi5 Success community and drop a message in the services channel and we will get you the details on packages and pricing."
>
> "Would you like me to make a note of this in your profile so we follow up with you?"
>
> A) Yes please
> B) No thanks: I have got it covered

Store: branding_interest

→ **Checkpoint D:** write the answers above to Brand. Stage 1 is complete.

---

# STAGE 2: Compliance (about 5 minutes)

Template: `templates/compliance-real-estate.md`. Creates the **Compliance Guardrails** page. Follow the general procedure in `SKILL.md`.

Intro: "This sets up the rules every draft follows: Fair Housing, advertising rules, and your required disclosure line. That way I never have to guess, and everything I write for you is ready to use. A few questions about your brokerage and state."

**C1: Brokerage name as licensed**
> "In your profile your brokerage is [brokerage]. Is that exactly how it appears on your license and in your advertising? If not, tell me the exact wording."
Store: part of disclosure_line (if `brokerage` is empty, ask "What is your brokerage name exactly as it is licensed?")

**C2: License number**
> "What is your real estate license number? If your state also requires a broker or team license number in ads, include that too."
Store: part of disclosure_line

**C3: Equal Housing wording**
> "How do you show Equal Housing Opportunity in your marketing? Most agents use the words 'Equal Housing Opportunity', often with the logo. Tell me your wording or say 'standard'."
Store: part of disclosure_line (standard = "Equal Housing Opportunity")

**C4: State-required text**
> "Does your state or brokerage require any other wording in advertising? For example the REALTOR® mark, a team name next to your brokerage, or a statement about where you are licensed. Say 'none' if you're not sure. We can add it later."
Store: part of disclosure_line

Compose `disclosure_line` as one line, for example: `[Name], [Brokerage], License #[number]. [Equal Housing wording]. [Any other required text]`. Show it to the member and ask whether it is exactly what they want at the end of every public piece.

**C5: Protected classes in your area**
> "Fair Housing protects certain groups everywhere in the US, and some states and cities protect more. I have your market as [primary_market] and your licensing as [states_licensed, or 'one state']. Which state or states and which city should I treat as covered? I'll make sure drafts avoid every class protected there. Please confirm the full list with your broker or attorney. I won't claim to know your local law."
Store: protected_class_jurisdictions (derive a suggestion from `primary_market` and `states_licensed`, then confirm)

**C6: Brokerage advertising rules**
> "Does your brokerage have advertising rules I should follow? Things like how to use a team name, whether ads need broker approval before they go live, or anything else. Say 'none' if not."
Store: brokerage_ad_rules

**C7: Texting consent**
> "Do you have documented consent, like a signed form or an opt-in, to text the people in your database?
>
> A) Yes
> B) No
> C) Not sure"

Store: sms_consent_status (yes, no, or unsure). If no or unsure, tell the member: "No problem. I'll keep text campaigns off the table until that's sorted, and I can show you how to collect consent."

Then build the page, show the five-bullet summary from the template, and ask: "Do you want me to follow these guardrails on everything I draft for you?" Save per the general procedure.

---

# STAGE 3: Voice and Edge (about 8 minutes)

Template: `templates/voice-profile.md`. Creates the **Voice Profile** page and an **Edge** section on the Master Profile. Follow the general procedure in `SKILL.md`.

Intro: "This is what makes my writing sound like you instead of a generic agent: who you serve best, what sets you apart, and how you actually talk. A few questions, then I'll write you a short voice profile you can approve."

## Part 1: Your Edge

**E1: Client situations**
> "What are the 2 or 3 client situations you handle best? Describe the situation, not the person. For example 'sellers who need to sell before they can buy' or 'buyers relocating on a deadline'."
Store: client_situations
(Fair Housing: if the member describes people by a protected class, such as family status, age, or religion, gently steer them: "Let's describe the situation instead, like the timeline, the goal, or the challenge." Rewrite it with them.)

**E2: Your differentiator**
> "What do you do that other agents in your market don't? Give me one proof point too: a stat, a result, or a step in your process."
Store: differentiator and proof_point. If they give no proof, ask once: "Do you have a number, result, or story that backs that up?" If still none, store the differentiator and write `proof_point: [ADD PROOF]`.

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
> "In a few words, how do you want to come across? For example calm expert, friendly neighbor, or straight shooter."
Store: how_to_come_across

**V8: Em dashes**
> "One more style question. Do you want me to avoid em dashes (the long dash some writers use to join two thoughts) in everything I write for you? Many readers find they make writing sound like it was written by AI.
>
> A) Yes, avoid them (recommended)
> B) No, they're fine"

Store: avoid_em_dashes (yes for A or if skipped, no for B). Update ID: S3-EMDASH

## Part 3: Writing samples (optional)
> "If you'd like, paste 3 to 5 things you wrote yourself: texts to clients, emails, captions, or your bio. A mix of casual and professional is best. I'll use them to match your voice closely. Say 'skip' to finish without them."

If they paste samples, produce all three, then check the voice summary against their originals:
1. **Voice summary**: bullets, under 150 words: sentence length, vocabulary level, how they open and close messages, humor, punctuation habits, words they repeat, words they never use.
2. **Three proof samples in their voice**: a 2-sentence text to a past client, a 4-sentence intro of their services, and a short social caption about the market.
3. **Three gaps**: places their samples are weaker than they could be (for example no clear ask, too much filler) and how the profile should correct them without losing their personality.

Before showing it, compare each proof sample to their originals. If a sample uses a word or rhythm they would never use, fix it. Cut clichés like "dream home", "nestled", and "don't hesitate to reach out". Never use anything on their avoid list. Show the result and ask: "Does this sound like you? Tell me what to change." Revise until they approve.

Save: the Edge fields to the Master Profile's Edge section, and everything else to the Voice Profile page using the template. Then continue the general procedure (confirm, save, say where it is saved).

---

# STAGE 4: Objection Bank (about 10 minutes per client type)

Templates: `templates/objection-bank.md` (page layout and rules) and `templates/objections/<client type>.md` (Hi5 starter objections for each client type). Creates the **Objection Bank** page, grouped by client type. Follow the general procedure in `SKILL.md`, with the loop below.

Before starting, open the Voice Profile page and the Edge section if they exist. You will write in the member's voice and use their proof points. If Stage 3 is not done, say: "This works best after Stage 3 (voice and edge), because I'll write the answers in your voice. Want to do that first, or go ahead now with a general voice?" Follow their choice.

Intro: "Clients push back in predictable ways, and the right answer depends on who you're talking to. I've written starter answers for the most common objections from each type of client. I'll rewrite them in your voice with your real proof points, one client type at a time. You'll end up with a bank you can reuse on calls, in texts, and in follow-up."

## Step 1: Confirm the client types
Read `client_categories` from the Business section. Say: "You told me you work with [list]. Is that still right? Add or remove any."
If `client_categories` is missing (an older profile), ask the Q19 question from Stage 1 once and save the answer. Then ask which type they want to start with, and recommend the one that is most of their business.

## Step 2: Proof points (ask once, for all client types)
> "What proof points can I use in your answers? Results, stats, steps in your process, or client testimonials. Paste whatever you have. I won't make anything up. Where I don't have proof for an answer, I'll mark it [ADD PROOF] so you can fill it in later."

Pre-fill from `proof_point` on the Edge section if there is one, and ask "Anything else to add?" Then, for each proof point, ask: "Is it OK to use that publicly in your marketing, or is it just for your own conversations?" Store each as `text (public)` or `text (internal)`. Update ID: S4-PROOF-FLAGS.
Store: proof_points. Responses in the Objection Bank are for conversations, so internal proof points can be used there, but mark them (internal).

## Step 3: Build one client type at a time
For each client type the member chose:
1. **Starters.** Read `templates/objections/<slug>.md` for that type (the slug is the lowercase type with hyphens, for example `first-time-buyers`, `55-plus-communities`, `commercial-leases`). Follow any note at the top of the file. List the starter objections by name so the member sees what is covered. If the type has no file (they typed "other"), skip to question 2 and build every objection from what they tell you.
2. **Their pushback.** Ask: "What pushback do you hear most from [client type]? Add as many as you like, or say 'none'."
3. **Build.** Following the template, write this type's section: every starter and every extra objection with all five parts, in the member's voice, with one specific proof point each (or [ADD PROOF]). Run the template's final check.
4. **Show and revise.** Show the full text of each response and ask for changes.
5. **Save.** Create the Objection Bank page the first time (see the template). Add or update a heading for this client type. Save `objection_bank_page_id` in Page IDs. Update Setup Status: `stage_4_objection_bank: in progress: [types done]`, or `complete <date>` when every chosen type is done.
6. **Next.** Ask: "Want to do [next client type] now, or stop here?" Never push. A member can finish the rest later from the re-run menu.

When the last type is saved, or the member stops, tell them: "Your Objection Bank is saved as a page under your Master Profile, grouped by client type. You don't need to save it anywhere else, because the Hi5 skills read it from Notion. To add a client type, add an objection, or fill in an [ADD PROOF] spot later, run /hi5-setup and choose Redo a stage."

---

# STAGE 5: Neighborhoods (about 10 minutes per area)

Template: `templates/neighborhood-profile.md`. Creates one **Neighborhood – [Name]** page per area. Follow the general procedure in `SKILL.md`. This stage is repeatable: run it once for each area. From the re-run menu, "Add a neighborhood" runs this stage for one new area.

Check the `neighborhoods` list in Page IDs. If the area already has a page, ask "Replace it or add to it?"

Intro: "A neighborhood fact file gives me real local detail to draw on in your listings, posts, and emails. It covers the place, the homes, and the amenities, and never who lives there. Twelve short questions, four groups. Which neighborhood or area would you like to start with?"
Store: area_name

Ask the questions one at a time. Skip anything about who lives there. If the member describes residents, school quality, or safety, say kindly: "I'll leave that part out, since it can read as steering under Fair Housing. Let's stick to the place, the homes, and the amenities." and move on.

## Group 1: Market facts you can verify

**N1: Homes and prices**
> "What's the typical price range in [area], and what are the most common home styles and lot sizes?"

**N2: Pace**
> "How fast are homes selling there lately, and how does inventory feel? Share any numbers you can verify. I'll mark them to double-check, with a date."

**N3: HOA and community details**
> "Is there an HOA or community association? What are the fees, what do they cover, and what rules come up often?"

## Group 2: Lifestyle and amenities

**N4: Close by**
> "What parks, trails, dining, and shopping nearby do you point people to?"

**N5: Getting around**
> "How do people get around? Main routes, access to highways or transit, and typical drive times to downtown or major employers."

**N6: Events and seasons**
> "What events or seasonal happenings are part of life in [area]?"

## Group 3: Insider knowledge

**N7: Best streets for a feature**
> "Which streets or sections are best for specific features, like flat lots, mature trees, bigger yards, or walkable access?"

**N8: What surprises newcomers**
> "What tends to surprise people who are new to [area]?"

**N9: Seasonal quirks**
> "Are there seasonal quirks you've personally seen, like traffic patterns, drainage after heavy rain, or busy times of year? I'll tell readers to verify anything like that with the official source."

## Group 4: Considerations for your clients

**N10: What sells fast**
> "What types of homes or properties move fastest in [area], and what do they usually have in common?"

**N11: Inspection and maintenance**
> "What inspection issues or maintenance items come up often with homes there?"

**N12: Questions and prep**
> "What should your clients know or ask before they buy, sell, rent, lease, or invest in [area]? Answer for the types of clients you work with."

Then build the page from the template, mark every stat [VERIFY + DATE], and run the template's rules, including removing any line that describes residents, school quality, or safety as fact. Show the member the Snapshot and Content Angles and ask whether it looks right. Save per the general procedure, and add the area to the `neighborhoods` list.

Update Setup Status: `stage_5_neighborhoods: complete <date> (N areas)`.

When saved, tell the member: "Your [area] fact file is saved as a page under your Master Profile. To add another area later, run /hi5-setup and choose Add a neighborhood. To refresh the numbers, choose Redo a stage."

Ask: "Want to add another area now, or stop here?"

---

# SELF-TEST SCENARIO

Used by the SELF-TEST section in `SKILL.md`. Pick the scenario that matches the member's main client type, so the test checks what they actually do. Use `niche` if it names a client type, otherwise the first item in `client_categories`, otherwise `focus`. If you cannot tell, use the buyer scenario and say you did.

| Main client type | Scenario |
|---|---|
| Sellers, luxury | Seller pricing gap |
| Buyers, first-time buyers, new construction, relocation, 55+ communities | Buyer waiting on rates |
| Investors | Investor numbers |
| Landlords | Landlord rent expectations |
| Renters or tenants | Tenant budget |
| Commercial sales, commercial leases, land | Commercial space |

Fill the brackets from the profile:
- [AREA] → the first area in `neighborhoods`, otherwise `primary_market`
- [PRICE] → a realistic example price that fits `price_range`. If `price_range` is missing, ask once: "What's a typical price in [primary_market]?"
- [HIGHER PRICE] → roughly 8 to 10 percent above [PRICE]
- [RENT] and [LOWER RENT] → realistic monthly rents for the market, about 15 percent apart
- Tell the member which scenario and which example numbers you chose.

For every scenario, deliverables 3 and 4 are the same: a follow-up email I can send tonight (under 150 words, in my voice, ending with my disclosure line, and including any required notices), and one Fair Housing compliant one-line social caption on the topic. Deliverables 1 and 2 are below.

## Seller pricing gap
"I just left a listing appointment in [AREA]. The data supports about [PRICE], but the sellers want [HIGHER PRICE]. They've owned the home a long time and are attached to it. I'm competing with two other agents."
1. **Pricing strategy:** how to frame the gap without arguing (3 bullets).
2. **Emotional attachment:** how to handle the conversation (2 phrases I could use).

## Buyer waiting on rates
"I just met with buyers who love a home in [AREA] listed around [PRICE]. They say they want to wait for rates to drop before making an offer, and they're unsure about signing a buyer agreement. I'm competing with two other agents."
1. **Framing the wait:** how to talk about timing without predicting rates (3 bullets).
2. **The buyer agreement:** how to handle the hesitation (2 phrases I could use).

## Investor numbers
"An investor I met is looking at a property in [AREA] listed around [PRICE]. They say the numbers don't work at that price, and that they can find deals on their own. I'm competing with two other agents."
1. **Working the numbers:** how to walk through the deal without promising returns (3 bullets).
2. **"I can find deals myself":** how to respond (2 phrases I could use).

## Landlord rent expectations
"A landlord I met owns a property in [AREA] and wants to charge about [RENT], but comparable places rent for about [LOWER RENT]. They also say they'd rather manage it themselves. I'm competing with two other agents."
1. **Pricing the rent:** how to frame the gap using the market, without guaranteeing anything (3 bullets).
2. **"I'll manage it myself":** how to respond (2 phrases I could use).

## Tenant budget
"A prospective tenant in [AREA] has a tight budget and worries about the deposit, the fees, and their credit. They say they might just search on their own. I'm competing with two other agents."
1. **Budget and costs:** how to lay out the full move-in cost and set honest expectations (3 bullets).
2. **"I'll look on my own":** how to respond (2 phrases I could use).

## Commercial space
"A business owner I met in [AREA] is looking at a space with a quoted price or rent of around [PRICE or RENT]. They say the cost is too high, they'd rather deal directly with the owner or the other broker, and they're unsure how long a commitment to make."
1. **Total cost and terms:** how to compare options on the same basis and negotiate, without guessing at legal terms (3 bullets).
2. **"I'll deal directly":** how to respond (2 phrases I could use).
