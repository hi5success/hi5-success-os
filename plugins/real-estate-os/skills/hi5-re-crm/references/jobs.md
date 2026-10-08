# The 15 Jobs

Used by `SKILL.md`. Every job follows the guardrails file: read first, show the plan, wait for the member's OK, then write, then confirm. In paste mode the "write" is a CRM update sheet (see `other-crm.md`). Scan first, then ask: before you ask for anything, read what is available (the CRM Map, the profile, the contact's record and recent activity through the connection, and what the member pasted). Ask only for inputs that none of that answers, and point to what you found. Every job names fields in the member's words from the CRM Map. If there is no CRM Map yet and the route is a connector, run job 2 (read only) first.

Every job works for every client type: buyers, sellers, renters, landlords, investors, 55+ communities, luxury, relocation, new construction, commercial, and land. Use the member's own pipelines and tags for each type. If a client type has no pipeline, say so and offer the closest pipeline, and never create one without the member's OK.

---

## Connect and map

### 1. Test my connection (read only)
Follow "Connection check" in `ghl.md`, or the connector check in `other-crm.md`.

### 2. Map my CRM (read only, then save)
Scan first, then ask. Never judge the CRM against a standard build.
1. **Scan everything available before you ask anything.**
   - From the CRM: pipelines with every stage and how many opportunities sit in each, custom fields (contact or opportunity, with type), tags and how many contacts carry each, forms with the fields each one holds (note any field that looks like a consent checkbox), calendars, users (names only), and workflows (name and status).
   - From the profile and saved pages: `crm`, `crm_usage`, `client_categories`, `lead_sources_ranked`, `sms_consent_status` and the notes on the Compliance Guardrails page, and any CRM Map page that already exists.
   - Anything that cannot be read goes on the "Could not read" list. Do not stop for it.
2. **Say what the scan answers**, as statements the member can correct. For example: "I see a Buyer Pipeline with 41 opportunities, so I am treating it as your buyer pipeline." Never ask a question the scan already answers.
3. **Ask only about what could not be determined**, one question at a time, each pointing to what you found. For example:
   - "I see 3 forms with a consent checkbox: Website Contact, Open House Sign-In, and Seller Intake. Which one captures texting consent?"
   - "Your profile lists renters, and I see a renter tag on 12 contacts but no renter pipeline. How do you track renters?"
   - "I do not see a source field, but a tag called ig is on 30 contacts. Is that how you track where leads come from?"
   If nothing is unclear, ask nothing. Never say a pipeline, tag, field, or form is missing.
4. **Consent source.** Start from the scan. If exactly one form, tag, or field looks like consent, confirm it ("The Website Contact form has a consent checkbox. Is that where texting consent comes from?"). If there are several candidates, ask which. If there are none, ask where consent is captured. If the member has more than one source (for example older leads, open house sign-ins, a website form), record each one in their words. In GoHighLevel consent is often stored in the form submission itself, not as a tag or a contact field. Save the answer as `consent_source` on the CRM Map. Consent captured earlier counts. Never flag a later form for lacking an opt-in when consent was captured earlier.
5. **Draft the CRM Map** using `templates/crm-map.md`: the structure you read, how the member works in their words, `consent_source`, "Differences I noticed" (neutral observations the member did not call problems), and "Confirmed gaps" (only what the member said matters to them, otherwise "None confirmed"), plus "Could not read". Show it to the member.
6. After their OK, save it as the CRM Map page and set `crm_map_page_id`, `crm_connection`, and `last_crm_map` (today). If there are confirmed gaps, offer job 15 (CRM tune-up). If there are none, say so and ask whether anything feels off. Change nothing in the CRM.

---

## Log and update

### 3. Log a new lead
Inputs: the message (pasted, or a description of a screenshot), where it came from, and anything else known.
1. Pull out name, phone, email, what they want (buy, sell, rent, lease out, invest, commercial, land, relocate), area, timeline, price or rent range, and financing or proof of funds status if stated. Only what was said. Leave out protected class details and say so.
2. Search the CRM for an existing contact by phone, then email. If one exists, plan an update, not a new record.
3. Plan: the contact fields, source, tags (client type, source, timeline), and an opportunity in the right pipeline's first stage. Add a note with the original message and the date.
4. Draft a first reply in the channel they used. Under 60 words, answer what they asked, end with one easy question. For a text, run the consent check first. If they texted first, say so. If not, draft an email.

