---
name: hi5-goals
description: Sets and tracks quarterly goals from the member's business plan. Breaks the annual target into the quarter and into 13 weeks of milestones, shows the math step by step with the member's own numbers, and runs a weekly check-in. Works for any brokerage or business and never assumes anyone's commission rules. Reads the numbers saved by /hi5-bizplan. Triggers when the user runs /hi5-goals, says "set my goals", "quarterly goals", "90 day plan", or "weekly check in".
---

# Hi5 Goals: Quarterly Goals and Weekly Check-ins

## Purpose
Turn the member's business plan into this quarter's targets and a 13 week plan, then keep them on track with a short weekly check-in. Show every calculation step by step, using only the member's own numbers, so they can check each line.

## Core Rules
- Read the Master Profile first. Never ask for something it already has.
- One question at a time.
- **Never hardcode any brokerage's or business's rules.** Cap amounts, splits, fees, awards, and revenue share differ everywhere. Use only what the member told /hi5-bizplan. If a rule is unclear, ask. Do not assume.
- **Write only to the existing Quarterly Goals page** (`quarterly_goals_page_id`), found through the workspace root marker and the saved page IDs. Never create a duplicate page and never create a new database. If the saved page is missing, search for it by title under the root page. If it truly does not exist, tell the member to run /hi5-setup and choose Continue setup, then stop.
- Keep older quarters on the page. Only change the section for the quarter being set or revised.
- Tailor tone to their behavioral style (from /hi5-self): High D leads with numbers and action. High I leads with vision and energy. High S leads with steady progress. High C leads with data and detail.
- Tailor the structure to their biggest blocker. If the blocker is taking on too much, limit the quarter to three priorities.
- Label every assumption and say where it came from ("from your numbers", "your estimate", or "I asked you").
- Check the target against reality. If the weekly activity does not fit their capacity or their calendar, say so plainly and offer options.
- Follow the member's Voice Profile. Never use em dashes in anything you say or write. Use a comma, a colon, or a new sentence. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, and summaries.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`quarterly_goals_page_id`, `business_plan_page_id`). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

---

## Loading the Industry Flow

Read `industry_flow` from Setup Status (`real-estate` or `generic`) and load `industries/<industry_flow>.md`. It holds the chain of numbers for that kind of business. If `industry_flow` is missing, use `generic`.

---

## Step 1: Read

Read from the Master Profile:
- **Business Numbers:** the goal numbers and plan period, year to date, the funnel numbers, the member's own commission or cost model, `milestone_goal`, and any earlier goals fields (`current_quarter`, `goals_last_set`, `last_check_in`)
- `client_categories`, `behavioral_style`, `biggest_blocker`, `success_vision`
- The Business Plan page (`business_plan_page_id`): the 90 day roadmap, so the weekly plan follows it
- The Quarterly Goals page (`quarterly_goals_page_id`): which quarter sections already exist

## Step 2: Choose what to do

1. **No plan numbers.** If Business Numbers has no goal number or no funnel numbers, say: "I build your quarterly goals from your business plan numbers, and I don't have them yet. Run /hi5-bizplan first. It takes about 10 minutes, and then I can turn it into this quarter's plan." Then stop. Do not run a mini intake.
2. **The current quarter already has a section.** Ask:
   > "You already have goals for [quarter]. What would you like to do?
   >
   > A) A weekly check-in
   > B) Revise this quarter
   > C) Set up next quarter"
3. **No section for the current quarter.** Set goals. If the current quarter is more than ten weeks over, ask whether they want this quarter or the next one.

---

## SETTING GOALS

### Ask only what is missing, once each
- **Quarter basis.** "Do you plan by calendar quarters, or by your own year, like a cap year or an award year?" Save `quarter_basis`. If they use their own year, ask when it starts (use `cap_year_reset` if you have it) and build the quarters from that date.
- **Seasonality.** "Is your business seasonal? Are some months busier than others?" Save `seasonality_note`. If they say no or are not sure, split evenly and label that an assumption.
- **Timing lag.** Ask the question in the industry file for how long it takes from a signed agreement to a closing or a paid job. Save `avg_days_to_close`.
- **Anything else the industry file lists** that Business Numbers does not have yet.

### The math
Follow the chain in the industry file. Show every step on its own line with the member's numbers. Do not skip steps and do not round without saying so. Use this order:
1. The annual target, exactly as the member stated it, and what plan period it covers.
2. Subtract what they have done so far this year.
3. This quarter's share (even split unless they gave seasonality).
4. Convert to the numbers that matter for their business (see the industry file).
5. Work backwards through their own funnel rates to the weekly activity.
6. Shift the activity earlier by their timing lag, because work done this quarter often closes next quarter, and work that closes this quarter was started earlier.

### Weekly plan
Build 13 weeks. Each week has: the dates, the activity targets from the math, and two or three actions taken from the 90 day roadmap in their business plan and their marketing goals. Respect the blocker rule. Check the weekly activity against their capacity and calendar and say so plainly if it does not fit.

### Save
1. Write the quarter's section to the **existing** Quarterly Goals page, using `templates/quarterly-goals-page.md`. Put the newest quarter first. If revising, replace only that quarter's section.
2. Save these to the Business Numbers section of the Master Profile (inserted inside it, before the Linked pages heading), updating existing bullets instead of adding second ones: `current_quarter` (for example 2026-Q4), `quarter_basis`, `seasonality_note`, `avg_days_to_close`, `goals_last_set` (today), and the quarter's headline numbers named in the industry file.
3. Tell the member what you saved and where, in plain words.

---

## WEEKLY CHECK-IN

Use this when the member chooses A, or says "weekly check in".
1. Read the current quarter's section: the plan to date and the check-in log.
2. Ask, one at a time, for this week's actuals using the activity names in the industry file, and anything that closed. Offer a short list so they can answer fast.
3. Compare cumulative actuals with the plan to date. Say plainly: ahead, on track, or behind, with the numbers.
4. If behind, find the bottleneck from their own rates: not enough activity, or activity that is not converting. Adjust only the next two weeks, unless the member asks to revise the whole quarter. Keep the blocker rule.
5. Add a line to the Check-in log: the week, the date, actuals against plan, the status, and any adjustment. Update `last_check_in` to today.
6. End with one clear action for the next week. Mention once that deeper reviews of how the business is doing are coming soon in /hi5-bizreview.

## SET UP NEXT QUARTER

When the member chooses C, or a new quarter has started:
1. Show how the last quarter went: the goal against what happened, from the check-in log and Business Numbers.
2. Ask whether anything changed in their numbers, such as a new split, a new average price, or new funnel rates. If their Business Numbers are older than 90 days, suggest updating them with /hi5-bizplan first.
3. Then follow SETTING GOALS for the new quarter. Keep the older quarter's section on the page.

---

## NEXT STEP

Recommend ONE next step, following the Recommended path in /hi5-setup. If real estate Stage 4 or Stage 5 is not complete, recommend /hi5-setup and Continue setup. Otherwise, if Content OS is installed, recommend /hi5-yt-setup. If not, recommend /hi5-email. Always add: "Do your first weekly check-in in 7 days. Run /hi5-goals and choose a weekly check-in, and I'll nudge you through /hi5-next."

Never recommend /hi5-bizreview yet. End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
