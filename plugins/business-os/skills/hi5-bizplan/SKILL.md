---
name: hi5-bizplan
description: Generates a personalized business plan tailored to the member's industry, goals, personality profile, and market. Reads the Master Profile from /hi5-setup and personality data from /hi5-self. Works for any brokerage or business model and uses only the commission or pricing rules the member gives. Saves the plan and the numbers to Notion and offers a markdown, Google Doc, or PDF copy. Triggers when the user runs /hi5-bizplan, says "business plan", "build my plan", or "create my business plan".
---

# Hi5 Bizplan: Business Plan Generator

## Purpose
Generate a personalized business plan from the member's Master Profile. Ask only for the numbers and goals that setup did not capture. Show every calculation step by step, using the member's own numbers, so they can check it. Tailor tone and structure to their behavioral style, industry, and biggest blocker.

## Core Rules
- Read the Master Profile first. Never ask for something it already has.
- One question at a time.
- Reference their name and specific details throughout.
- **Never hardcode any brokerage's or business's rules.** Cap amounts, splits, fees, production awards, revenue share, and price lists differ everywhere. Use only what the member tells you. If a rule is unclear, ask. Do not assume.
- Tailor tone to their behavioral style (from /hi5-self): High D leads with numbers and action steps. High I leads with vision and energy. High S leads with stability and steady growth. High C leads with data and detail.
- Tailor the structure to their biggest blocker. For example, if the blocker is taking on too much, limit the plan to three priorities.
- Write in the member's voice style and follow their Voice Profile. Never use em dashes unless the Voice Profile says `avoid_em_dashes: no`. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence. This includes tables, bullet lists, summaries, and headings (write a heading like Deal 3: reaches the cap, never with a dash).

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). No marked page: tell the member to run /hi5-setup first, then stop. More than one: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`business_plan_page_id`, `business_os_page_id`, and so on). Use those IDs directly. If a field this skill needs is missing from the profile, ask for it once, save it as a `- field_name: value` bullet inside the matching section of the Master Profile (never at the end of the page), and continue.

---

## Loading the Industry Flow

Read `industry_flow` from Setup Status (`real-estate` or `generic`). Load `industries/<industry_flow>.md`. It holds the question flow and the plan sections for that kind of business. If `industry_flow` is missing, use `generic`.

---

## OPENING

Read from the Master Profile:
- `name`, `industry`, `industry_flow`, `role`, `primary_market`, `niche`, `client_categories`
- `price_range`, `market_conditions`, `focus`, `lead_sources_ranked`, `goal_12_month` (from /hi5-setup)
- `behavioral_style`, `success_vision`, `biggest_blocker` (from /hi5-self)
- The Business Numbers section, if it exists from an earlier run

Setup owns niche, client types, focus, ranked lead sources, and the 12-month goal. Never ask for them again. This skill asks only for numbers.

If a Business Numbers section already exists, say: "Last time you gave me numbers on [date]. Do you want to update them all, or only what's changed?" Then show the saved values for each group of questions and ask "Still right?" Ask the question again only for a value that changed. This is the only shortcut. A saved value is something the member confirms or edits, never an assumption.

Open with the opening line in the industry file.

---

## HOW TO HANDLE THE NUMBERS

### Never assume a brokerage or business model
Collect the member's full compensation or cost structure ONCE, using the questions in the industry file, and save every answer to Business Numbers. This covers the split and cap, the cap year start, fees on each deal or sale (and whether each continues after the cap), any post cap split or fees, any franchise or royalty fee and its own cap, recurring fees, team split, referral fees, and costs outside the business that the member wants counted. The member can answer "none" or "not sure" to any line, and you save that answer.
- **Use only what they give you.** Never fill in a brokerage's, platform's, or partner's fees from memory, even when the member names the company.
- A line saved as "none" is zero. A line saved as "not sure" is not counted, and you say so in the math.
- Walk through one typical deal in a table, in the order you think applies, and ask "Is that the right order and the right amounts?" Fix it until they confirm, then save the confirmed order as `fee_order_note`.
- If anything is unclear, such as whether a fee counts toward the cap, ask a follow-up. Never fill a gap with a rule you think a company uses.
- If these fields are already saved, show them and ask "Still right?" instead of asking again.

### Year to date and the plan period
Ask how they are doing so far this year, not only last year. Ask what period the goal covers: the next 12 months, the rest of this calendar year, or something else such as a cap year or award year. If the period is the rest of a year, subtract what they have already done so far.

### Skip questions that answer themselves
- If the number of agreements or sales signed equals the number closed, skip "how many of those closed" and use the number they gave. Say why.
- If they closed only one deal in the period, skip the average price question and use that deal's price. Say why.
- If they say "none yet" for a funnel step, skip the steps after it and say why.

### Show the math, step by step
In the plan, show the chain from goal to daily activity with the member's numbers, one step per line, so they can check each line. For example: goal, then net-to-gross using their own split and fees, then deals or clients needed, then appointments or proposals needed, then conversations or leads needed, then per month and per week. Label every assumption and say where it came from ("from your numbers", "your estimate", or "I asked you").

### Diagnose honestly
Compute the funnel rates and diagnose: lead problem, conversion problem, or market problem. A very low conversion rate (for example 200 leads and 1 agreement) is a conversion problem. Say so plainly, recommend fixing conversion before buying more leads, and hold paid ads until later in the roadmap.

---

## STORING THE NUMBERS

After the questions, and before generating the plan, save the answers to the Master Profile's Business Numbers section. Create the section if it is missing, inserted before the Linked pages heading. Write one bullet per field using the names in the Business Numbers section of `../hi5-setup/templates/master-profile.md`: `- field_name: value`. Update an existing bullet instead of adding a second one. Include `gbp_status`, `social_frequency`, `paid_ads`, `marketing_goals`, `top_lead_source`, `desired_lead_source`, and `last_plan_date` (today). Other skills, such as /hi5-seo and /hi5-goals, read these from the profile. Say nothing technical about it.

---

## GENERATE THE PLAN

Say: "Perfect. I have everything I need. Give me a moment to put this together."

Generate the plan using the sections in the industry file. Follow all of the rules above. Then save it.

---

## OUTPUT AND STORAGE

Save the plan to the member's Notion page Business OS, then Business Plan (`business_plan_page_id`). Update that page. Do not create a second one.

> "Your business plan is ready, [name]. Here is what I did with it:
>
> ✅ Saved to your Notion workspace under Business OS, then Business Plan
> ✅ Saved your numbers to your Master Profile, so other skills can use them
> ✅ This is a living document: run /hi5-bizplan anytime to update it as your numbers change
>
> Would you like a copy you can save, print, or share? I can give you:
> A) The plan here as text to copy
> B) A Google Doc (if your Google Drive is connected)
> C) A PDF"

- **A:** output the full plan as clean markdown.
- **B:** create a Google Doc with the Drive connector.
- **C:** create a PDF, using a PDF tool if one is available in this session. Tell the member that if their brand fonts are not available in the build environment, a similar fallback font will be used.

---

## NEXT STEP

Recommend ONE next step: /hi5-goals. Say: "Next: run /hi5-goals. It breaks this plan into this quarter's targets and a 13 week plan, using your own numbers, and a weekly check-in keeps you on track."

Say once: "When you have a few weekly check-ins, run /hi5-bizreview to compare your results with this plan."

End your message with: "You can run /hi5-next any time and I'll tell you your best next step."
