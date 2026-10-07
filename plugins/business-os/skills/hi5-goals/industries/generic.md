# Hi5 Goals: Generic Flow (Any Industry)

Used by `SKILL.md`. Follow the core rules there: use only the pricing and cost model the member gave /hi5-bizplan, and show every step. Use the member's own words for what they sell ("clients", "customers", "projects", "sales").

## What to read from Business Numbers
- The goal and its type: `revenue_goal`, `take_home_goal`, or `client_goal`, plus `plan_period` and `goal_type`
- Year to date: `deals_closed_ytd`, `revenue_ytd`
- Last year and the funnel: `revenue_last_year`, `deals_closed_last_year`, `avg_deal_value`, `leads_received`, `agreements_signed`, `closed_transactions`
- `take_home_note` (what they keep after costs) and `capacity_note`
- `milestone_goal`

## Questions (ask only what is missing, once each)

**Timing lag**
> "From a proposal or quote being accepted to the money coming in, about how many days does it usually take?"
Save `avg_days_to_close`.

**Offers** (optional, ask once if they sell more than one thing)
> "Do you want to split this quarter's target by what you sell, for example by service or product line?"
If yes, ask for rough shares and save them as `client_mix` in their words.

## The chain (show every step on its own line)

1. **Annual target.** State it as the member gave it (revenue, take-home, or number of clients) and the period it covers.
2. **Remaining.** Subtract year to date (`revenue_ytd` or `deals_closed_ytd`).
3. **This quarter's share.** Even split of what remains across the quarters left in the plan period, unless `seasonality_note` says otherwise. Label an even split as an assumption.
4. **Revenue and take-home.** If `take_home_note` is saved, show BOTH numbers for the quarter, using only what they told you: the revenue the quarter needs, and what they keep from it. If the target was take-home, convert it to the revenue needed. If their costs are not saved, show revenue only and say: "Take-home needs your costs. Run /hi5-bizplan to add them and I'll show both."
5. **Clients needed.** Quarter revenue divided by `avg_deal_value`. Say where the average came from. If they split by offer, divide by each offer's value.
6. **Work backwards.** Proposals or calls needed = clients needed divided by their proposal to client rate. Leads needed = proposals needed divided by their lead to proposal rate. Use their rates from Business Numbers.
7. **Check capacity.** Compare the clients needed with `capacity_note`. If the target does not fit, say so plainly and offer options: raise prices, add help, change the target, or spread it across more quarters.
8. **Shift for timing.** Work that closes this quarter was started about `avg_days_to_close` days earlier, and work started late in the quarter will close next quarter. Show which weeks the proposals must go out.
9. **Per week.** Turn the totals into 13 weeks of targets: leads or conversations, proposals or calls, and clients won.

If they gave a `milestone_goal`, show progress toward it using only the requirements they gave you, labeled "as you told me". Ask if anything is unclear.

## Headline numbers to save in Business Numbers
`quarter_clients_goal`, `quarter_revenue_goal`, `quarter_take_home_goal` (only if their costs are saved), and `client_mix` if you asked for it.

## Weekly check-in activities
Ask for: leads or conversations, proposals or calls, clients won, and any revenue that came in this week.
