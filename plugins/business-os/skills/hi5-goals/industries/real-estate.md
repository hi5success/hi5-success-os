# Hi5 Goals: Real Estate Flow

Used by `SKILL.md`. Follow the core rules there: use only the commission model the member gave /hi5-bizplan, show every step, and never assume listings. Real estate members work with many kinds of clients, so split every target by the client types they actually serve.

## What to read from Business Numbers
- The goal and its type: `gci_goal`, `take_home_goal`, or `transaction_goal`, plus `plan_period` and `goal_type`
- Year to date: `deals_closed_ytd`, `gci_ytd`
- Last year and the funnel: `deals_closed_last_year`, `gci_last_year`, `leads_received`, `agreements_signed`, `closed_transactions`, `avg_sale_price`
- The member's mix: `buyer_seller_split` (their words) and `client_mix` if saved earlier. Also `client_categories` from the Business section
- Their full compensation structure in their own words (see step 4 for every field), and `team_deals_count_to_leader` for teams
- `milestone_goal`

## Questions (ask only what is missing, once each)

**Client mix**
If `client_mix` is missing, build it from `buyer_seller_split`. If that does not cover every type in `client_categories` (for example renters, landlords, or investors), ask:
> "Roughly what share of your business is each kind of client? For example 50% buyers, 30% sellers, and 20% investors. Rough numbers are fine."
Save `client_mix` in their words. Never assume listings or any particular mix.

**Timing lag**
> "From a signed agreement to a closing, about how many days does it usually take you?"
Save `avg_days_to_close`. If it differs a lot by client type, ask for each type and note it.

## The chain (show every step on its own line)

1. **Annual target.** State it as the member gave it (GCI, take-home, or number of deals) and the period it covers.
2. **Remaining.** Subtract year to date (`gci_ytd` or `deals_closed_ytd`).
3. **This quarter's share.** Even split of what remains across the quarters left in the plan period, unless `seasonality_note` says otherwise. Label an even split as an assumption.
4. **GCI and take-home, per deal and for the quarter.**
   - Use only the member's saved compensation structure in Business Numbers: `brokerage_split`, `cap_amount`, `cap_progress`, `cap_year_reset`, `per_deal_fees`, `post_cap_terms`, `royalty_percent`, `royalty_annual_cap`, `royalty_ytd`, `recurring_fees`, `team_split`, `referral_fees`, `outside_costs`, and the order they confirmed in `fee_order_note`. Never use a fee the member did not give you, and never fill one in from what you know about a brokerage.
   - **Ask once for anything missing.** If any of these fields is not in Business Numbers at all, ask for it once using the matching question (C1 to C11) in the /hi5-bizplan real estate flow, save it, and continue. An answer of "none" or "not sure" counts as answered. A line saved as "not sure" is not counted, and you say so in the math.
   - **One deal before the cap.** Show one deal at the average GCI as a short table in the confirmed order: the GCI, each deduction with what it is taken from and the amount, and the take-home. Apply any annual royalty cap using what has been paid so far.
   - **One deal after the cap.** Show the same deal after the cap is reached: the post cap split or fee, the per deal fees that continue, and the take-home.
   - **For the quarter.** Walk the deals in order. Work out how much cap remains from `cap_progress`, say which deal reaches the cap and which deal reaches the royalty cap, and show each deal's take-home before and after. Then subtract recurring fees prorated to the quarter and the outside costs the member wanted counted. Show the quarter's total take-home next to the GCI that produced it.
   - If the target was take-home, work backwards to the GCI needed with the same model and show the steps. If the target was GCI, show the take-home it produces.
   - If a cap or a royalty cap resets inside the quarter, show before and after the reset date exactly as they described it. If any rule is unclear, ask.
   - If no compensation structure is saved at all, show GCI only and say: "Take-home needs your split and fees. Run /hi5-bizplan to add them and I'll show both."
5. **Deals needed.** Quarter GCI divided by average GCI per deal. Average GCI per deal comes from their numbers (last year's GCI divided by last year's deals, or the commission per deal they gave). Say which one you used.
6. **Split by client type.** Divide the deals by `client_mix`. For example: "12 deals: 6 buyer, 4 seller, 2 investor." Say how you rounded. If a type's average GCI differs a lot, ask once and use their numbers.
7. **Work backwards for each type.** Agreements needed = deals needed divided by their agreement to close rate. Conversations or leads needed = agreements needed divided by their lead to agreement rate. Use their overall rates from Business Numbers and label them as overall rates unless they gave rates for a type.
8. **Shift for timing.** Deals that close in this quarter come from agreements signed about `avg_days_to_close` days earlier, and agreements signed late in this quarter will close next quarter. Show which weeks the agreements must be signed to hit the quarter's closings, and what is already in progress if they told you.
9. **Per week.** Turn the totals into 13 weeks of targets for each client type: conversations, consultations or showings, and agreements signed. Name each activity the way that client type works, for example buyer consultations, listing appointments, lease showings, or investor meetings.

If `team_deals_count_to_leader` is yes, state the targets as team totals and offer the same numbers per agent if they want them.

If they gave a `milestone_goal`, show progress toward it using only the requirements they gave you, labeled "as you told me". Ask if anything is unclear.

## Headline numbers to save in Business Numbers
`quarter_deals_goal`, `quarter_gci_goal`, `quarter_take_home_goal` (only if their commission model is saved), and `client_mix` if you asked for it.

## Weekly check-in activities
Ask for each client type they serve: conversations, consultations or showings, agreements signed, and closings. Also ask for any GCI that closed this week. Name the activities as in the weekly plan.
