---
name: hi5-bizreview
description: Reviews how the business is doing against the plan for this quarter so far, last quarter, or the year to date. Reads the quarter numbers and weekly check-ins saved by /hi5-goals and the fee-aware take-home from /hi5-bizplan, compares actual with plan by client type or offer and by lead source, finds the bottleneck, and suggests at most three adjustments. Works for any industry and never assumes anyone's commission rules. Triggers when the user runs /hi5-bizreview, says "business review", "how am I doing", or "review my numbers".
---

# Hi5 Bizreview: Business Performance Review

## Purpose
Give the member a clear, honest look at how the business is performing against their own plan, for the timeframe they choose. Show every calculation step by step with the member's own numbers, say what is working and what is not, and suggest a few adjustments.

## Core Rules
- Read the Master Profile first. Never ask for something it already has.
- One question at a time. Offer short lists so answers are quick, and let the member skip any question.
- **Never hardcode any business's rules.** Splits, caps, fees, awards, and costs differ everywhere. Use only what the member told /hi5-bizplan. If a rule is unclear, ask. Do not assume.
- **Write reviews only to the existing Business Reviews page** (`business_reviews_page_id`), one section per review, newest first. The only other thing this skill touches is one link line in the matching quarter's section on the Quarterly Goals page. Never create a new database. If the Business Reviews page is missing, search for it under the Business OS page by title. If it truly does not exist, offer once to create one page called Business Reviews under Business OS, and write nothing until the member says yes. This skill never changes goals, targets, or the weekly plan. To change them, point the member to /hi5-goals.
- **Plan versus actual uses the member's own plan.** Compare actuals with the plan to date on the Quarterly Goals page. For lead sources there are no per-source targets, so compare with the member's own ranked sources, their own past mix, and their own overall rates, and label every such comparison "an assumption from your numbers".
- Label every assumption and say where it came from ("from your numbers", "from your check-ins", "your estimate", or "I asked you").
- Never invent a benchmark, an industry average, or a result. If a number is missing, say so and show what the review can and cannot say without it.
- Nothing in a review states a result or earnings as a promise. Describe only the member's own numbers and activities.
- Tailor tone to their behavioral style (from /hi5-self): High D leads with numbers and action. High I leads with wins and energy. High S leads with steady progress. High C leads with data and detail.
- Tailor the adjustments to their biggest blocker. If the blocker is taking on too much, give one or two adjustments, never three.
- Follow the member's Voice Profile. Never use em dashes in anything you say or write. Use a comma, a colon, or a new sentence. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`quarterly_goals_page_id`, `business_plan_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the Business Numbers section of the Master Profile (never at the end of the page, always before the Linked pages heading), and continue.

---

## Loading the Industry Flow

Read `industry_flow` from Setup Status (`real-estate` or `generic`) and load `industries/<industry_flow>.md`. It holds the names of the numbers, the client types or offers, and the take-home steps for that kind of business. If `industry_flow` is missing, use `generic`.

---

## Step 1: Read

Read from the Master Profile:
- **Business Numbers:** the goal, plan period, year to date, the funnel numbers and rates, the member's own cost or commission model and `fee_order_note`, `avg_days_to_close`, `current_quarter`, `last_check_in`, and any earlier review fields (`last_review_date`, `review_quarter`, `lead_source_costs`)
- `client_categories`, `client_mix`, `lead_sources_ranked`, `top_lead_source`, `behavioral_style`, `biggest_blocker`
- The Quarterly Goals page (`quarterly_goals_page_id`): the quarter sections, each with its targets, the math, the weekly plan, and the check-in log
- The Business Reviews page (`business_reviews_page_id`): the earlier reviews, so a re-run of the same period replaces its own section

## Step 2: Choose the timeframe

If there is no Quarterly Goals page, or it has no quarter section, say: "I review your results against your quarterly plan, and I don't have one yet. Run /hi5-goals first. It takes about 10 minutes." Then stop. Do not run a mini intake.

Otherwise ask:
> "What would you like me to review?
>
> A) This quarter so far
> B) Last quarter
> C) The year to date"

If the member's quarter section has no check-ins and the timeframe has no saved actuals, say plainly that a review needs at least some actuals, ask for rough totals once (labeled "your estimate"), and say the review will be early and rough. Never refuse to help, and never fill a gap with a guess.

## Step 3: Check the data

Read `references/review-checks.md` (sections 1 and 2). Count the check-ins in the timeframe, find which have a client type or offer breakdown and which have a source tally, and work out which comparisons the data can support. Tell the member in one or two lines what the review can cover and what it cannot, and why. If fewer than two check-ins exist, say the review is early and work from what exists.

