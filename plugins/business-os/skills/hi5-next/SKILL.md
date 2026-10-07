---
name: hi5-next
description: Guides the member to the best next step in Hi5 Success OS. Reads their progress from Notion, recommends one next step with a short reason and two alternatives, and offers to start it. Read-only, and it never skips ahead to skills that have not shipped. Triggers when the user runs /hi5-next, says "what should I do next", "what's next", "where do I start", "what can I do", or "help me pick a skill".
---

# Hi5 Next: Your Best Next Step

## Purpose
Always move the member to the next useful step. Read what they have finished, recommend ONE next step and why, offer two alternatives, and offer to start it. Members use Hi5 skills in any order, so this skill keeps them from guessing.

## Core Rules
- **Read-only.** Never create, edit, or delete any Notion page, database, or row. The one exception is writing `projects_offered: <today's date>` in the Setup Status section of the Master Profile when you offer the Claude Projects tip (see Step 5).
- Recommend ONE next step, not a menu of competing options. The alternatives come after it and are short.
- Use plain language a non-technical person understands. Never show field names, IDs, or Notion jargon.
- Never recommend a skill whose Status is `coming` in `references/path.md`, and never describe one as available.
- Never ask the member questions to work out progress. If a signal is missing, treat that step as not done.
- Never use em dashes.

---

## Finding the Member's Workspace

Search Notion for "Hi5 Success OS Workspace" and for "hi5-os-root". Open each result and keep only pages whose first line starts with `hi5-os-root:` (ignore any other page, even one titled exactly "Hi5 Success OS"). More than one marked page: ask which one to use; never guess. Open its child page "Master Profile". Its Page IDs section lists the IDs of everything else (`content_planner_db_id`, `marketing_hub_db_id`, `business_plan_page_id`).

No marked page: the member has not set up yet. Say: "I don't see your Hi5 workspace yet. The first step is /hi5-setup. It gets Notion ready and builds your workspace, and the first stage takes about 10 minutes." Make that your one recommendation and stop.

---

## Step 1: Read progress

Read only what you need, from these places:
- **Master Profile:** the Setup Status section (stage lines, `industry_flow`, `self_test`, `projects_offered`), the Self Profile section, the Business Numbers section (`last_plan_date`, `current_quarter`, `last_check_in`), the Content Profile section, and the Presence section (`youtube_url`, `newsletter_frequency`). Do not read the Quarterly Goals page itself. The Business Numbers fields are enough.
- **Content Planner** (`content_planner_db_id`): query the rows with their Status, Deliverable Type, Repurpose Status, and Publish Date.
- **Marketing Hub** (`marketing_hub_db_id`): query the rows with their Type and Date.

## Step 2: Work out what is done

Open `references/path.md`. For every step on the path, use its "Done when" column to decide whether it is done. The setup stages are in the "Setup stages" table.

## Step 3: Choose the next step

Walk the path in the order given in `references/path.md` and take the FIRST step that is not done, then apply these checks. If a check rules the step out, move to the next one.
- **Status:** skip anything `coming`.
- **Skip rules:** apply every rule in the "Skip rules" section of `path.md` (real estate only steps, members with no YouTube channel, plugins that are not installed).
- **In progress:** if a stage is partly done (for example Stage 4 has finished some client types), recommend finishing it.
- **Installed:** only recommend a skill that appears in your list of available skills. If it is in a plugin that is not installed, name the plugin and say to install it from the Hi5 marketplace, then pick the next installed step as the alternative.

If every step on the path is done, use the upkeep rules in Step 4.

## Step 4: Upkeep (when the path is done)

Recommend the first one that applies:
- Business Numbers has a goal and `current_quarter` is set, and the last weekly check-in (`last_check_in`) is more than 7 days ago, or no check-in is logged and the quarter began more than 7 days ago: /hi5-goals, and say to choose a weekly check-in.
- The Content Planner has no Scheduled video with a Publish Date in the next 14 days: /hi5-yt-plan (skip if they have no channel).
- A Scheduled video publishes in the next 7 days and none is Scripted: /hi5-yt-script (skip if they have no channel).
- The newest Newsletter row in the Marketing Hub is older than their `newsletter_frequency` allows (weekly 8 days, bi-weekly 16 days, monthly 35 days): /hi5-newsletter.
- The newest SEO Strategy row is older than 90 days: /hi5-seo.
- `last_plan_date` is older than 90 days: /hi5-bizplan to update the plan.

If none apply, say they are on track and offer three things they could do, picked from their goals.

## Step 5: Say it

Use this format. Keep it short.

> **Where you are:** [one plain sentence about what they have finished, for example "Your profile and compliance are set up, and your business plan is done."]
>
> **Your next step: [/hi5-command]**
> [One or two sentences on why, using the "Why it matters" line from `path.md`, tied to something specific from their profile when you can.]
>
> If you'd rather do something else:
> - [/hi5-alternative-1]: [short reason]
> - [/hi5-alternative-2]: [short reason]
>
> Want me to start [/hi5-command] now?

Choose the two alternatives from the next two steps on the path that pass the Step 3 checks. Never list /hi5-next itself as an alternative. If fewer than two real alternatives exist, list fewer. You may swap one for a skill that clearly fits the member's goals (for example `marketing_goals` or the channel goal in their Content Profile).

For a setup stage, name it as "run /hi5-setup and choose Continue setup", and say which stage.

**The weekly check-in nudge.** Whatever your main recommendation is, if Business Numbers has `current_quarter` and `last_check_in` is more than 7 days ago (or there is no check-in and the quarter began more than 7 days ago), add one gentle line after the alternatives: "Also, your weekly check-in is due. Run /hi5-goals and choose a weekly check-in." Do not make it your main recommendation unless the path is done.

**The Claude Projects tip.** If Stage 1, Stage 2, Stage 3, /hi5-self, and /hi5-bizplan are all done and `projects_offered` is not in Setup Status, add after your recommendation: "One more tip: keeping a few separate Claude Projects, one per topic, keeps your work organized. Want me to show you how?" Whatever they answer, write `projects_offered: <today's date>` in Setup Status. If they say yes, follow `references/projects.md`. This is the only write you ever make.

## Step 6: If they say yes

If you can run skills in this session, start the recommended skill. Otherwise say: "Type /hi5-command to begin." For a setup stage, tell them to run /hi5-setup and choose Continue setup.

## "Show me everything"

If the member asks what they can do, show the Goal menu from `references/path.md`, with only `live` skills and one short line each, grouped by goal. Then ask which goal they want to work on, and recommend the first step for it.

## Next
End every answer with: "You can run /hi5-next any time and I'll tell you your best next step."
