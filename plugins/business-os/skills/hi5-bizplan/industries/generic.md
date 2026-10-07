# Hi5 Bizplan: Generic Flow (Any Industry)

Used by `SKILL.md`. Follow the core rules there: use only the pricing and cost model the member gives, show the math step by step, and skip questions that answer themselves. Use the member's own words for what they sell ("clients", "customers", "projects", "sales"). Field names in `Store:` lines are names in the Master Profile's Business Numbers section.

Open with:
> "Alright [name]. Let's build your business plan. I already know your market is [primary_market], you run [business_name], your goal is [goal_12_month], and your vision is [success_vision]. Now I need your numbers so we can build something real. A few questions, and then I'll put it all together."

---

## LAST YEAR

**Q1: Revenue**
> "Let's start with last year. What was your total revenue?"
Store: revenue_last_year

**Q2: Clients**
> "How many clients, customers, or projects did that come from?"
Store: deals_closed_last_year

**Q3: Average value**
> "What is your average revenue per client, customer, or project?"
Store: avg_deal_value
(Skip this question if they had one client. Use that client's revenue and say why. If they do not know, calculate it as last year's revenue divided by last year's clients, and say you did that.)

## THIS YEAR SO FAR

**Q4: Year to date**
> "How many clients or sales have you closed so far this year, and about how much revenue has that brought in?"
Store: deals_closed_ytd and revenue_ytd

---

## CONVERSION FUNNEL

> "Now let's walk through how people become clients. Ballpark numbers are fine.
>
> How many leads, inquiries, or prospects did you get last year?"
Store: leads_received

> "Of those, how many got to a call, a proposal, or a quote?"
Store: agreements_signed

> "And how many of those became paying clients?"
Store: closed_transactions
(Skip this question if the number of proposals equals the clients they closed, or they closed one client. Use the number they gave and say why.)

Calculate the rates and diagnose: lead problem, conversion problem, or market problem.

---

## YOUR MODEL

Never assume how a business is paid or what its costs are. Ask in plain terms and repeat it back.

Collect the member's fees and costs ONCE and save every answer. They can answer "none" or "not sure" to any line, and you save that answer. **Never fill in a platform's, processor's, or partner's fees from memory. Use only what they give you.** If Business Numbers already has these fields, show what is saved and ask "Still right?" instead of asking again.

**C1: Fees on each sale or payment**
> "What fees come out of each sale or payment before you get paid? For example a marketplace or platform fee, an app store fee, or a booking fee. List each one as a percent or an amount."
Store: per_sale_fees (one line per fee: name, percent or amount)

**C2: Payment processing**
> "What do you pay to process payments, as a percent or an amount per payment?"
Store: processing_fees

**C3: Partners, affiliates, and referrals**
> "Do you pay partners, affiliates, or referral sources? What percentage or amount, and about what share of your sales?"
Store: partner_fees

**C4: Recurring costs**
> "What recurring costs do you want counted: software, tools, insurance, memberships, or a team? Give each one with its amount and how often."
Store: recurring_costs (one line per cost: name, amount, monthly or annual)

**C5: Other costs**
> "Anything else you want counted before you see your take-home, like taxes you set aside or costs outside the business?"
Store: outside_costs

**Q5: Costs and take-home**
> "Putting it together, how much of your revenue do you typically keep after your main costs? A rough percent is fine."
Store: take_home_note

### Walk through one sale and confirm
Take one typical sale at their average value. Show it as a short table: the revenue, then each fee and cost, what each one is taken from, and the amount, down to take-home. Then ask: "Is that the right order and the right amounts?" Fix it until they confirm. Save the confirmed order in plain words as fee_order_note.
- A line they answered "none" is zero.
- A line they answered "not sure" is NOT counted. Say so in the table and in the plan.
- Compare the total to the percent they gave in Q5 and mention any big difference.

**Q6: Capacity**
> "How many clients or projects can you realistically take on at once, or in a month, before it becomes too much?"
Store: capacity_note

---

## LEAD SOURCES

**Q7: Top source**
If `lead_sources_ranked` exists, say: "Your biggest source of clients is [first item in lead_sources_ranked]. Is that still true?" and store it. Only if the field is missing, ask:
> "What is your number one source of clients right now?"
Store: top_lead_source

**Q8: Source to add or improve**
> "What source of clients do you most want to add or improve this year?"
Store: desired_lead_source

---

## DIGITAL PRESENCE

**Q9: Google Business Profile** *(ask only if `market_reach` is local or regional)*
> "Where are you at with your Google Business Profile?
>
> A) Fully optimized and actively getting reviews
> B) Set up but not actively managing it
> C) Barely started
> D) Do not have one yet"

