# The Brief

Used by `SKILL.md` Step 1. Fill every field from the Master Profile, the Compliance page, the saved offers, and what the member has already said. Ask only what is still missing, one question at a time, with 3 to 5 lettered options where there is a choice. If the member says "just write it", pick sensible defaults, state them in one line, and continue.

## Fields

**1. Goal.** One of: sell, book a call or appointment, nurture, welcome or onboard, re-engage, remind (an event or a deadline), ask for a review or referral, or announce.

**2. Audience and segments.** Who gets this. If the list has groups that need a different opening (past buyers, past consult clients, content followers), name them. One core email plus a one or two line opener per segment is the default. Never invent what a person said or did. Use only what is in the CRM notes or what the member gives.

**3. List temperature.** Cold, warm subscribers, engaged followers, past consult or call, past buyers, current customers, or inactive.

**4. Relationship.** How they found the member, and what they already bought or did. This decides the opening ("I remember you") and the length.

**5. The offer** (read `offers` first). Name, what it is in one line, price, payment options, deadline with the time zone, each bonus with its real end date, guarantee or refund terms exactly as written, and the link. A missing item becomes a placeholder, never a guess. A free offer says "Free" instead of [PRICE]. Missing guarantee terms become [GUARANTEE: paste terms].

**6. Next tier.** A higher-touch or done-for-you option and its link, read from `offers`. If the member's profile defines an upsell rule, apply it as written. If there is none, do not add one.

**7. Allowed proof.** Which results, names, and quotes the member may use, and whether each is named, permitted, and public. Anything else is [PROOF NEEDED].

**8. Constraints.** Compliance categories that apply (`offer_categories`), and words or topics to avoid.

**9. Sending.** The platform or CRM, the audience's time zone, the start date, and the number of emails (or "recommend").

**10. Formatting style (ask every campaign).** Offer these as lettered options, with the member's last choice for this segment pre-selected (read `email_format_by_segment` from the Master Profile):
> A) Plain note: minimal formatting, a personal one-to-one feel
> B) Light formatting (recommended): bold 2 to 4 key phrases, an italic P.S., real bullets for lists of 3 or more, short labeled sections when an email has more than one part
> C) Designed newsletter: section headers, bold labels, bullets, clear visual blocks
Recommend A for personal check-ins, review asks, win-backs, and last-call reminders, and C for digests and newsletters. B is the default for everything else.

**11. Emojis (ask every campaign).**
> A) None
> B) A few where they fit (subject or section labels, at most 3 per email)
> C) Subject line only
The right choice changes with the audience, so ask both questions every campaign, even when a saved choice exists. The member can override one email ("no emojis on this one").

**12. Email platform.** GoHighLevel, Mailchimp, Constant Contact, Klaviyo, Gmail, or other. Read `email_platform` first, then `crm`. Ask only if both are missing, then save it as `email_platform`.

## Audience check
If `agent_facing_offers` is yes, or the member sells to other businesses, write for business owners (time saved, revenue process, proof from similar businesses). Otherwise write for the consumers the member serves.

## The Brief (show this before planning)
> **Brief**
> Goal: ...
> Audience and segments: ...
> List temperature and relationship: ...
> Offer: name, price, deadline (with time zone), bonuses and end dates, guarantee as written, link
> Next tier: ... (or none)
> Proof allowed: ...
> Constraints: ...
> Sending: platform, time zone, start date, number of emails
> Format: formatting style (A, B, or C) and emojis (A, B, or C) for each segment, with the pre-selected last choice marked
> Assumed: (anything you defaulted, one line)
> Placeholders so far: [PRICE], [DEADLINE: ...], [LINK: ...], [PROOF NEEDED] as needed
