# Compliance by Industry

Used by `SKILL.md`, every build step, and Audit mode. The funnel follows the rules for the member's offer, loaded from their profile. These are working guardrails, not legal advice. When anything is uncertain, say so and send the member to the right professional.

## Step 1: Work out which rules apply
Read `offer_categories` from the Business section of the Master Profile. If it is missing, ask once and save it:
> "Does your offer involve any of these? Pick all that apply: health or medical results, income or earnings, housing or real estate, credit or loans, a job or career opportunity, or social issues, elections, or politics. Or none of these."
Also read `industry`, `industry_rules`, `brand_policy`, `disclosure_line_full`, `disclosure_line_short`, and `required_notices` from the Compliance Guardrails page. The member's own rules always apply on top of these.

## Rules for everyone: endorsements and testimonials
- Testimonials, reviews, and results must be real, from real customers, shown with their permission, and honest about their experience. Never write, buy, or fake one.
- If a result is not what most customers get, say so clearly next to the claim, or show what is typical instead.
- Disclose any connection that could affect how much weight a reader gives an endorsement: payment, free product, a commission or affiliate link, or a relationship. Put the disclosure close to the claim, in plain words.
- Never gate reviews (only asking happy customers) or offer rewards for reviews.
- Every claim needs support the member can show. Mark anything unsupported `[PROOF NEEDED]`.
- Proof marked internal never appears in a public asset.

## Health and wellness (including medical spas and clinics)
- No health or medical outcome claims. Do not promise or imply that a service will treat, cure, prevent, or fix a condition, or produce a body or health result.
- Do not speak to a person's health condition or body as if you know it ("Are you struggling with...").
- Do not use before and after claims about results. Describe the experience, the process, the practitioners, and what a visit involves instead.
- Testimonials describe the experience of the service (communication, comfort, care), not health outcomes.
- Send medical questions to a licensed professional. Include the practitioner's license details the member gives in the disclosure.
- Meta limits what health ads can say and show. Have the member check Meta's current policy before launch.

## Coaching, business opportunities, and anything that implies earning money
- No income or earnings claims, and no implied ones such as lifestyle imagery, unless the member supplies the figures themselves and marks them public.
- If figures are used, show who got them, what they did, over what period, and add a disclaimer line. Offer this default for the member to approve or change: "These figures are examples, not a promise or a typical result. Results depend on your effort, your market, and your circumstances."
- Describe what the member teaches or provides, not what the buyer will earn.
- Never invent a figure, a case, or a testimonial.
- Do not name a company the member did not name.

## Housing, real estate, and rentals
Housing and real estate rules live in `industries/real-estate.md` and load only for real estate members. They include Fair Housing language rules and the Housing Special Ad Category for sales, rentals, and related offers.

## Credit, loans, and financial products
- Do not state rates, terms, approval odds, or what someone will qualify for.
- Send credit and lending questions to a licensed lender. Include the member's license details in the disclosure.
- These ads fall under a Meta Special Ad Category (see `meta-special-categories.md`).

## Job and career opportunities, and recruiting
- An ad that offers a job, a career, or a place on a team (including recruiting agents) falls under the Employment Special Ad Category (see `meta-special-categories.md`). The income rules above apply too.

## Social issues, elections, and politics
- These ads need Meta's authorization and a "paid for by" disclaimer. Tell the member, point them to Meta's current process, and keep the content factual.

## Legal, tax, medical, and financial topics
- Write them as preparation for the right licensed professional, never as advice.

## Always
- The disclosure line: every page and email ends with `disclosure_line_full` plus any `required_notices` the member uses on the web. Ads use `disclosure_line_short` where there is room, or link to a page that carries the full line. Never say whether a notice is legally required.
- Texting: collect a phone number only if the member has documented consent (`sms_consent_status` is yes) and the form carries a consent checkbox with the member's wording. Otherwise the funnel is email only.
- Urgency and scarcity must be real.
- Drafts only. Never send, publish, post, or connect to an ad account.
