# The Nine Jobs

Used by `SKILL.md`. For every job: scan first (the profile, the Compliance page, earlier Marketing Hub rows such as funnel pages and earlier ad packs, and what the member pasted), ask only about what could not be found, and point to what you found. Every ad line goes through the Fair Housing scan, follows `meta-housing.md`, and ends with the disclosure line. Every pack ends with the launch checklist and "Check Meta's current policy before you launch." Never invent a number, a result, or a proof point. If something important is still missing after the scan, ask up to 3 questions before writing.

Each ad pack includes a **graphics brief** and an optional Canva build (see the end of this file).

---

## Plan

### 1. Campaign brief and setup sheet
Inputs to look for: the goal (home value requests, listing showings, buyer or relocation leads, or brand awareness), the offer and the destination link, the member's market, the budget and dates (only as the member gives them), and the platform.
Build:
1. **A one-page brief:** the goal, the one offer, the one message, the area served and the radius (at least about 15 miles, or a city or county), the destination, the follow-up plan, and how the member will judge results using their own numbers.
2. **A setup sheet** with numbered steps for the member to follow in Meta Ads Manager, never assuming menu names (say "look for" and ask for a screenshot if the screen is different): choose the objective that matches the goal, declare the Housing Special Ad Category, set the location as a radius or a city or county with no ZIP codes, leave age and gender at their widest settings, do not choose lookalike audiences, add the ads and the destination, and review before publishing. Say plainly that the member makes every setting change and that this skill cannot see or change their account.
3. **An optional customer-list audience step,** only if the member wants one: use their own contacts (for example all past clients or all sphere contacts who agreed to marketing), never a slice by a protected trait, and confirm in Ads Manager that a customer-list audience is available for the Housing category before using one. Never state the policy as fact.
4. **The launch checklist** from `meta-housing.md`.
5. **What to track:** the member's own numbers (spend, clicks, leads, appointments) in a simple table the member fills in. Never state a benchmark.
Offer the ad pack for the offer next.

---

## Ad packs

