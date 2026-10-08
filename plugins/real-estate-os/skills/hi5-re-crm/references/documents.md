# Reading a Contract or a Lease

Used by `/hi5-re-crm` (job 5) and `/hi5-re-transaction` (job 1). One source for how every real estate document is read, so deadlines and parties are extracted the same way everywhere. Read `guardrails.md` too. Scan first: use what the CRM and the profile already hold (the opportunity, the transaction fields, the contacts, the notes) and only ask about what the document and the record do not answer.

## Step 1: Name the document
Purchase contract, listing agreement, buyer representation agreement, lease (tenant side or landlord side), property management agreement, commercial letter of intent or lease, land contract, new construction contract, a 55+ or age-restricted community resale package, or an addendum or amendment to any of these. Say which side the member represents and the client type (buyer, seller, tenant, landlord, investor, commercial, land, relocation, 55+, luxury).

## Step 2: Extract, with the page or section for every item
Never extract an item without saying where it came from.

### Purchase contract or listing agreement
- Parties (names only; emails and phones only if printed), the property address, price, earnest money, option or due diligence fee.
- **The contract (effective) date** and how the document defines it.
- **Every deadline the document states:** option or inspection period, inspection or due diligence, repair request or response, financing, appraisal, title commitment and survey review, HOA or community document review, sale of another property, and closing. Also the possession date, and any leaseback.
- Financing type, lender, title or escrow company, co-op agent, and the special terms and addenda.

### Lease (tenant side or landlord side)
- Parties, the premises, lease start and end, rent amount and due date, deposit amount (never bank details), renewal and notice dates, and special terms such as late fees, a pet policy or assistance animal terms as written, and utilities.
- Do not record the number of occupants or anything about the household.

### Commercial letter of intent or lease, or a land contract
- Parties, the property, the term or due diligence period, the rent schedule or price, options and renewal dates, notice dates, contingencies (zoning, survey, environmental, financing), and the closing date.
- Always add: attorney review.

### New construction contract
- The builder, the lot and plan, price, deposits, selections deadlines, the stage milestones the contract lists, the builder's estimated completion date (an estimate, never a promise), warranty terms as written, and closing.

### 55+ or age-restricted community resale
- The community's approval steps and timeline, transfer and monthly fees, and the resale documents. Eligibility is the community's own process. Never guess or screen anyone by age.

## Step 3: Dates
- **Compute a date only when the document states the rule,** and show the math (for example "effective date October 1 plus 7 days is October 8").
- **Business days or calendar days.** Take it from the document. If the document does not say, or it is unclear, put it on the "Needs confirmation" list. Never assume.
- Weekends and holidays: apply the document's rule only. If it is silent, say "confirm with the contract and your broker".
- Time of day: record a deadline's time if the document states one.
- **Needs confirmation.** List every ambiguous or missing item with the paragraph the member should re-read. Never guess.
- Never record a date from an email or a text as final if it changes a contract. A written amendment is needed.

## Step 4: Leave out
Social Security and tax ID numbers, bank and card numbers, driver's license numbers, dates of birth, and passwords. Say so in one line when you leave something out.

## Step 5: End every extraction with
"Confirm every date against the executed document. This is not legal advice." Leases and commercial or land documents also need attorney review.
