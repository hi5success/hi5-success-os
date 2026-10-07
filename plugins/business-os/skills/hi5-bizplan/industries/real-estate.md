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

Collect the member's full compensation structure ONCE and save every answer. They can answer "none" or "not sure" to any line, and you save that answer. **Never fill in a brokerage's fees from memory, even if the member names the brokerage. Use only what they give you.** If Business Numbers already has these fields, show what is saved and ask "Still right?" instead of asking again. Ask one question at a time.

**C1: Split and cap**
> "Tell me your split and your cap, if you have one. For example: 'I keep 80 percent until I have paid $20,000 to the company.'"
Store: brokerage_split, cap_amount

**C2: Cap year** *(only if they have a cap)*
> "When does your cap year start? And how much of your cap have you used so far this year?"
Store: cap_year_reset (the cap year start date), cap_progress (how much of the cap is used so far)

**C3: Fees per deal**
> "Does your brokerage charge any fees on each deal, like a transaction fee, an admin fee, a compliance fee, or a risk or E&O fee? List each one with its amount. For each one, tell me whether it continues after you reach your cap, and whether it counts toward your cap. You can say 'none' or 'not sure'."
Store: per_deal_fees (one line per fee: name, amount, continues after cap yes or no or not sure, counts toward cap yes or no or not sure)

**C4: After the cap**
> "After you reach your cap, do you pay a different split or any other fee? Say 'none' if you keep everything apart from the per deal fees above."
Store: post_cap_terms

**C5: Franchise or royalty fee**
> "Does your brokerage charge a franchise or royalty fee? If so, what percentage, what is it a percentage of, does it have its own annual cap, how much have you paid so far this year, and does it count toward your brokerage cap?"
Store: royalty_percent, royalty_annual_cap, royalty_ytd (and keep their answer about whether it counts toward the cap in the same line)

**C6: Recurring fees**
> "Do you pay any monthly or annual fees to the brokerage, like a brokerage fee, a technology fee, or E&O insurance? Tell me each one with its amount and how often."
Store: recurring_fees (one line per fee: name, amount, monthly or annual)

**C7: Team split** *(only if they are on a team)*
> "Do you pay a team split? What is it, and is it taken off the top, or from your share after the brokerage split?"
Store: team_split

**C8: Referral fees**
> "Do you regularly pay referral fees? What percentage, and about what share of your deals?"
Store: referral_fees

**C9: Costs outside the brokerage**
> "Are there costs you pay outside the brokerage that you want counted in your take-home, like MLS or association dues or lockboxes? Give me each amount and how often."
Store: outside_costs (one line per cost: name, amount, how often)

**C10: Your commission per deal**
> "What is your typical commission per deal, as a percent or a dollar amount? If it varies, give me an average."
If they do not know, calculate it from their own numbers: last year's GCI divided by last year's deals, and say you did that.

**C11: Team deals** *(only if role is a team leader, a spouse or partner team, or a broker or owner with a team)*
> "Do your team members' deals count toward your own goal and production?"
Store: team_deals_count_to_leader (yes or no)

Also save a one line summary of the structure in `brokerage_fees`, the older field name, which stays for older skills.

### Walk through one deal and confirm
Take one typical deal at their average GCI. Show it as a short table in the order you think applies: the GCI, then each item (referral fee, team split, brokerage split or company dollars, royalty, per deal fees), what each one is taken from, and the amount, once before the cap and once after the cap. Then ask: "Is that the right order and the right amounts?" Fix it until they confirm. Save the confirmed order in plain words as `fee_order_note`.
- A line they answered "none" is zero.
- A line they answered "not sure" is NOT counted. Say so in the table ("not counted, you weren't sure") and in the plan.
- Never guess at how a fee relates to the cap or to another fee. Ask.

---

## LEAD SOURCES

**Q8: Top source**
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

**Q9: Source to add or improve**
> "What lead source do you most want to add or improve this year?"
Store: desired_lead_source

---

## DIGITAL PRESENCE

**Q10: Google Business Profile**
> "Where are you at with your Google Business Profile?
>
> A) Fully optimized and actively getting reviews
> B) Set up but not actively managing it
> C) Barely started
> D) Do not have one yet"

Store: gbp_status

**Q11: Social posting frequency**
> "How often are you posting to social media overall right now?
>
> A) Rarely or never
> B) A few times a month
> C) 1-3 times per week
> D) Daily"

Store: social_frequency

**Q12: Paid ads**
> "Are you running any paid ads?
>
> A) No
> B) Facebook/Instagram ads
> C) Google ads
> D) Multiple channels"

Store: paid_ads

**Q13: Marketing goals**
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

**Q14: Plan period**
> "What period is your goal for: the next 12 months, the rest of this calendar year, or something else, like your cap year or an award year?"
Store: plan_period

**Q15: Your goal as a number**
If `goal_12_month` exists, say: "Your goal is [goal_12_month]. Let's turn it into numbers." Then ask:
> "Is your target a GCI number, a take-home number, or a number of deals?"
Store: goal_type

> "What is that number?"
Store: gci_goal (or take_home_goal, or transaction_goal, depending on the answer)

**Q16: Milestone or award** *(skippable)*
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
Show the chain step by step with their numbers: their goal, converted using their full compensation structure (split, cap, per deal fees, royalty, recurring fees, and anything else they gave) if the goal is take-home, with take-home per deal shown before and after the cap, then deals needed, then appointments or agreements needed, then conversations or leads needed, then per month and per week. If they gave a milestone or award, show the step by step math for it using only the requirements they gave, and label them "as you told me". If the plan period is the rest of a year, subtract what they have done year to date. Label every assumption and its source.

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
