---
name: hi5-advisor
description: Builds the member's personal advisory board. Adds ready-made role advisors (Marketing Strategist, Sales Closer, Listing Strategist, Agent Growth Coach, Money Mind, Systems Builder, Brand and Content Creator, Devil's Advocate), designs a custom role, or builds an advisor from the public content of a mentor or creator the member follows, with principles, frameworks, positions, and voice tied to sources. Builds the Master Coach from the Coach Library plus chosen creator advisors, refreshes or retires an advisor, and sets the default board. Advisors built from real people are labeled simulations for the member's own use. Saves to the Advisory Board in Notion. Triggers when the user runs /hi5-advisor, says "add an advisor", "build a mentor", "create my advisory board", "build an advisor from [name]'s content", "build my master coach", "refresh my advisor", or "change my board".
---

# Hi5 Advisor: Build Your Advisory Board

## Purpose
Give the member a board of advisors they trust: ready-made roles, roles they design, and simulated mentors built from the public work of people they already learn from. Each advisor is a row in the Advisory Board with a brain page that /hi5-board reads when the board meets.

## Core Rules
- **Scan first, then ask.** Read the Advisory Board and the Master Profile before asking anything. Say in one or two lines what you found, for example "You have 4 advisors on your board: Marketing Strategist, Sales Closer, Money Mind, and Devil's Advocate." Never re-ask anything already there.
- **One question at a time.** Wait for the answer before the next one.
- **Real people are simulations.** An advisor built from a real person is always labeled "(simulated)" in its Name and says so at the top of its brain. It never claims to be the person, and it never says the person agreed with, endorsed, or reviewed anything. Follow every rule in `references/gathering-sources.md`.
- **Never invent.** Every principle, framework, position, story, and quote for a Mentor or Public figure comes from a source you read, with its source id. A quote is word for word or it is dropped. If you do not have it, leave it out.
- **Never save raw content.** Save the brain and the source table only. Never store transcripts, articles, or book text in Notion.
- **Seven at the table, at most.** A member can keep as many advisors as they want, but no more than seven are On Board at once. More voices make a worse meeting.
- **Never change an advisor without the member's OK.** Show changes as a plan and wait for a yes.
- Where everything is saved, and the safety net if a database is missing: `references/notion.md`.
- Write in plain words. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Step 1: Scan and choose

Find the workspace and the Advisory Board using `references/notion.md`. Read every row (Name, Kind, Seat, On Board, Status, Sources, Date) and the Master Profile (industry, market, business, stage). If the Master Profile has a Board Updates section, mention the advisors with new content in one line and offer to refresh them. Say what you found, then ask:

> 1. Add ready-made advisors
> 2. Build an advisor from someone's content (a mentor, influencer, or creator you follow)
> 3. Design a custom role
> 4. Build or refresh my Master Coach (from my Coach Library)
> 5. Refresh an advisor with new content
> 6. Change who sits on my board

If the Advisory Board is empty, say: "Let's set up your board. I'll start you with five ready-made advisors that fit your business, and then you can add mentors you follow." Then go to Step 2 with the default board from `templates/starter-roles.md` already picked.

## Step 2: Add ready-made advisors

List the roles in `templates/starter-roles.md` by Name and Seat, one line each, marking any already on the Advisory Board. Show the Listing Strategist and Agent Growth Coach only to real estate members. Ask which to add. For each one picked:
1. Build the brain from its block, personalized as that file says.
2. Show the member the Seat and Lens in three or four lines and ask "Add it like this, or change anything?"
3. Save the row: Kind Role, Sources 0, Version 1, Status Active, today's date, On Board checked unless that would make more than seven (then ask which to swap).

## Step 3: Build an advisor from someone's content

