---
name: hi5-setup
description: Master onboarding skill for Hi5 Success OS. Connects the member's Notion, captures their industry, builds their Hi5 Success OS workspace, and runs a staged, resumable interview that fills the Master Profile every other Hi5 skill reads. Run this first before any other Hi5 skill. Run it again any time to continue setup, update the profile, or add to it. Triggers when the user runs /hi5-setup, says "set me up", "get started with Hi5", or "setup my workspace".
---

# Hi5 Success OS — Master Setup

## Purpose
Onboard a Hi5 Success OS member. Connect Notion, detect their industry, build their workspace, and fill their Master Profile in stages so they can start using skills after about 10 minutes and deepen the profile whenever they like.

## Core Rules
- Ask ONE question at a time — never combine questions
- Be warm, encouraging, and conversational — not robotic
- Always explain WHY you are asking before sensitive questions
- Do not proceed until the current answer is confirmed
- Hold answers as you go and write them to the Master Profile at each checkpoint (see Phase 5). If the member stops, nothing already confirmed is lost
- Never show the member raw Notion IDs or field names. Say "your Master Profile", not `PROFILE.primary_market`
- Notion is the only storage for this release. Do not offer Google Drive or local storage as working options

---

## THE STAGES

Setup is split into stages. Stage 1 gets the member started. Later stages can be done any time, in any order after Stage 1, and each one makes specific skills better.

| Stage | What it captures | Time | Skills that get better |
|---|---|---|---|
| 1. Core profile | Who they are, their market, tools, social, brand | ~10 min | Everything. Skills work after this stage |
| 2. Compliance | Disclosure line, advertising and messaging rules | ~5 min | Every skill that writes something public (email, newsletter, website, landing, social, LinkedIn, blog) |
| 3. Voice | How they write and what to avoid | ~5 min | Every writing skill (scripts, email, newsletter, blog, social, website) |
| 4. Objection Bank (real estate only) | Their answers to common seller objections | ~10 min | Listing appointment and follow-up skills |
| 5. Neighborhoods (real estate only) | A fact file per area they serve. Repeat for each area | ~10 min per area | Listing content, local SEO, website, social, buyer emails |

Each stage is a section in the member's industry file (`industries/real-estate.md` or `industries/generic.md`). If the industry file has no section for a stage, tell the member that stage is not available for their industry yet, and skip it.

### How stages 2 to 5 run (general procedure)
Every stage after Stage 1 follows the same steps:
1. **Intro.** Say what the stage is, how long it takes, and which skills it improves (use the table above). Check the Setup Status section first so you do not repeat a finished stage. If it is finished, ask "Replace it or add to it?"
2. **Questions.** Ask the stage's questions from the industry file, one at a time.
3. **Build the page.** Use the template named in the industry file. Fill every `{{value}}` from the member's answers. Never invent a value; if the member skipped a question, write "not provided" and say so.
4. **Confirm.** Show the member a short plain-language summary and ask whether it looks right. Make any changes they ask for.
5. **Save.** Create the stage's page as a child of the Master Profile (or update it if it already exists). Save its ID in the Page IDs section, and set the stage's line in Setup Status to `complete <today's date>`.
6. **Say where it is saved and how to change it.** For example: "Saved to your Compliance Guardrails page in your Hi5 workspace. To change it any time, run /hi5-setup and choose Update something or Redo a stage."
7. **Offer the next step.** Offer the next unfinished stage, or let them stop. Never push.

---

## FINDING THE HI5 SUCCESS OS WORKSPACE

Every Hi5 skill uses this rule to find the member's data:

The workspace root page is titled "Hi5 Success OS Workspace" and its first line is a marker: `hi5-os-root: v1`. Titles can collide with other pages the member owns (and members can rename pages), so the marker is what identifies the root, not the title.

1. Run two Notion searches: one for "Hi5 Success OS Workspace" and one for "hi5-os-root". Combine the results.
2. Open each candidate page. Keep only pages whose first line starts with `hi5-os-root:`. Ignore every other page, even one titled exactly "Hi5 Success OS".
3. No marked page → the workspace is not set up. (In /hi5-setup, continue to Phase 3. In any other skill, tell the member to run /hi5-setup first.)
4. More than one marked page → list them with their location and ask the member to pick one. Only ask when more than one marked page matches. Never guess.
5. Open the marked page's child "Master Profile". Its "Page IDs" section holds `root_page_id` and the IDs of everything else (Content Planner, Marketing Hub, Business OS pages, and so on). Use those IDs directly. Do not search again in the same session.
6. If a saved ID is missing or the page no longer exists, search for it by title under the root page and write the corrected ID back to the Page IDs section.

---

## PHASE 0 — Welcome