Store: gbp_status

**Q10: Social posting frequency**
> "How often are you posting to social media overall right now?
>
> A) Rarely or never
> B) A few times a month
> C) 1-3 times per week
> D) Daily"

Store: social_frequency

**Q11: Paid ads**
> "Are you running any paid ads?
>
> A) No
> B) Facebook/Instagram ads
> C) Google ads
> D) Multiple channels"

Store: paid_ads

**Q12: Marketing goals**
> "What marketing would you most like to add or improve this year? Select all that apply:
>
> A) Grow YouTube
> B) Be more consistent on social
> C) Workshops, webinars, or events
> D) Build an email list
> E) Improve Google Business Profile
> F) Start paid ads
> G) Build a referral or partner network
> H) Improve my website"

Store: marketing_goals

---

## GOALS

**Q13: Plan period**
> "What period is your goal for: the next 12 months, the rest of this calendar year, or something else?"
Store: plan_period

**Q14: Your goal as a number**
If `goal_12_month` exists, say: "Your goal is [goal_12_month]. Let's turn it into numbers." Then ask:
> "Is your target a revenue number, a take-home number, or a number of clients?"
Store: goal_type

> "What is that number?"
Store: revenue_goal (or take_home_goal, or client_goal, depending on the answer)

**Q15: Milestone** *(skippable)*
> "Is there a milestone you want to hit, like a revenue level, an award, or a team size? Tell me exactly what it takes, in your own words."
Store: milestone_goal. Use only what they tell you. If it is unclear, ask.

If you do not have a client goal yet, calculate it with the math rules (revenue goal divided by average value per client, adjusted for take-home if needed) and ask the member to confirm it.
Store: client_goal

---

## THE PLAN SECTIONS

Write these sections, in this order.

### 1. Business Snapshot
Who they are, what they sell, their market, role, and brand. Second person, specific to their data.

### 2. Where You Stand
Honest assessment of last year and this year so far. Funnel analysis with the diagnosis: lead problem, conversion problem, or market problem. No fluff, just clarity.

### 3. Your Target and the Math
Show the chain step by step with their numbers: their goal, converted to revenue using their take-home note if the goal is take-home, then clients needed using their average value, then proposals or calls needed, then leads needed, then per month and per week. Check the result against their capacity and say plainly if the target does not fit, then offer options (raise prices, add help, change the target). Label every assumption and its source.

### 4. Your Lead Engine
Based on top source and desired source: specific recommendations for generating leads consistently. Tailored to their platforms, budget, and style.

### 5. Your Marketing Plan
Based on the marketing goals they selected: content strategy, platforms to prioritize, posting cadence, and quick wins.

### 6. Your Conversion System
Based on CRM and funnel data: specific recommendations for improving the move from lead to call to client.

### 7. Your 90 Day Roadmap
Month 1, Month 2, Month 3, with specific actions, not generic advice. If the funnel shows a conversion problem, put conversion first and hold paid ads for Month 3. Respect the blocker rule in `SKILL.md`.

### 8. Your Biggest Opportunity
One clear insight about the biggest untapped opportunity, based on all their data.

### 9. What Success Looks Like
Reference their success vision from /hi5-self. Connect the numbers to what they actually want.

Tone by behavioral style: High D is direct, punchy, and action-oriented. High I is vision-forward, energetic, and story-driven. High S is steady, reassuring, and relationship-focused. High C is data-heavy, detailed, and logical.
