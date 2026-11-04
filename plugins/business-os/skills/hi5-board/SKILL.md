---
name: hi5-board
description: Runs a decision past the member's personal advisory board. Builds a short brief from the decision and the Master Profile, confirms who sits, gets each advisor's independent view from their own brain (stance, reasoning, the risk they see, and the question they would ask), then writes a group summary with where the board agrees and splits, a recommended call, the biggest risk, what would change the call, and next steps. Also answers a quick question from one advisor, lets the member push back, and reviews past decisions at their follow-up date. Saves the meeting to Board Meetings in Notion. Advisors built from real people are labeled simulations. Triggers when the user runs /hi5-board, says "ask my board", "run this by my board", "board meeting", "what would my advisors say", "should I...", or "ask [advisor name]".
---

# Hi5 Board: Run a Decision Past Your Board

## Purpose
Help the member make a better decision by hearing several strong, different viewpoints, then a clear summary they can act on. No debate rounds and no show: each advisor gives their honest view once, and the summary weighs them.

## Core Rules
- **Each advisor speaks from their own brain only.** An advisor uses its brain page, the brief, and nothing else. It never borrows another advisor's frameworks, and it never looks up facts about the real person outside its brain.
- **Independent views.** Advisors do not see each other's views before giving their own. When you can start sub-agents, give each advisor its own (see Step 4). Otherwise write each view in turn, from its brain only, without adjusting it to match the views before it.
- **Real people are simulations.** Show "(simulated)" after the name of every Mentor or Public figure advisor in every view and summary. Never write that the real person said something unless it is a verbatim line from that advisor's Quotes section, with its source id.
- **Never invent facts.** Advisors reason from the brief. When a fact they need is missing, they say what they would need to know, rather than assuming it. Never invent numbers about the member's business.
- **Advice, not orders.** The member decides. For legal, tax, lending, or licensing questions, the summary says to confirm with the right professional. Hi5 rules still apply in every view: compliance, Fair Housing for real estate, texting consent, and drafts only.
- **One question at a time** when you need something from the member.
- Where everything is saved, and the safety net if a database is missing: `../hi5-advisor/references/notion.md`.
- Write in plain words. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Step 1: Load the board

Find the workspace using `../hi5-advisor/references/notion.md`. Read the Advisory Board rows with Status Active. If there are none, say: "You don't have a board yet. Run /hi5-advisor and I'll set you up with five advisors in a few minutes," and stop.

