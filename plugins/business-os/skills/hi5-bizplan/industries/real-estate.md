# Hi5 Bizplan: Real Estate Flow

Used by `SKILL.md`. Follow the core rules there: use only the commission model the member gives, show the math step by step, and skip questions that answer themselves. Field names in `Store:` lines are names in the Master Profile's Business Numbers section.

Open with:
> "Alright [name]. Let's build your business plan. I already know your market is [primary_market], you work as [role], your goal is [goal_12_month], and your vision is [success_vision]. Now I need your numbers so we can build something real. A few questions, and then I'll put it all together."

---

## LAST YEAR

**Q1: Deals closed**
> "Let's start with last year. How many transactions did you close?"
Store: deals_closed_last_year

**Q2: Volume**
> "What was your total sales volume?"
Store: total_volume_last_year

**Q3: GCI**
> "What was your GCI, your gross commission income?"
Store: gci_last_year

## THIS YEAR SO FAR

**Q4: Year to date**
> "How many deals have you closed so far this year?"
Store: deals_closed_ytd

**Q5: GCI so far this year** *(skippable)*
> "And roughly what GCI have those brought in so far?"
Store: gci_ytd

---

## CONVERSION FUNNEL

> "Now let's walk through your conversion funnel. This tells us exactly where to focus your energy. Ballpark numbers are fine.
>
> How many leads did you receive last year?"
Store: leads_received

> "Of those leads, how many signed a buyer, seller, tenant, or other client agreement?"
Store: agreements_signed

> "And how many of those actually closed?"
Store: closed_transactions
(Skip this question if the member's agreements number equals the deals they closed, or they closed one deal. Use the number they gave and say why.)

Calculate:
- Lead to agreement rate = agreements / leads x 100
- Agreement to close rate = closed / agreements x 100
- Diagnose: lead problem, conversion problem, or market problem

**Q6: Average sale price**
> "You told me you typically work in [price_range]. What is the average sale price?"
Store: avg_sale_price
(Skip this question if they closed one deal. Use that deal's price and say why.)

**Q7: Mix of business**
> "What is the mix of your business? For example 60% buyers and 40% sellers, or mostly investors with some rentals. I know you work with [client_categories]."
Store: buyer_seller_split (the mix in their words)

---

## HOW YOU GET PAID

Never assume any brokerage's rules. Ask in plain terms, then repeat their model back with an example and confirm it.

**Q8: Your split and fees**
> "How does your brokerage pay you? Tell me in your own words: your split, any cap, any fees per deal, and any monthly or annual fees."
Store: brokerage_split, cap_amount, brokerage_fees

**Q9: Cap year** *(only if they have a cap)*
> "When does your cap year reset?"
Store: cap_year_reset
Also ask: "How much of your cap have you hit so far this year?" and keep the answer for the math.

**Q10: Your commission per deal**
> "What is your typical commission per deal, as a percent or a dollar amount? If it varies, give me an average."
If they do not know, calculate it from their own numbers: last year's GCI divided by last year's deals, and say you did that.

**Q11: Team deals** *(only if role is a team leader, a spouse or partner team, or a broker or owner with a team)*
> "Do your team members' deals count toward your own goal and production?"
Store: team_deals_count_to_leader (yes or no)

Repeat the model back with a worked example using their numbers (for example "on a deal that brings in $X GCI, you keep $Y until you reach your cap of $Z, then $W") and ask "Is that right?" Fix it until they confirm. If any rule is unclear, ask a follow-up.

---

## LEAD SOURCES

**Q12: Top source**
If `lead_sources_ranked` exists, say: "Your biggest lead source is [first item in lead_sources_ranked]. Is that still true?" and store it. Only if the field is missing, ask:
> "What is your number one source of leads right now?
>
> A) Sphere of influence / referrals
> B) Social media (organic)
> C) YouTube
> D) Paid ads
> E) Open houses
> F) Cold outreach / door knocking
> G) Online leads (Zillow, Realtor.com, etc.)
> H) Other"

Store: top_lead_source

**Q13: Source to add or improve**
> "What lead source do you most want to add or improve this year?"
Store: desired_lead_source

