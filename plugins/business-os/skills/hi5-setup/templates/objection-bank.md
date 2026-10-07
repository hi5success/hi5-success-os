# Objection Bank: Page Template (Real Estate)

Create a child page of the Master Profile called **Objection Bank** (icon 🛡️). Save its ID as `objection_bank_page_id` in the Master Profile's Page IDs section.

The page is grouped by client type. Each client type has starter objections written by Hi5 in `objections/<client type>.md`. Load only the files for the client types the member works with. For a client type with no file (the member typed "other"), build the objections from what the member tells you, using the same five parts.

---

## Page layout

**First line of the page:**
> Use these as starting points, in your own words. No pressure tactics, no fear language, no promises about price or timing.

### Inputs
- client_types_covered: the client types that have a section on this page
- proof_points: what the member supplied. Write each one as `text (public)` or `text (internal)`
- last_updated: {{today's date}}

### The bank
One heading 2 per client type, in the order the member chose. Under each heading, a numbered list. Every objection has these five parts, in this order:
1. **What's usually behind it**: the real concern, in one line
2. **Clarifying question to ask first**
3. **My response**: 3 to 5 sentences, in the member's voice. Acknowledges the concern, adds one specific proof point, and ends with a low-pressure next step
4. **Text version**: one line
5. **What NOT to say**

Start each client type with the Hi5 starter objections for that type, then add the objections the member says they hear most, written the same way.

## Starter files

| Client type | File |
|---|---|
| Sellers | `objections/sellers.md` |
| Buyers | `objections/buyers.md` |
| Renters and tenants | `objections/renters.md` |
| Landlords | `objections/landlords.md` |
| Investors | `objections/investors.md` |
| 55+ communities (active adult communities) | `objections/55-plus-communities.md` |
| Luxury | `objections/luxury.md` |
| First-time buyers | `objections/first-time-buyers.md` |
| New construction | `objections/new-construction.md` |
| Relocation | `objections/relocation.md` |
| Commercial sales | `objections/commercial-sales.md` |
| Commercial leases | `objections/commercial-leases.md` |
| Land | `objections/land.md` |

## Building a client type's section
1. Read the starter file for the client type, and its note if there is one. Follow the note.
2. Rewrite every response in the member's voice (Voice Profile page). Follow the Voice Profile default rules, including no em dashes unless the member allows them.
3. Replace each [PROOF POINT] with one specific proof point from the member's list. Objection responses are for conversations and texts, so a point marked (internal) can be used here. Mark it (internal) on the page so the member remembers not to publish it. If there is no proof point for a response, write [ADD PROOF] in that spot.
4. Add the member's own objections for this client type, written in the same five parts.

## Final check (do this before saving each client type)
- Every response has one specific proof point from the member, or [ADD PROOF].
- No pressure tactics, no fear language, and no promises about price, rates, timing, approval, or returns anywhere.
- No steering language and no descriptions of people (see the Compliance Guardrails page). Follow any note for the client type.
- Tax, legal, and lending questions are sent to the member's CPA, attorney, or lender. Nothing reads as advice.
- Each response is in the member's voice and 3 to 5 sentences.