### 4. Log an appointment or showing
Types: showing, listing appointment, buyer consult, rental showing, landlord consult, investor meeting, commercial tour.
1. Find the contact (list matches and ask if more than one).
2. Turn the member's notes into a clean note: Date, Type, Properties, What they liked, Objections, Decision timeline, Next step. Use their words, and leave out protected class details.
3. Suggest the stage to move to, with one line why. Plan a follow-up task. If no date was given, suggest one (next business day if hot, 3 days if warm, 7 if cold) and label it "suggested".
4. Draft a 2 sentence follow-up that names one specific thing from the appointment, with the consent check for a text.

### 5. Contract or lease into the CRM
Inputs: the document (PDF or pasted text), which side the member represents, and which pipeline.
1. **Name the document type:** purchase contract, listing agreement, lease (tenant side or landlord side), commercial letter of intent or lease, or land contract. Commercial documents need attorney review.
2. **Extract, with the page or section for each item:**
   - Purchase or listing: party names, property address, price, earnest money, option or due diligence fee, contract (effective) date, every deadline the document states (inspection or due diligence, appraisal, financing), closing date, financing type, lender, title company, co-op agent, and special terms or addenda.
   - Lease: parties, property, lease start and end, rent amount and due date, deposit amount, renewal and notice dates, and special terms. Do not record the number of occupants or anything about the household.
   - Commercial or land: parties, property, term or due diligence period, rent schedule or price, options, notice dates, and contingencies.
   - Include emails and phones only if printed. Leave out sensitive data (see guardrails).
3. **Dates.** Work out a date only if the document states the rule, and show the math.
4. Match the client in the CRM by email, then phone, then name. Say whether you found one, several, or none.
5. **Plan** (table): find or create the contact, the status tags, the opportunity in the right pipeline stage with value, the transaction fields, a 5 to 8 line note of key dates, and one task per deadline, due 2 days before it, titled "[Deadline name], [Address]".
6. After the OK and the writes, draft (do not send) a short email to the client: congratulations, the next three dates that matter, what they need to do this week, and who to call. Under 175 words.
7. End with: "Confirm every date against the executed document. This is not legal advice."

### 6. Sync a record from an email thread
1. Pull every fact that belongs in the CRM: contact details, lender or title company, price or rent range, timeline, preferences, deal changes, and promises either side made.
2. Show a table: Field | Current | From the email | The quote that supports it.
3. Plan a dated note (3 to 5 lines) and a task for anything the member promised.
4. If an email changes a contract date, say that a written amendment is needed and do not treat the email alone as final.

### 7. Close a deal (won)
Inputs: client, property, final price (or lease value), actual closing date, how it went.
1. Plan: opportunity to Won and the closed stage with value and dates updated, tags (remove the under contract tag, add the past client tag, keep the client type tag), and a closing note. Add personal details only if the member gave them.
2. Find the member's review request and past client workflows in the CRM Map. Say which one you would use and what triggers it. Do not enroll anyone without the plan OK. If none exists, say so.
3. Tasks: a 1 week check-in call, a 30 day "how is the home" text (only with consent), and a home anniversary reminder.
4. Record commission only if the member tracks it in the CRM and gave the number. Never estimate it.
5. Draft a thank-you and a review request. Ask for a review only. No incentives, and nothing that sounds like a condition.

### 8. Log a lost deal and plan the comeback
1. Plan: the opportunity to Lost with a reason from the member's own list, or the closest of Financing, Inspection, Appraisal, Changed mind, Chose another agent, Timing, Other. Remove the under contract tag and add a re-engage tag.
2. If they are still in the market, plan a new opportunity so the lead stays alive.
3. Write a neutral, factual note of what happened. No blame, and no personal or protected details.
4. Re-engage plan: 3 touches over 90 days, each with a date, channel, and one line of purpose, based on why it fell through. Texts only with consent.
5. Draft a short, human message: acknowledge it, take the pressure off, offer one clear next step.

---

## Schedule and send

### 9. Book an appointment
Inputs: contact, type, calendar, the day and time window, length, and place or link.
1. Check free slots and offer the 3 best. If the calendar will not return availability, say so and let the member pick a time.
2. After they pick, plan the booking: calendar, contact, start and end with time zone, title "[Type], [Client last name], [Address]", place, notes.
3. Draft a confirmation text and email: date, time, place, what to bring, how to reschedule. If the calendar already sends confirmations, say so and skip the duplicate.

