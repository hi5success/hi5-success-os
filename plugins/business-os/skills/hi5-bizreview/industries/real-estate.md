# Hi5 Bizreview: Real Estate Flow

Used by `SKILL.md`. Follow the core rules there: use only the commission model the member gave /hi5-bizplan, show every step, and never assume listings. Real estate members work with many kinds of clients, so review every number by the client types they actually serve.

## What to read from Business Numbers
- The goal and its type: `gci_goal`, `take_home_goal`, or `transaction_goal`, plus `plan_period`
- Year to date: `deals_closed_ytd`, `gci_ytd`
- The funnel and rates: `leads_received`, `agreements_signed`, `closed_transactions`, `avg_sale_price`
- The member's mix: `client_mix` and `client_categories`
- The full compensation structure: `brokerage_split`, `cap_amount`, `cap_progress`, `cap_year_reset`, `per_deal_fees`, `post_cap_terms`, `royalty_percent`, `royalty_annual_cap`, `royalty_ytd`, `recurring_fees`, `team_split`, `referral_fees`, `outside_costs`, and `fee_order_note`
- `team_deals_count_to_leader`, `avg_days_to_close`
- The quarter's headline numbers: `quarter_deals_goal`, `quarter_gci_goal`, `quarter_take_home_goal`

## Activity names by client type
Use the names the weekly plan uses: conversations, consultations or showings, agreements signed, and closings. Name them the way that client type works, for example buyer consultations, listing appointments, lease showings, or investor meetings. Cover every type in `client_categories` the plan includes. Group the others as "other client types".

## Plan versus actual numbers
The activity numbers, agreements signed, closings, and GCI. Show GCI actual against `quarter_gci_goal` (or the plan to date), and take-home against `quarter_take_home_goal` if their commission model is saved.

## By client type
For each type: closings and GCI planned (from `client_mix` and the quarter's split) against actual. Name a type that is ahead and one that is behind. Where the check-ins carry a client type, use it. Where they do not, list a gap.

## Take-home (apply to the actual closings)
1. Get each closing's GCI. Use the numbers in the check-ins or from the member. If only a total is known, divide by the closings and label it an average.
2. Use only the saved compensation structure. Never use a fee the member did not give, and never fill one in from what you know about a brokerage. If a field is missing, ask once using the matching question (C1 to C11) in the /hi5-bizplan real estate flow, save it, and continue. "None" and "not sure" count as answered, and a "not sure" line is not counted.
3. Walk the closings in order. Work out how much cap remained at the start of the timeframe from `cap_progress` (plus anything the check-ins show), say which closing reached the cap and which reached any royalty cap, and show each closing's take-home before or after, in the order saved in `fee_order_note`. Subtract recurring fees prorated to the timeframe and the outside costs the member wanted counted.
4. Show GCI and take-home side by side, then the same numbers planned for the quarter. If a cap or royalty cap resets inside the timeframe, show before and after the reset date exactly as the member described it. If any rule is unclear, ask.
5. If no compensation structure is saved at all, show GCI only and say: "Take-home needs your split and fees. Run /hi5-bizplan to add them and I'll show both."

If `team_deals_count_to_leader` is yes, review team totals and offer the same view per agent.

## Lead sources
Use `lead_sources_ranked` as the list. Real estate sources are often referrals, sphere, past clients, open houses, online leads, paid ads, and farming, but use only what the member listed. Cost per closing needs spend per source, and real estate members often have none for referrals and sphere, which is fine. A source with no cost is shown as "no cost entered".

## Rules for real estate reviews
- A review describes numbers and activities only. Never describe people, neighborhoods, or schools, and never rate an area. Keep any example free of references to who lives where.
- Do not promise or predict a closing, a price, or a timeline. Say what the numbers show.
- Never quote a rate, a market statistic, or an industry average as fact. Use the member's own numbers.
- Tax and legal questions that come up are for their CPA or attorney. A review is not tax advice.
- If a check-in or number shows commission figures the member has marked as internal, keep them in the review page only, never in anything public.
