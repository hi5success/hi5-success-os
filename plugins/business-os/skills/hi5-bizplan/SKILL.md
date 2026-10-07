---
name: hi5-bizplan
description: Generates a personalized business plan tailored to the member's industry, goals, personality profile, and market. Reads from the Master Profile created in /hi5-setup and personality data from /hi5-self. Saves the completed plan to Notion and offers a downloadable version. Triggers when the user runs /hi5-bizplan, says "business plan", "build my plan", or "create my business plan".
---

# Hi5 Bizplan: Business Plan Generator

## Purpose
Generate a comprehensive, personalized business plan based on the member's Master Profile. Ask for the business numbers and goals not captured in setup. Tailor everything to their behavioral style, industry, and market.

## Core Rules
- Read Master Profile first, never ask for info already captured in setup
- One question at a time
- Reference their name and specific details throughout
- Tailor tone and delivery to their behavioral style from /hi5-self
- High D → lead with numbers and action steps
- High I → lead with vision and excitement
- High S → lead with stability and steady growth
- High C → lead with data and detailed breakdown

---

## OPENING

Read from Master Profile:
- name, industry, role, primary_market, niche
- price_range, market_conditions, focus, lead_sources_ranked, goal_12_month (from /hi5-setup)
- behavioral_style, success_vision, biggest_blocker (from /hi5-self)

Setup owns niche, focus, ranked lead sources, and the 12-month goal. Never ask for them again. Only ask below for the numbers. If a field is missing from the profile, ask the original question.

Open with:
> "Alright [name]. Let's build your business plan. I already know your market is [market], you are a [role], your goal is [goal_12_month], and your vision is [success_vision]. Now I need your numbers and goals so we can build something real.
>
> A few questions and then I will put it all together for you."

---

## BUSINESS NUMBERS

**Q1: Last Year Performance**
> "Let's start with last year. How many transactions did you close?"
Store: BIZPLAN.deals_closed

**Q2: Volume**
> "What was your total sales volume?"
Store: BIZPLAN.total_volume

**Q3: GCI**
> "What was your GCI, your gross commission income?"
Store: BIZPLAN.gci_earned

**Q4: Conversion Funnel**
> "Now let's walk through your conversion funnel. This tells us exactly where to focus your energy. Ballpark numbers are fine.
>
> How many leads did you receive last year?"
Store: BIZPLAN.leads_received

> "Of those leads, how many signed a buyer or listing agreement?"
Store: BIZPLAN.agreements_signed

> "And how many of those actually closed?"
Store: BIZPLAN.closed_transactions

Claude calculates internally:
- Lead to agreement rate = agreements / leads x 100
- Agreement to close rate = closed / agreements x 100
- Diagnose: lead problem / conversion problem / market problem

**Q5: Average Sale Price**
> "You told me you typically work in [price_range]. What is the average sale price?"
Store: BIZPLAN.avg_sale_price

**Q6: Buyer Seller Split**
> "What is your typical buyer to seller split? For example 60% buyers, 40% sellers."
Store: BIZPLAN.buyer_seller_split

---

## LEAD SOURCES

**Q7: Top Source**
> If lead_sources_ranked exists, say: "Your biggest lead source is [first item in lead_sources_ranked]. Is that still true?" and store it. Only if the field is missing, ask the question below.
> "What is your number one source of leads right now?"
>
> A) Sphere of influence / referrals
> B) Social media (organic)
> C) YouTube
> D) Paid ads
> E) Open houses
> F) Cold outreach / door knocking
> G) Online leads (Zillow, Realtor.com, etc.)
> H) Other

Store: BIZPLAN.top_lead_source

**Q8: Weakest Source**
> "What lead source do you most want to add or improve this year?"
Store: BIZPLAN.desired_lead_source

---

## DIGITAL PRESENCE

**Q9: Google Business Profile**
> "Where are you at with your Google Business Profile?"
>
> A) Fully optimized and actively getting reviews
> B) Set up but not actively managing it
> C) Barely started
> D) Do not have one yet

Store: BIZPLAN.gbp_status

