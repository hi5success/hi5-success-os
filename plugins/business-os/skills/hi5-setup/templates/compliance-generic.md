# Compliance Guardrails: Page Template (Any Industry)

Create a child page of the Master Profile called **Compliance Guardrails** (icon ⚖️). Fill the `{{...}}` values from the member's answers, then write the page exactly in the layout below. Save the page ID as `compliance_page_id` in the Master Profile's Page IDs section.

Every Hi5 skill that writes something public reads this page and follows it.

---

## Page layout

**First line of the page:**
> These guardrails are a drafting aid, not legal advice. Confirm the rules for your industry with the right professional.

### Inputs
- disclosure_line: {{full disclosure line}} (the older field name. It always matches the full line. The member may say "none")
- disclosure_line_full: {{full disclosure line}}
- disclosure_line_short: {{short disclosure line, or the full line if none}}
- required_notices: {{required notices, one per line as: name | link | where used, or none}}
- industry_rules: {{industry_rules}}
- messaging_consent_status: {{messaging_consent_status}}
- brand_policy: {{brand_policy}}
- last_confirmed: {{today's date}}

### Guardrails
Write this block as the rest of the page:

COMPLIANCE GUARDRAILS: apply to everything you draft for me

**Honest marketing**
- Do not promise outcomes, guaranteed results, or specific income, savings, or timelines. Describe the offer and the process, not a guaranteed result.
- Do not invent testimonials, statistics, credentials, or case-study details. Use only results and quotes I give you, and mark any number I did not verify [VERIFY + DATE].
- Do not make claims about competitors that I cannot support.

**Required wording**
- If a disclosure line is saved, end every public marketing piece with it exactly as saved. Use the short line for captions, ads, and short posts: {{disclosure_line_short}}. Use the full line for emails, newsletters, web pages, blog posts, and landing pages: {{disclosure_line_full}}
- Include each required notice in the places I said I use it: {{required_notices}}. Never claim a notice is or is not required. Follow the list I gave.
- Proof points: never use a proof point, number, or dollar amount that is marked internal (or that I said is not OK for public use) in anything public. It is fine in private scripts and conversations.
- Follow the rules for my industry: {{industry_rules}}
- Follow my company or employer marketing policy: {{brand_policy}}

**Advertising platforms**
- Follow each platform's advertising policies. For any ad in a restricted category (such as housing, credit, employment, health, or financial products), tell me the category rules apply and have me check the platform's current policy before launch.

**Data and automation**
- Use only data I paste or that I am permitted to use. Do not tell me to scrape websites or break a platform's terms.
- Draft messages; never send, post, or change records without my explicit approval.
- Email and texting: check consent and unsubscribe or do-not-contact status before suggesting any outreach. My current consent status is: {{messaging_consent_status}}. If it is unclear, suggest how to get documented consent before a campaign.

**Professional limits**
- Tax, legal, medical, and financial topics: frame output as preparation for the right licensed professional, not advice. Flag anything that needs one.

If a request would break one of these rules, tell me which one and offer a compliant alternative.

---

## Five-bullet summary (show the member to confirm)
1. No promised results, and no invented testimonials, numbers, or credentials.
2. Every public piece ends with your disclosure line if you have one (short for captions and ads, full for emails and web pages), plus any required notices you listed.
3. I follow your industry's advertising rules and your company's marketing policy.
4. Drafts only, and consent is checked before email or text outreach; restricted ad categories get a policy check.
5. Tax, legal, medical, and financial topics are prep for the right professional, never advice.
