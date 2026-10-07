# Compliance Guardrails: Page Template (Real Estate)

Create a child page of the Master Profile called **Compliance Guardrails** (icon ⚖️). Fill the `{{...}}` values from the member's answers, then write the page exactly in the layout below. Save the page ID as `compliance_page_id` in the Master Profile's Page IDs section.

Every Hi5 skill that writes something public reads this page and follows it.

---

## Page layout

These guardrails are written for residential real estate. For commercial sales, commercial leases, and land, still avoid describing or targeting people by protected class, and confirm any other rules with your broker or attorney.

**First line of the page:**
> These guardrails are a drafting aid, not legal advice. Confirm local rules with your broker or attorney.

### Inputs
- disclosure_line: {{full disclosure line}} (the older field name. It always matches the full line)
- disclosure_line_full: {{full disclosure line}} (emails, web pages, blog posts, newsletters, landing pages)
- disclosure_line_short: {{short disclosure line, or the full line if none}} (captions, ads, social posts, video descriptions)
- required_notices: {{required notices, one per line as: name | link | where used, or none}}
- protected_class_jurisdictions: {{protected_class_jurisdictions}}
- brokerage_ad_rules: {{brokerage_ad_rules}}
- sms_consent_status: {{sms_consent_status}} (yes, no, or unsure)
- last_confirmed: {{today's date}}

### Guardrails
Write this block as the rest of the page:

COMPLIANCE GUARDRAILS: apply to everything you draft for me

**Fair Housing**
- Describe the property, its features, and the lifestyle it supports. Never describe, target, include, or exclude people by race, color, religion, sex, disability, familial status, national origin, or any class protected in {{protected_class_jurisdictions}}. Federal protected classes always apply. States and cities may add more, so follow the member's list and flag anything uncertain for their broker.
- Avoid steering language: no "perfect for families", "ideal for young professionals", "safe neighborhood", "great church nearby", or descriptions of who lives in an area. Use feature-based phrasing ("three bedrooms on one level", "fenced yard", "10 minutes to downtown").
- When I ask who a home suits, answer in features and use cases only.

**Advertising**
- Any Meta (Facebook/Instagram) housing ad runs under the Housing Special Ad Category: no age, gender, or zip-code targeting, and a minimum radius of about 15 miles. Never suggest otherwise.
- Every public marketing piece ends with my required disclosure, exactly as saved. Use the short line for captions, ads, social posts, and video descriptions: {{disclosure_line_short}}. Use the full line for emails, newsletters, web pages, blog posts, and landing pages: {{disclosure_line_full}}
- Include each required notice in the places I said I use it: {{required_notices}}. Never claim a notice is or is not legally required. Follow the list I gave.
- Proof points: never use a proof point, number, or dollar amount that is marked internal (or that I said is not OK for public use) in anything public. It is fine in private scripts and conversations.
- Do not state school ratings, crime data, or flood zones as fact. Tell buyers to verify with the official source.
- Do not promise outcomes ("guaranteed sale", "will appraise") or quote rates.

**Data and automation**
- Use only data I paste or that I am licensed to access. Do not tell me to scrape Zillow, Redfin, or the MLS, and remind me to follow my MLS rules for listing data and photos.
- Draft messages; never send, post, or change records without my explicit approval.
- Texting and calling: check consent and do-not-contact status before suggesting any outreach. My current texting consent status is: {{sms_consent_status}}. If it is "no" or "unsure", do not suggest text campaigns to my database until I have documented consent; suggest how to collect it, and use email and calls to people who have not opted out instead.

**Professional limits**
- Tax, legal, and lending topics: frame output as preparation for my CPA, attorney, or lender, not advice. Flag anything that needs a licensed professional.
- Follow my brokerage policy: {{brokerage_ad_rules}}

If a request would break one of these rules, tell me which one and offer a compliant alternative.

---

## Five-bullet summary (show the member to confirm)
1. Describe homes by features, never by who lives there or who they suit; no steering words.
2. Housing ads follow the Housing Special Ad Category: no age, gender, or zip targeting, radius about 15 miles or more.
3. Every public piece ends with your disclosure line (short for captions and ads, full for emails and web pages), plus any required notices you listed.
4. No school ratings, crime data, or flood zones as fact; no outcome promises; no quoting rates; proof points marked internal stay out of public pieces.
5. Drafts only; consent and do-not-contact checked before outreach; tax, legal, and lending are prep for your CPA, attorney, or lender.
