# Job 1: Rank Expired Listings

Used by `SKILL.md`. Read `../../hi5-re-crm/references/guardrails.md` section 4 first. Everything in `SKILL.md` still applies: scan first, ask only about what is unknown, and the gate on every touch.

Say exactly one line at the start of this job: "Be sure to check your MLS rules." Add nothing else about MLS rules, and do not explain why.

## How the data gets in
Offer two ways, and let the member choose. They can switch at any time.
- **A) Export, paste, or a vendor list (always available).** The member exports a report or CSV from their own MLS the normal way, copies the results, or brings an expired list from their own data vendor (for example REDX, Vulcan7, or Landvoice), and pastes or uploads it here. Work only from that.
- **B) Browser-assisted review (optional).** The member logs into their own MLS themselves in the browser, with Claude for Chrome in "Ask before acting" mode, and runs their own expired search. Before any step, show the exact search criteria and wait for the member's OK. Read only: never edit, save, share, export, or email anything in the MLS, and never bulk-download. Use only what is visible on the pages the member approves, and do not click through other listings on your own. The member watches, and if the MLS blocks the step or shows a prompt, stop and switch to A.
This applies to the member's own MLS login only. Never use a browser tool on Zillow, Redfin, or any other listing site, and never to find an owner's contact information. Do not copy MLS photos or remarks into letters. This skill never skip traces or looks up phone numbers or emails.

## Inputs to look for
The area, price range, and how long ago the listings expired (30, 60, or 90 days). Scan the profile and the Neighborhood page first, and ask only what is missing. Before ranking, dedupe against the CRM and set aside any listing the member already worked (point to /hi5-re-seller-updates job 12 for those).

## What to read for each listing
Address, original price, price changes (how many, how large, and when), total days on market, the listing brokerage, photo count and quality, whether the remarks are specific or generic, showing activity if shown, and condition signals in the remarks. Write "not shown" for anything missing and never guess.

## Output
1. A ranked table: Rank, Address, Days on market, Price changes, What likely held it back (the one most visible factor), and How winnable it looks (high, medium, or low), with a one line reason that uses only those facts.
2. For the top 3, a diagnosis in plain language and a specific talking point that begins with what the member would do differently. The reasons are about the listing (price history, photos, remarks, exposure, timing), never about the owner and never about who lives there.
3. The gate summary before any outreach: who is on the CRM, who is do-not-disturb, and whether the member has confirmed a scrub for any call.
4. The next step: the comeback sequence (job 2) for the member's top pick, in the channels that pass the gate.
Never state what a home is worth or what price it should have been. Say when a conclusion rests on few facts.