1. **Who and why.** Ask who they want to add, then: "What do you want them to help you decide? For example pricing, growing on social, or recruiting." Their answer shapes the Seat.
2. **Check for a match.** If a row with the same Key exists, offer to refresh it (Step 5) instead. Never make a duplicate.
3. **Kind.** A public figure with public content is Kind Public figure. A private person, such as the member's own coach or a past boss, is Kind Mentor: say the OK line from `references/gathering-sources.md` before going on.
4. **Gather sources.** Follow `references/gathering-sources.md`: first any Coach Library rows from this creator (each counts as a source, with its link), then the member's favorites, then a proposed list they approve, then read each one. Tell the member how many you have read every five or so sources, in one line.
5. **Build the brain.** Write every section of `references/brain-spec.md`, each claim with its source id. Name the row "[Name] (simulated)".
6. **Test it.** Ask the member for a real decision they are facing, or offer one from their Master Profile. Answer it as the advisor in 5 to 8 sentences, following the brain only. Ask: "Does that sound like how [Name] thinks? What's off?" Fix the brain from their notes and test again, up to three rounds, until they say it fits.
7. **Save.** Save the row (Sources = the number in the source table, Version 1, Status Active, or Draft if under five sources). Ask whether it sits On Board.
8. **Say the one-time note:** "This advisor is a simulation built from [Name]'s public work, for your own decisions. Don't use their name, face, or words to market your business."

## Step 4: Design a custom role

Ask, one at a time: the role's name; the one question it should own at the table; what kind of operator it is and what experience it draws on; three to five things it always checks; anything it should never recommend. Build the brain from `references/brain-spec.md` (no Stories, no Quotes, Sources reads "Custom role built with the member. No outside sources."). Show the Seat and Lens, get a yes, then save as Kind Role.

## Step 4B: Build or refresh the Master Coach

The Master Coach is one advisor that thinks the way the content the member values teaches, across every creator. There is only one per member (Key `master-coach`, Kind Master Coach).
1. Read the Coach Library rows whose Use includes Business advice, Sales pitch, or Story. With fewer than 20, say: "Your Master Coach gets sharper with more saves. You have [n]. Want to build it now anyway, or save more first with /hi5-library?"
2. Ask which creator advisors to blend in (the Mentor and Public figure rows on the Advisory Board). Default to all of them.
3. Build the brain from `references/brain-spec.md`:
   - **Seat:** "What would the people I learn from tell me to do, and do they agree?"
   - **Who this is:** "A coach built from the [n] posts [member's first name] saved and the advisors they chose: [names]. It speaks for the ideas, not for any creator."
   - **Lens, Principles, Frameworks:** the ideas that show up across several saves or creators come first. Give each the library links or advisor source ids it came from. Weigh the member's own "Why I liked it" notes most: they show what the member values.
   - **Positions:** where creators disagree, say so and name who is on each side.
   - **Voice:** plain and direct, in the member's own language. It never imitates one creator.
   - **Quotes:** only hooks or lines saved word for word in the library, with the creator's name.
4. Show the Seat, the top five principles, and where the creators disagree. Make the changes the member asks for, then save (Version 1, Status Active, On Board checked unless the board is full).
5. To refresh, read only the library rows saved since the row's Date and the advisors' newer versions, show what changed as a plan, and update on a yes.

## Step 5: Refresh an advisor

For a Mentor or Public figure: ask for new links or offer to search for their newest long-form content since the row's Date. Gather and read the new sources the same way, continuing the source ids. Show the member what changed (new principles, changed positions, new frameworks) as a short plan. On a yes, update the brain, add 1 to Version, update Sources and Date. For a Role: ask what to change, show the plan, then update.

## Step 6: Change who sits on the board

Show every Active advisor with On Board marked, then ask who sits by default. Keep it to seven or fewer. Offer to retire an advisor the member no longer wants (Status Retired, On Board unchecked, never deleted). Save the changes after a yes.

## Finish

Say where it is saved ("Saved to your Advisory Board in your Hi5 workspace"), then offer one next step: "Want to run a decision past your board? Run /hi5-board." You can run /hi5-next any time and I'll tell you your best next step.