### 2. Seller ads
Offer one of three campaigns:
- **A home value campaign.** A free home value update or a CMA offer for homeowners in the area. 
- **A 30-day neighborhood expert campaign.** Ads cannot be targeted to one neighborhood, so the creative names the place and the member's local knowledge, with the radius set at the area served. A calendar of 4 weekly themes (a local market note using numbers the member provides with their source and date, a recent sale only where the MLS and brokerage rules allow it, a local tip, and a home value offer).
- **An expired-seller offer.** Ads cannot reach owners whose listings expired, and copy must not assert something about the viewer. Write it as an offer about a different approach ("How [Member] markets a home differently"), with the member's one concrete fix and public proof, and never "your listing expired" or "tired of waiting?". The matching letter to a specific owner belongs in /hi5-re-prospect.
Deliver, for the chosen campaign: 3 primary text variations (under 125 words each, each leading with a different angle: the offer, the member's approach, and a local detail), 3 headlines under 40 characters, 3 descriptions under 30 characters, a call to action name, the destination and the landing page headline it must match, the audience setup notes (radius, Housing category, no lookalikes), and a one-line test plan (which angle to compare), using only variations of copy, not people.

### 3. Listing and open house ads
Inputs to look for: the listing details the member gives (features, price, beds and baths, lot, photos they own), the showing dates or open house time, and the destination.
Deliver: 3 primary text variations that lead with different features (never the same feature twice in the pack), headlines and descriptions, a call to action, and a single "request a showing" destination note. Describe only what the listing facts show. Never state school, crime, or appreciation claims, and never describe who the home suits. If the listing is for rent, write it as a Housing ad that describes the unit and the written application process, with no tenant preference. Follow the MLS and brokerage rules on listing data and photos, and `coming_soon_policy` if the listing is not yet active. Add the Fair Housing and category checklist.

### 4. Buyer and relocation ads
Inputs to look for: the lead magnet (a buyer guide or a relocation guide, built with /hi5-funnel or /hi5-email if the member has one), the market, and the destination.
Deliver: 3 primary text variations, headlines, descriptions, a call to action, and the guide's opt-in page headline it must match. The copy describes the guide and the market (the homes, the process, the area's amenities from the member's own facts), never who the guide is for. Relocation ads name the area as a place. No school or safety claims, and no claims about the people. The opt-in page asks for texting consent only through the member's own consent checkbox, and the member's form is where `consent_source` is recorded.

### 5. A retargeting sequence
Inputs to look for: what the person engaged with (the member's valuation page, a guide, a video, or the member's page), the next step the member wants, and the destination.
Build a 3-stage sequence (a reminder of the offer, a proof or story from the member's public proof, and a direct invitation), with 2 variations of copy per stage and a suggested pause between stages. The audience is limited to people who engaged with the member's own pages, posts, forms, or videos, and the member confirms in Ads Manager what Meta allows. No lookalikes and no list segmented by a protected trait. If the member wants to include their own contact list, give the optional customer-list audience step from job 1 with the same warning.

### 6. Google search ads
Inputs to look for: the service (seller valuation or listing agent, buyer agent, or rentals), the market, and the destination.
Deliver: two ad groups (for example high-intent "sell my home" searches and "home value" searches), 15 headlines under 30 characters and 4 descriptions under 90 characters per group, a keyword list with match types, a negative keyword list (for example job and "for rent" terms when not renting), and the landing page headline each group must match. Never state cost per click or a benchmark. Tell the member to check Google's current policy for housing ads and to confirm the location settings. The copy follows the same Fair Housing rules, and never targets or excludes by a protected trait.

---

## After the click

### 7. The 5-minute follow-up for ad leads
Inputs to look for: the lead sources (a Meta lead form, a landing page, or Google), the lead types (seller valuation, listing inquiry, or buyer), what the ad offered, the member's call hours, and who follows up (the member, an assistant, or a team). Read the CRM Map for `consent_source` and the form's consent checkbox.
Build:
1. **Gate every touch** with `../../hi5-re-sphere/references/touch-rules.md` and show the result: a lead form with a texting consent checkbox that was checked counts as consent from that form's submission, and a form without one, or an unknown, means no text (email, and a call only if the number was scrubbed per the member's own confirmation). Say once that Meta lead forms may need the consent checkbox added by the member in Ads Manager and that the member confirms the form's wording with their broker.
2. **Minute 0 to 5:** an instant email that delivers what they asked for, a text that references the exact offer (only where the gate passes, 8am to 9pm in their time zone, otherwise queued for 8am), and a call opener under 30 seconds with 2 qualifying questions.
3. **A 14-day sequence:** a table of Day, Channel, and Message (under 80 words each). Each touch adds value or asks one easy question. Stop on a reply, a booking, or a stop request.
4. **Rules for the member's team:** respond to opt-outs immediately, and never message a lead who says to stop.
Offer to set it up as a workflow outline (trigger, waits, messages, which steps create a task) for /hi5-re-crm job 10 after the member's OK, and to log the lead with /hi5-re-crm job 3.

---

## Improve

### 8. The weekly ad review and creative tests
Inputs to look for: the numbers the member pastes by ad (spend, impressions, clicks, CTR, leads, appointments), the date range, and the member's own targets. If the member did not paste numbers, ask for them and do not estimate.
Deliver:
1. A scorecard table by ad: the numbers as given, a verdict (kill, keep, or scale), and a one-line reason. Judge on appointments when the member has them, not only leads.
2. A fatigue check: ads with rising frequency or cost and falling CTR, only if the numbers show it.
3. What is winning and why, in terms of the angle, hook, and format.
4. Next week's plan: what to pause, what to keep, and 3 creative tests (one change per test), using copy and creative variations only, never audience traits.
5. Sample size: if there are few clicks or leads (the member's own judgment, ask if unsure), say the data is too thin to decide and recommend waiting. Never state a benchmark or a "good" cost.
Offer to save the review as a row.

### 9. Audit an ad or a page I already have
Inputs to look for: the ad text, the headline, the image description or the image itself, the destination page text, and the settings the member describes.
Deliver: a pass or fail against the launch checklist, every Fair Housing and category issue found (quote the line, say why, and give the fix), a rewritten version of each flagged line, an ad-to-landing-page match check (does the page deliver what the ad promised), and a short list of the 3 changes that matter most. If the member's settings use age, gender, ZIP, or lookalike targeting, say it conflicts with the Housing category limits and give the compliant setting, without describing a workaround.

---

## The graphics brief and the optional Canva build
For every ad pack, write a brief: the image idea for each ad (a home, a place, a map of the area, or the member), one headline per design, the brand colors and fonts from the profile or the member's Canva brand kit, minimal text over photos with strong contrast, the brokerage name and the short disclosure at a readable size, and the sizes needed for the placements the member chose. Images show homes, places, and the member, and never stage a type of resident. Use only photos the member owns or has permission to use.
**Optional Canva build.** If the Canva connection is available in this session and the member wants it, show the planned headline and text for each design and wait for their OK. After the OK, create them as drafts in the member's own Canva account and give the link for each. Never publish, share, or export without a further OK. Say the Fair Housing scan covered the text, not the member's photos.
