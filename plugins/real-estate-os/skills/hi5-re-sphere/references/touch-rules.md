# Touch Rules

Shared by `/hi5-re-sphere` and `/hi5-re-prospect`. Read it with `../../hi5-re-crm/references/guardrails.md` (section 2 is the base rule) before you draft any message, call script, or visit plan. Every touch to one person passes this gate before you write it, and the result is shown on the touch, for example "Text: consent found, outside window until 8am".

## The gate, per channel

| Channel | Check before you draft | If it fails |
|---|---|---|
| **Text** | 1. Consent, read from the member's `consent_source` on the CRM Map (for a form, the contact's own submission; for a tag, field, or note, that record; unknown or paste mode means ask the member). Consent captured earlier counts. 2. Not do-not-disturb, unsubscribed, or marked STOP. 3. Inside 8am to 9pm in the person's own time zone. 4. A2P reminder, once per session, if texting through GoHighLevel or another business texting service. | Do not draft the text. Offer email, mail, or a call instead and say why in one line. |
| **Call or voicemail** | 1. The member confirms the number was scrubbed against the National Do-Not-Call Registry, the state list, and their own internal opt-out list. For a list from a data vendor or a contact in the CRM, the member says so in this conversation, and you note the date they gave. 2. Not on the member's internal do-not-contact list or marked do-not-disturb. 3. Inside 8am to 9pm in the person's time zone. 4. No automated, prerecorded, or artificial voice calls or texts without prior express written consent. | Do not write a call script or voicemail. Offer mail or email instead. |
| **Email** | The person is not unsubscribed or marked do-not-disturb. The email carries the disclosure line, the member's physical address if the member's email platform requires it, and the member's normal unsubscribe line. | Skip the person and list them. |
| **Mail (letter or postcard)** | The person is not on the member's internal do-not-contact list. Follow `brokerage_ad_rules` for any piece that advertises. Never claim to be a neighbor, a buyer, or anyone the member is not. | Skip the person and list them. |
| **Door knock** | The member checked local solicitation rules and any HOA rules. Skip any home marked "No Soliciting" or "No Trespassing". Log any "do not come back" as an internal do-not-contact request. | Skip that address. |

## Rules for every touch
- **Unknown means no.** Unknown consent, unknown scrub status, or an unknown time zone means no text and no call. Offer a channel that passes. Never ask the member to "assume it's fine".
- **The member decides existing relationship questions, not you.** Never say a past client, a lead, or a person who replied once may be called or texted without a check. Say "confirm this with your broker" and run the gate.
- **A call is not a text.** A scrub confirmation covers calls only. It never counts as texting consent.
- **Opt-outs are immediate.** If a person says stop, do not call, or do not contact me (in any channel), draft nothing more to them. Offer to mark them do-not-disturb in the CRM, which needs the member's OK, and add them to the member's internal do-not-contact list. Never draft a reply that argues or asks them to reconsider.
- **Honest identity.** Every touch says who the member is and which brokerage they are with. Never imply an existing relationship that does not exist, never use fake urgency, and never state that a person "must" act.
- **No scraping and no lists from unknown sources.** Never gather contact information from a listing site, a social platform, or an MLS in bulk. Use only the member's CRM, a list the member brought from their own data vendor, or what the member typed or pasted. This skill never skip traces.
- **Contact data in the chat only.** Do not save phone numbers, emails, or addresses of people who are not already in the member's CRM into Notion. A Marketing Hub row holds the plan and the message text with placeholders, never a list of people.
- **One batch, one OK.** Show a plan table (Person, Channel, Gate result, What happens). Nothing is written, logged, drafted into Gmail, or sent until the member says OK for that batch. Sends follow `/hi5-re-crm` job 11 (one message, one person, exact text approved).
- **Say what you skipped and why,** in one line per group, for example "Skipped 4: 2 marked do-not-disturb, 2 with no consent source for text (I drafted emails for them)".
- This is a checklist, not legal advice. Confirm consent, scrub, and calling rules with the member's broker.
