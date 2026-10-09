# The Five Jobs

Used by `SKILL.md`. For every job: scan first (the existing Neighborhood page, saved pages, the CRM, earlier Marketing Hub rows, and what the member pasted), ask only about what could not be found, and point to what you found. Every fact needs a source and a date, and anything without them stays "Needs verification". Never describe who lives in an area, never rate schools or safety, and never state a number from memory. Changes to the page follow plan, OK, then write.

---

## 1. Build or extend a fact file

Inputs to look for: the area name and its boundaries as the member defines them (a neighborhood name, a subdivision, or a radius around an address), and what is already on the page. If there is a page, use it and add only what is missing. If there is no page, build one from `templates/fact-file.md`.
1. **Interview for gaps, 4 questions at a time,** skipping anything the scan answered, in these groups, based on the Local Area Fact File prompt:
   - Market facts the member can source: price range, how fast homes sell (only if the member gives the figure and where it came from), home styles, lot sizes, and HOA details.
   - Lifestyle and amenities: parks, trails, dining, shopping, events, and how to get around (routes and typical drive times as the member gives them).
   - Insider knowledge: best streets or sections for a specific feature, what surprises newcomers, and seasonal quirks. Features and the place only.
   - Buyer and seller considerations: what moves fast, what inspections often flag, and what buyers should ask.
   Start the interview with: "Skip anything about who lives there. Keep it to the place, the homes, and the amenities."
2. **For every number,** ask "Where is that from, and what date?" in one short question, and record the answer as the Source and Date. If the member does not know, the fact stays "Needs verification".
3. **Compile the page** with the 8 sections in order, the fact tables, the first-line note, and the Inputs (`area_name`, `last_updated`, `refresh_by`). Ask for `refresh_by` once: "When should this be refreshed, in 3 months or 6 months?" Use the member's answer as a date. Suggest no other interval.
4. **Run the quality check** from job 2 before showing the page. Tell the member in one line what you removed or changed.
5. Show the Snapshot and the Content Angles and the change plan, and save after the OK.

## 2. Refresh and check a fact file

Inputs to look for: the page, today's date, and the page's `refresh_by`.
1. **List what needs attention** in a table: the fact, its source and date, and why it is on the list (past `refresh_by`, marked "Needs verification", no source, no date, or an old "[VERIFY + DATE]" mark).
2. **Ask for updated figures and sources,** one fact or one group at a time, and accept what the member pastes. When a source is an MLS export or a page the member pasted, record it as such with its date. Never look anything up.
3. **Quality check.** Scan every line of the page and flag, with the exact quote and the fix:
   - Any line that describes residents or who lives or should live there (including proxies such as "family-friendly", "quiet crowd", "young professionals", "up and coming", "established", or "exclusive").
   - Any line that rates schools or describes safety or crime ("good schools", "top-rated", "safe", "low crime").
   - Any claim with no source, a prediction, or an appreciation or trend statement.
   - Any risk stated as settled (flood, drainage, noise, soil).
   - Any steering phrase from `../../hi5-re-listing-launch/references/fair-housing-scan.md`.
   Replace each with a feature-based line about the place, a "verify with the official source" note, or remove it.
4. **Convert old marks.** Turn each "[VERIFY + DATE]" into a row in the fact table with Status "Needs verification" and the date on the mark.
5. **Show a plan** (Section | Before | After), wait for the OK, then update the page, set `last_updated`, and ask for a new `refresh_by` (3 months or 6 months from today).

## 3. Add notes for a client type

Inputs to look for: which client types the member serves (`client_categories`) and what they say about this area for each. Ask only for the types the member names.
Build short notes under the sections where they belong (usually "What Buyers, Renters, and Investors Should Ask" and "What Sellers and Landlords Should Know"), using only what the member told you:
- **Rentals and landlords:** features that affect leasing (parking, laundry, pet-friendly features as the member states them), how the rental market works in the area only as the member describes it (with a source and a date if there is a figure).
- **Investors:** property types and unit counts that exist in the area, who to ask for rent figures (a property manager or a rental comp report the member supplies). No returns or yields.
- **Commercial:** the kinds of space and uses that exist, the questions for the planning office, and the member's own deal history if they share it. No rates from memory.
- **Land and new construction:** the builders and communities the member works with (by name as they give them), questions to ask the planning office, utility providers, and the builder. No buildability, costs, or timelines.
- **55+ communities:** the community's name and its amenities from its own documents. Never describe residents, and never state or imply who belongs there.
- **Luxury:** features, privacy practices the member follows, and what is public only as the member says.
- **Relocation:** how to get around, what to verify before moving (with the official source categories), and what the member can show by video.
If the member gave nothing for a client type, ask one question, and otherwise leave it out and say so.

## 4. The where-to-verify sheet

Inputs to look for: every fact marked "Needs verification" or with no source.
Build a table: Fact | What to verify | Kind of official source | The question to ask | Who checks (the member or the member's office). Use these kinds of source, and let the member supply the actual names and links:
- **Prices, sales pace, and days on market:** the member's own MLS report (with the date).
- **Property taxes and assessed values:** the county's appraisal or assessor office.
- **Zoning, permitted uses, setbacks, and permits:** the city or county planning office.
- **School assignment:** the school district's own address lookup. Never rate schools.
- **Safety:** the local police department's public data. Never characterize safety.
- **Flood and drainage:** the official flood map and the floodplain administrator for the county or city.
- **Utilities and providers:** the utility companies that serve the address.
- **HOA fees and rules:** the association's own documents.
- **Drive times and routes:** a map the member checks at the times they choose (the member's own check, with the date).
Add a column for the date checked and the member's note, and offer to update the page as items are checked. State no agency name, program, or figure from memory.

## 5. Content angles and a Living in guide outline

Inputs to look for: the fact file (use only facts with a source and a date, or mark the angle "verify first").
Build:
1. **10 content angles** (posts or short videos), each tied to a fact or feature on the page (a park, a route, a seasonal quirk, a street feature, a local event), with the fact it uses. No angle about who lives there, and none that rates schools or safety.
2. **A "Living in [Area]" guide outline** for the member's website: sections (the place, the homes, getting around, things to do, seasonal notes, questions to ask before buying or selling here, how to verify what matters to you with official sources), each with the facts it draws on. The final line of the guide says to verify every detail with the official source, and the page ends with the disclosure line.
3. **5 short video hooks** for this week, each a fact the member can show on camera, written in the member's voice.
Every piece is a draft and goes through the Fair Housing scan. For the finished copy, point to /hi5-social, /hi5-blog, /hi5-website, and /hi5-seo.