**Q10: Social Posting Frequency**
> "How often are you posting to social media overall right now?"
>
> A) Rarely or never
> B) A few times a month
> C) 1-3 times per week
> D) Daily

Store: BIZPLAN.social_frequency

**Q11: Paid Ads**
> "Are you running any paid ads?"
>
> A) No
> B) Facebook/Instagram ads
> C) Google ads
> D) Multiple channels

Store: BIZPLAN.paid_ads

**Q12: Marketing Goals**
> "What marketing would you most like to add or improve this year? Select all that apply:"
>
> A) Grow YouTube
> B) Be more consistent on social
> C) Buyer or seller workshops/webinars
> D) Build an email list
> E) Improve Google Business Profile
> F) Start paid ads
> G) Door knocking campaigns
> H) Build referral network

Store: BIZPLAN.marketing_goals

---

## GOALS

**Q13: GCI Goal**
> If goal_12_month exists, say: "Your 12-month goal is [goal_12_month]. Let's turn it into numbers." Then ask:
> "What is your GCI goal for the next 12 months?"
Store: BIZPLAN.gci_goal

Claude calculates internally:
- Transactions needed = gci_goal / avg_commission_per_deal
- Use avg_sale_price x 0.025 as default commission if not specified

**Q14: Transaction Goal**
> "How many transactions are you targeting this year?"
Store: BIZPLAN.transaction_goal

**Q15: Niche**
> Skip this question if niche is in the Master Profile. Otherwise ask:
> "Do you focus on a specific niche or client type?"
>
> A) Luxury / high end
> B) First time buyers
> C) Investors
> D) Relocation
> E) New construction
> F) General: I work with everyone
> G) Other

Store: BIZPLAN.niche

---

## GENERATE THE PLAN

After all questions:

> "Perfect. I have everything I need. Give me a moment to put this together."

Generate a comprehensive business plan with these sections:

### 1. Agent Snapshot
Summary of who they are, their market, role, experience, and brand. Written in second person, specific to their data.

### 2. Where You Stand
Honest assessment of last year's numbers. Conversion funnel analysis with diagnosis, lead problem, conversion problem, or market problem. No fluff, just clarity.

### 3. Your 12 Month Target
GCI goal, transaction goal, transactions needed per month, average commission needed per deal. Make the math visible and simple.

### 4. Your Lead Engine
Based on top source and desired source, specific recommendations for how to generate leads consistently. Tailored to their platforms, budget, and style.

### 5. Your Marketing Plan
Based on marketing goals selected, specific content strategy, platforms to prioritize, posting cadence, and quick wins. Tied to their YouTube status and social platforms.

### 6. Your Conversion System
Based on CRM and conversion funnel data, specific recommendations for improving lead to agreement and agreement to close rates.

### 7. Your 90 Day Roadmap
Month 1 / Month 2 / Month 3, specific actions, not generic advice. What to do first, what to build next, what to optimize last.

### 8. Your Biggest Opportunity
One clear insight about where their biggest untapped opportunity is based on all their data.

### 9. What Success Looks Like
Reference their success vision from /hi5-self. Connect the numbers to what they actually want.

Tailor tone throughout to behavioral style:
- High D: direct, punchy, action-oriented, no fluff
- High I: vision-forward, energetic, story-driven
- High S: steady, reassuring, relationship-focused
- High C: data-heavy, detailed, logical progression

---

## OUTPUT AND STORAGE

After generating:

> "Your business plan is ready, [name]. Here is what I am doing with it:
>
> ✅ Saving to your Notion workspace under Business OS → Business Plan
> ✅ This becomes a living document: run /hi5-bizplan anytime to update it as your numbers change
>
> Would you also like a downloadable version you can save, print, or share?"

If yes → format as a clean markdown document and output in full for them to copy, or save as a Google Doc if Drive is connected.

---

## NEXT STEP

> "Now that your business plan is set, let's lock in your quarterly goals. Run /hi5-goals and I will break your annual target into 90 day sprints so you always know exactly what you should be working on.
>
> Ready?"
