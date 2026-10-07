# Build the CMA

Used by job 3 in `jobs.md`. The member's agent judgment sets the final price. This work is an opinion of value prepared for the agent, not an appraisal.

Say once at the start: "Be sure to check your MLS rules."

## Step 1: Get the comps
Offer two ways, and let the member choose. They can switch at any time.
- **A) Export or paste (always available).** The member exports a CMA report, a CSV, or a PDF from their MLS the normal way, or copies the results, and pastes or uploads it here.
- **B) Browser-assisted search (optional).** The member opens their own MLS in the browser and logs in themselves, with Claude for Chrome in "Ask before acting" mode. Show a search plan first (the search criteria below) and wait for the member's approval before any search or any listing is opened. Read only: never edit, save, share, or email anything in the MLS. The member watches, and if the MLS blocks the step, shows a prompt, or asks for anything, stop and switch to A. This step applies to the member's own MLS login only. Never use it on Zillow, Redfin, or any other listing site.

Use only comps the member supplies or that were viewed in that session. Never make up a comp.

## Step 2: The subject property
Ask for what is missing: address, property type, beds and baths, living area, lot size, year built, notable features (pool, garage, updated kitchen, view), and known condition issues. For a rental, the module asks for rent details instead.

## Step 3: The search criteria (shown to the member, adjusted with a reason)
- The same property type, within 0.5 to 1 mile or in the same subdivision or community.
- Within 1 bedroom and about 20 percent of the subject's living area.
- Closed in the last 6 months. Widen to 12 months only if fewer than 3 closed comps exist, and say so.
- Also include 2 or 3 actives and 1 or 2 pendings for context.
The module for the client type may change these (for example luxury or land). Tell the member what you changed and why.

## Step 4: Capture each comp
Address, status, list price, sold price, sold date, days on market, living area, beds and baths, year built, price per square foot, and the key differences from the subject. If a field is not in what the member gave you, write "not verified". Never estimate a field.

## Step 5: The analysis
1. **Comp table:** closed first, then pending, then active.
2. **Adjustments.** Ask once for the member's own adjustment values (for example per square foot, per bedroom or bath, garage, pool, lot, condition) and save them as `cma_adjustments` in the Master Profile (Tools section). Use only the member's values. Under the table, list each adjustment, its direction, its amount, and the reason. Label them estimates for the agent to verify, never an appraisal. If the member has no values, show the comps unadjusted and say what adjustments they would need to supply.
3. **The adjusted value range**, then a recommended list price and a "priced to compete" price, with one sentence on the trade-off. The agent decides.
4. **Market snapshot:** 2 or 3 plain sentences the member can use in the presentation, with no copied MLS remarks or photos.
5. **Gaps:** anything that weakens the set (thin data, outliers, unusual sale conditions) so the member reviews it before presenting.
6. Before you finish, confirm every number in the table came from data the member supplied or viewed. Mark the rest "not verified".

## Step 6: A seller-facing page (offer)
Offer to rewrite the market snapshot and price section for the seller: one headline, the price range with a short reason, and three bullets on what buyers in this range are choosing right now. Plain language, no MLS jargon, no description of who buyers are, and the member's disclosure line at the end.

Remind the member: "Use your MLS data only as your MLS rules allow."
