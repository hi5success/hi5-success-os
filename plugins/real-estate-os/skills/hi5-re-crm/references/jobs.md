# The 14 Jobs

Used by `SKILL.md`. Every job follows the guardrails file: read first, show the plan, wait for the member's OK, then write, then confirm. In paste mode the "write" is a CRM update sheet (see `other-crm.md`). Ask only for inputs the member has not given and the CRM Map does not answer. Every job names fields in the member's words from the CRM Map. If there is no CRM Map yet and the route is a connector, run job 2 (read only) first.

Every job works for every client type: buyers, sellers, renters, landlords, investors, 55+ communities, luxury, relocation, new construction, commercial, and land. Use the member's own pipelines and tags for each type. If a client type has no pipeline, say so and offer the closest pipeline, and never create one without the member's OK.

---

## Connect and map

### 1. Test my connection (read only)
Follow "Connection check" in `ghl.md`, or the connector check in `other-crm.md`.

### 2. Map my CRM (read only, then save)
1. Read pipelines with every stage in order, custom fields (contact or opportunity, with type), tags, calendars, users (names only), and workflows (name and status) if visible. Never fill a section that comes back empty. Write "None found".
2. Check each client type in `client_categories` against the pipelines and tags, and list the types with none.
3. Draft the CRM Map using `templates/crm-map.md`, plus a "Gaps I noticed" list and a "Could not read" list. Show it to the member.
4. After their OK, save it as the CRM Map page and set `crm_map_page_id`, `crm_connection`, and `last_crm_map` (today). Offer to turn the gaps into a fix plan, ordered by impact, saying which fixes Claude can make and which the member makes in the CRM. Change nothing yet.

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