---

## DIGITAL PRESENCE

**Q14: Google Business Profile**
> "Where are you at with your Google Business Profile?
>
> A) Fully optimized and actively getting reviews
> B) Set up but not actively managing it
> C) Barely started
> D) Do not have one yet"

Store: gbp_status

**Q15: Social posting frequency**
> "How often are you posting to social media overall right now?
>
> A) Rarely or never
> B) A few times a month
> C) 1-3 times per week
> D) Daily"

Store: social_frequency

**Q16: Paid ads**
> "Are you running any paid ads?
>
> A) No
> B) Facebook/Instagram ads
> C) Google ads
> D) Multiple channels"

Store: paid_ads

**Q17: Marketing goals**
> "What marketing would you most like to add or improve this year? Select all that apply:
>
> A) Grow YouTube
> B) Be more consistent on social
> C) Workshops, webinars, or events for my clients
> D) Build an email list
> E) Improve Google Business Profile
> F) Start paid ads
> G) Door knocking campaigns
> H) Build referral network"

Store: marketing_goals

---

## GOALS

**Q18: Plan period**
> "What period is your goal for: the next 12 months, the rest of this calendar year, or something else, like your cap year or an award year?"
Store: plan_period

**Q19: Your goal as a number**
If `goal_12_month` exists, say: "Your goal is [goal_12_month]. Let's turn it into numbers." Then ask:
> "Is your target a GCI number, a take-home number, or a number of deals?"
Store: goal_type

> "What is that number?"
Store: gci_goal (or take_home_goal, or transaction_goal, depending on the answer)

**Q20: Milestone or award** *(skippable)*
> "Is there a production award, level, or milestone you want to hit, at your brokerage or anywhere else? Tell me what it's called and exactly what it takes to reach it, in your own words."
Store: milestone_goal (the name and what it takes, as the member said it). Use only what they tell you. If the requirement is unclear, ask.

If you do not have a transaction goal yet, calculate it with the math rules: deals needed to reach the goal, and ask the member to confirm it.
Store: transaction_goal

---

## THE PLAN SECTIONS

Write these sections, in this order. Tailor them to the client types in `client_categories` and the commission model the member confirmed.

### 1. Agent Snapshot
Who they are, their market, role, experience, client types, and brand. Second person, specific to their data.

### 2. Where You Stand
Honest assessment of last year and this year so far. Conversion funnel analysis with the diagnosis: lead problem, conversion problem, or market problem. No fluff, just clarity.

### 3. Your Target and the Math
Show the chain step by step with their numbers: their goal, converted using their own split, cap, and fees if the goal is take-home, then deals needed, then appointments or agreements needed, then conversations or leads needed, then per month and per week. If they gave a milestone or award, show the step by step math for it using only the requirements they gave, and label them "as you told me". If the plan period is the rest of a year, subtract what they have done year to date. Label every assumption and its source.

### 4. Your Lead Engine
Based on top source and desired source: specific recommendations for generating leads consistently. Tailored to their platforms, budget, style, and client types.

### 5. Your Marketing Plan
Based on the marketing goals they selected: content strategy, platforms to prioritize, posting cadence, and quick wins. Tied to their YouTube status and social platforms, and to their Google Business Profile status.

### 6. Your Conversion System
Based on CRM and funnel data: specific recommendations for improving lead to agreement and agreement to close rates.

### 7. Your 90 Day Roadmap
Month 1, Month 2, Month 3, with specific actions, not generic advice. What to do first, what to build next, what to optimize last. If the funnel shows a conversion problem, put conversion first and hold paid ads for Month 3. Respect the blocker rule in `SKILL.md`.

### 8. Your Biggest Opportunity
One clear insight about the biggest untapped opportunity, based on all their data.

### 9. What Success Looks Like
Reference their success vision from /hi5-self. Connect the numbers to what they actually want.

Tone by behavioral style: High D is direct, punchy, and action-oriented. High I is vision-forward, energetic, and story-driven. High S is steady, reassuring, and relationship-focused. High C is data-heavy, detailed, and logical.