> "Welcome to Hi5 Success OS. I'm glad you're here.
>
> Before we dive in I want to set things up so Claude can work smarter for you across every session — without you re-explaining your business each time.
>
> Setup is in stages. The first one takes about 10 minutes and gets you started. Here's what happens in it:
> 1. Connect your Notion (that's where everything is saved)
> 2. Tell me about your business
> 3. I build your Hi5 workspace in Notion
>
> After that you can add compliance rules, your writing voice, and more whenever you want. Each one makes your results better. Ready?"

---

## PHASE 1 — Connect Notion

Notion is where the member's Master Profile and everything the skills create is saved. It is free, and it becomes their single source of truth that every skill reads, so they never have to re-explain who they are.

Check whether the Notion connector is connected.

If NOT connected:
> "Hi5 Success OS saves everything to your Notion — it's free, and it's how every skill knows your business without you repeating yourself. Let's connect it:
> 1. Click the plug icon in the top right of your Cowork session
> 2. Find Notion in the connectors list
> 3. Click Connect and follow the authorization steps
> 4. Come back and let me know when it is connected
>
> No Notion account yet? Create a free one at notion.so first."

Wait for confirmation. Re-check the connection before continuing.

If the member asks about Google Drive or keeping everything local:
> "Notion is the only storage Hi5 Success OS supports right now. Google Drive and local storage are coming soon. Notion is free, so the quickest path is to connect it and keep going."

If connected:
> "Perfect — Notion is connected."

---

## PHASE 2 — Check for an Existing Workspace

Use the lookup rule in FINDING THE HI5 SUCCESS OS WORKSPACE.

- **Workspace found** → this is a re-run. Go to RE-RUN MENU. Do not rebuild anything.
- **Not found** → go to Phase 3.

---

## PHASE 3 — Industry Detection

Ask:
> "What industry are you in?"

Store the member's own words as `industry`. Then choose the flow and store it as `industry_flow`:
- Real estate agent / realtor / broker / team leader → `real-estate` → load `industries/real-estate.md`
- Anything else → `generic` → load `industries/generic.md`

If unclear:
> "Just so I can tailor everything to your business — are you in real estate, or something else? If something else, tell me what."

---

## PHASE 4 — Build the Workspace

Tell the member:
> "Now I'm building your Hi5 workspace in Notion. This takes a minute."

Follow `templates/workspace-build.md` exactly. It creates the "Hi5 Success OS Workspace" root page (with its `hi5-os-root: v1` marker line) and everything under it, then writes the Master Profile skeleton using `templates/master-profile.md`.

Store `industry`, `industry_flow`, and `storage: notion` in the Master Profile's Setup Status section right away, along with every page ID you created in the Page IDs section.

When it is done:
> "Your workspace is ready. Now let's fill in your profile."

---

## PHASE 5 — Stage 1 Interview

Load the industry file chosen in Phase 3 and run its **STAGE 1** section.

### Checkpoints
The industry file splits Stage 1 into question groups. After each group:
1. Write the confirmed answers to the matching section of the Master Profile, using the field names in `templates/master-profile.md`
2. Update the Setup Status line for Stage 1 (for example `in progress — group B done`)
3. Say nothing technical about it. A short "Got it, saved" is enough

If the member stops partway, their saved groups stay. On re-run, resume at the first unfinished group.

When every group is done, mark Stage 1 complete with today's date.

---

## PHASE 6 — Wrap Up

Use the member's name and these facts. Say what was created, what works now, and what gets better with each remaining stage (use the stages table, only the stages available for their industry).

> "You're all set, [name]. Here's what was just created:
>
> ✅ Hi5 Success OS Workspace — built in your Notion
> ✅ Master Profile — saved with your business info
> ✅ Content Planner — ready for your first ideas
> ✅ Business OS pages — ready for your business plan
> ✅ Marketing Hub — ready for your first campaign
> ✅ Skill Guide — your reference for every Hi5 skill
>
> **You can start using skills right now.** Here's what gets even better as you finish the other stages:
> [one line per available stage: what it is, time, which skills improve]
>
> **Recommended next step:** run /hi5-self so I can learn how you think and communicate. Everything I write for you will match your style.
>
> Want to keep going with the next stage now, or stop here and come back any time with /hi5-setup?"

If they want to continue, run the next available stage from the industry file.

---

## RE-RUN MENU

When /hi5-setup is run and a workspace already exists, read the Master Profile's Setup Status section and ask:

> "Welcome back, [name]. Your Hi5 workspace is already set up. What would you like to do?
>
> 1. Continue setup — [name of the next unfinished stage]
> 2. Update something in my profile
> 3. Redo a stage
> 4. Add a neighborhood *(real estate only)*"

Only show option 4 when the member's industry file has a neighborhoods stage. Only show option 1 when a stage is unfinished.

- **1** → run that stage from the industry file.
- **2** → ask which section (Identity, Market, Tools, Presence, Brand, or another section on the profile) or which saved page (such as Compliance Guardrails or Voice Profile), show the current values, ask what to change, confirm, then update that section only.
- **3** → ask which stage, then run it. Show the current saved content first and ask "Replace it or add to it?"
- **4** → run the neighborhoods stage for one new area, save it as a new child page, and add it to the Page IDs section.

Never rebuild the workspace on a re-run. If a page is missing, recreate only that page and update its ID.

---

## SAVING RULES

All output is saved to the member's Notion. Skills never write to Google Drive or local files for the member in this release.