## Step 4: Plan versus actual

Show every step on its own line with the member's numbers.
1. The plan to date: add the weekly plan rows up to today (or the whole quarter for last quarter), from the Quarterly Goals page.
2. The actuals to date: add the check-in log lines, then add anything the member gives now.
3. For each number that matters (the activity numbers, the agreements or clients won, the closings or paid work, and the revenue), show plan, actual, the difference, and the status. Use the status words and thresholds in `references/review-checks.md` section 3.
4. For the year to date, compare with the annual target and `plan_period`, using year to date numbers from Business Numbers plus the quarter sections that exist. Say which quarters have no section, and do not guess for them.
5. Shift for timing: closings in this timeframe come from work started about `avg_days_to_close` days earlier. Say which results are still in progress and not yet counted, so the member is not told they are behind when money is simply not in yet.

## Step 5: By client type or offer

Follow the industry file. Show plan and actual for each client type or offer, using `client_mix` and the quarter's split. Say which type is ahead and which is behind, and the numbers behind that. If a type has no breakdown in the check-ins, say so and list it as a gap, not as zero.

## Step 6: By lead source

Follow `references/review-checks.md` section 4.
1. Build the source table from the check-in source tallies. If there are none, ask once, quickly, for rough counts for the timeframe: offer the member's own `lead_sources_ranked` as options plus "other", and let them skip. Label these "your estimate".
2. For each source show leads, agreements or clients, closings or paid work, and its rate from lead to close. Compare with the member's overall rates and with the order in `lead_sources_ranked`, and label that "an assumption from your numbers". Never compare against a target, because none exists.
3. If any source has a cost, show cost per closing. If none is saved in `lead_source_costs`, ask once for the monthly spend per source (offer to skip), save it, and continue. "None" and "not sure" count as answered, and a "not sure" line is not counted.
4. Name the source that gives the most closings and the source that gives the best return, if costs exist. Say plainly when the sample is too small to trust.

## Step 7: Take-home

Use the member's saved compensation or cost structure. Read the take-home step in the industry file and apply it to the actual closings in the timeframe, in the order the member confirmed in `fee_order_note`. Show revenue and take-home side by side, before and after any cap, next to the planned take-home from the quarter's targets. If a fee or cost is missing, ask once using the matching question in /hi5-bizplan, save it, and continue. A line saved as "not sure" is not counted, and you say so. If no costs are saved at all, show revenue only and say: "Take-home needs your fees and costs. Run /hi5-bizplan to add them and I'll show both."

## Step 8: What the numbers say

1. **What is working.** Up to three items, each with its numbers.
2. **What is not.** Up to three items, each with its numbers.
3. **The bottleneck.** Use the rule in `references/review-checks.md` section 5: not enough activity, activity that is not converting, or timing. Name one.
4. **Keep, fix, or drop.** Sort the member's main activities and lead sources into these three groups, using the rule in section 6. Never recommend dropping something on a sample too small to trust.

## Step 9: Adjustments

Give three adjustments at most (one or two if their blocker is taking on too much). Each says what to change, why, with the number behind it, and what to watch next week. If the plan itself no longer fits, suggest running /hi5-goals to revise the quarter, but never change goals here. Check each adjustment against their capacity and calendar, and say so plainly if it does not fit.

## Step 10: Save

1. Write the review to the existing Business Reviews page, using `templates/review-page.md`. It is one section for the period reviewed, placed at the top of the page so the newest review comes first. A re-run of the same period replaces only that period's section. Never touch another review.
   Then add or update one link line in the reviewed quarter's section on the Quarterly Goals page, under its Review part, pointing to the new review (see the template). For a year to date review, link it from the current quarter's section. Never touch the targets, the weekly plan, the check-in log, or another quarter.
2. Save to Business Numbers (inside the section, before the Linked pages heading), updating existing bullets instead of adding second ones: `last_review_date` (today), `review_quarter` (for example 2026-Q4), and `lead_source_costs` if you asked for it.
3. Tell the member what you saved and where, in plain words.

---

## NEXT STEP

Recommend ONE next step. If the quarter has two weeks or fewer left, or the plan no longer fits, recommend /hi5-goals to set up next quarter or revise this one. Otherwise recommend the next weekly check-in with /hi5-goals, and say the review is worth repeating at the end of the quarter or after four more check-ins. If a take-home line was missing, mention /hi5-bizplan.

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