### 10. Add contacts to a workflow
1. Find the workflow and say how it is triggered (direct enrollment or a tag) and, if visible, what it sends and how often.
2. Check every contact: already in it (skip), do-not-disturb or unsubscribed for the channel the workflow uses (skip and list), missing the phone or email it needs (list), and a conflicting tag such as past client entering a new lead drip (flag). Run the consent check for any text step.
3. Plan who is enrolled and how (direct enroll, or add the tag, which is the safest way through a connector), and who is skipped and why. Enroll only after the OK.

### 11. Draft and send one message
1. Read the last few messages with the contact, plus the latest note and stage, so the message fits.
2. Run the consent check for a text (see guardrails). If any answer is no or unknown, do not send. Offer an email.
3. Draft two versions. Text: under 300 characters, no links unless asked. Email: a subject and under 150 words. Each ends with one clear question or next step. Never make up listings, prices, dates, or promises.
4. Show both and wait. Send only the version the member approves, word for word, through the CRM's conversations, one message to one person, then confirm it went out. If it fails, stop and do not resend.

---

## Review and clean up

### 12. Clean up a stalled stage
Inputs: the pipeline and stage, how many days count as idle, and where stale ones should go.
1. List the opportunities in the stage with days since last activity (say which data you used).
2. Table: Contact | Days idle | Last activity | Value | Recommended action | One line reason. Group by recommended action so each group is approved at once.
3. For the re-engage group, draft one short, specific message with a merge field for the first name.
4. After the OK, make the moves in batches and report any that failed.

### 13. Pipeline value and closing forecast (read only)
1. Ask which pipelines. Ask for the member's close probability by stage. If they have none, label the ones you use "assumed".
2. Table by stage: Stage | Opportunities | Total value | Weighted value | Count with no value set. Do not estimate a value for deals with none.
3. Break the same numbers out by client type where tags allow (buyers, sellers, renters, landlords, investors, commercial).
4. Expected closings: under contract deals grouped by closing month, this month and next.
5. Estimated income only if the member gave you a rate or their saved fee details, with the math shown.
6. Risks: deals idle too long, and deals with a deadline in the next 7 days. Then 3 plain observations.

### 14. Find duplicates and missing info (report first)
1. Scope: all contacts, a tag, or created in the last 90 days.
2. Report: likely duplicates (same phone or email, or similar name with a matching phone or email) with a recommended record to keep and a confidence; contacts missing basics; open deals missing key fields; near duplicate tags.
3. Summary counts first, then the top 25 rows of each table.
4. Change nothing. If the member approves a merge or fix, show the exact before and after for that one record and wait for the OK again. If the CRM cannot merge, give the steps. Never guess a missing phone or email. Offer a short message to ask the contact to confirm their best contact info, with the consent check.

### 15. CRM tune-up
Turns the gaps the member has confirmed into a fix plan. It never judges the CRM against a standard build.
1. **Start from confirmed gaps.** Read the "Confirmed gaps" section of the CRM Map. If it is empty, or the map is old, scan the CRM again first (as in job 2), then ask short questions only about what the scan could not answer, pointing to what you found, and record what the member confirms. Do not add anything the member did not say matters to them.
2. **Build the fix plan, ordered by impact.** For each confirmed gap, one line on what it costs the member in their own terms, and the fix. Put each fix in one of two lists:
   - **Fixes I can make through the connection** (for example adding a tag, moving contacts between stages, filling a field, merging a duplicate if the connection allows it).
   - **Fixes you make in GoHighLevel** (anything the connection cannot do, such as building a form, a pipeline, or a workflow). Give numbered steps with screenshot help, and never assume menu names.
3. **Warn about side effects.** A new tag, stage move, or enrollment can fire a workflow. Say which one it might trigger before the member approves.
4. **OK first.** Show the plan for the connector fixes as a table (Record, What changes, Current value, New value), grouped by action, and wait for the member's OK on each group. Make the changes, read each back, and confirm what changed and what did not.
5. **Update the CRM Map.** After a fix, offer to update the CRM Map page (moving the gap out of "Confirmed gaps" and noting the change). Save only with the member's OK.
6. Nothing in this job creates a pipeline, a form, a field, or a workflow without the member's OK, and it never deletes anything.