**Fresh brain check.** If a Master Coach is Active, count the Coach Library rows saved after its Date. If there are 10 or more, offer once before the meeting: "You've saved [n] new posts since your Master Coach was last built. Want me to refresh it first? It takes a few minutes." On a yes, refresh it with /hi5-advisor Step 4B (show the changes and wait for the member's OK, as that step says), then continue. On a no, continue without asking again in this session. If the Master Profile has a Board Updates section with new content for a seated creator advisor, offer the refresh the same way, in one line.

If the member asked one advisor a quick question ("ask the Money Mind if...", "what would [name] say about..."), go to Quick ask below.

## Step 2: Build the brief

1. Get the decision. If the member has not given it, ask: "What decision do you want the board's help with?"
2. Read the Master Profile (business, industry, market, offers, team, goals) and Business Numbers if it exists. Use only what bears on the decision.
3. Ask at most three questions, one at a time, only for facts that would change the answer: usually the options on the table, the money or time at stake, and the deadline. Skip any the member already answered.
4. **Live numbers, if they help.** When the decision turns on numbers the profile does not have (leads, pipeline, close rate, revenue, ad spend), and a connected tool has them (the member's GoHighLevel or another CRM, Sheets, or an ad account), ask: "Want me to pull your real numbers from [tool] for this? I'll only read." On a yes, read only what this decision needs, show the numbers in the brief with where they came from, and never change anything. On a no, use what the member tells you.
5. **Quick answer or detailed report?** Ask once: "Do you want a quick answer here, or a detailed report you can keep and share?" Remember the answer for Step 6.
6. Write the brief in five to ten lines: the decision, the options, the key facts and numbers, the deadline, and what is unknown. Show it and ask "Anything to add or fix before the board weighs in?"
7. **Facts check.** If the brief is missing what is at stake (money, time, or what happens if it fails) or the options, say which is missing and ask for it once. If the member still does not know, go on, but the call can be no stronger than "Need more info" or a low-confidence call, and the summary says what to find out first.

## Step 3: Seat the board

Show who sits by default (On Board advisors). If an Active advisor that is not On Board fits this decision clearly better, suggest the swap in one line with the reason, for example "This is a recruiting question, so I'd add your Agent Growth Coach. Swap out Brand and Content Creator?" Seat three to seven advisors. Wait for the member's OK.

## Step 4: Each advisor's view

For each seated advisor, read its brain page. Then get its view.

When you can start sub-agents, start one per advisor at the same time, each with: the advisor's full brain page, the brief, and this task:

> You are [Name], an advisor on the member's board. Use only your brain and the brief. Give your view on the decision in your own voice, following your Lens and Voice sections. Return: Stance (Go, No go, Go with changes, or Need more info), your view in 4 to 8 sentences, the one risk you see, the one question you would ask the member, and the source ids you drew on. If you are a simulation of a real person, say so in your first line and quote only from your Quotes section. Never use em dashes.

Otherwise write each advisor's view in turn yourself, with the same task, reading only that advisor's brain for it.

Check each view before you use it: it follows that advisor's Lens, it cites its sources (for a Mentor or Public figure), any quote matches its Quotes section word for word, and it has no em dashes. Fix or drop anything that fails.

## Step 5: The group summary

Write the summary from the views, using the Group summary and Next steps sections of `references/meeting-notes.md`. Weigh each view against the advisor's Blind spots. Never decide by counting votes: weigh the reasons, and give the most weight to the advisor whose Seat this decision mostly is (a pricing call leans on Money Mind, a lead generation call on Marketing Strategist). A split is fine: name it honestly rather than forcing agreement. Set confidence high only when the facts are solid and the board mostly agrees; medium when they split or a key fact is estimated; low when a key fact is unknown. Where a cheap test could settle the question before a big commitment, make that test the first next step. Tie next steps to a Hi5 skill when one clearly fits (for example /hi5-funnel for a new offer, /hi5-re-listing-appt for a listing plan, /hi5-goals for a target).

## Step 6: Show it and save it

Save the meeting first, so nothing is lost: a Board Meetings row with the full notes from `references/meeting-notes.md` as the page body, Outcome Not reviewed. The Notion page is the report and the member's permanent record, so it always holds everything.

**Quick answer.** Show in chat: the call and confidence, each advisor's stance in one line with the risk they see, where the board agrees and splits in two or three lines, and the next steps. Keep it to one screen.

**Detailed report.** Show the same short version in chat, then make the report from the same notes:
1. If the session lists a Docs artifact type, create the report from it; otherwise build one self-contained HTML page and publish it as an artifact. It holds the full meeting notes, laid out to read and share: the call up top, the group summary, next steps, each advisor's view, and the facts used. Label simulated advisors and keep the closing simulation note.
2. Put its link in the meeting row's Report field.
3. Say in one line that the full report is also saved in their Board Meetings in Notion, and that the report can be downloaded as a PDF.

Then, either way:
1. One line: "Want to push back on anyone, or ask one of them a follow-up?"
2. Ask: "When should we check how this turned out? I'd suggest [a date that fits the decision, usually 30 to 90 days out]." Save the Follow-up date.
3. Say "Saved to your Board Meetings in your Hi5 workspace."

**Push back.** When the member pushes back on an advisor, that advisor answers from its own brain in three to six sentences, and holds its view unless the member gave a new fact. If its view changes, update its section and the summary in the saved notes, and say what changed.

## Review a past decision

When the member asks how a past decision went, says "review my board decisions", or starts /hi5-board while a meeting's Follow-up date has passed and its Outcome is Not reviewed, offer the review in one line (never more than one meeting at a time).
1. Show the decision, the call, and the next steps from that meeting in three or four lines.
2. Ask what they actually did, and what happened, one question at a time.
3. Set Outcome (Worked, Mixed, Didn't work, or Didn't do it) and add an Outcome section to the meeting notes: what happened, which advisors' views held up, and what the board missed.
4. If the same advisor has been clearly wrong in two or more reviewed meetings on the same kind of decision, say so in one line and offer to adjust that advisor with /hi5-advisor. Never change an advisor here.

## Quick ask

Find the advisor by name or seat. If none matches, list the Active advisors and ask which one. Answer the question as that advisor in 3 to 8 sentences, from its brain and the Master Profile only, with its source ids, and "(simulated)" for a real person. No summary and no saving unless the member asks. Offer: "Want the whole board's take on this?"

## Next
After a meeting, say what is saved and the follow-up date. You can run /hi5-next any time and I'll tell you your best next step.
