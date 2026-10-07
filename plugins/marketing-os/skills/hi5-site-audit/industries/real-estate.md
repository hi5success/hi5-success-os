# Hi5 Site Audit: Real Estate Flow

Used by `SKILL.md`. Real estate members work with many kinds of clients, so audit against the client types in `client_categories`, not only listings.

## Pages to expect
- A home page, an About page, and a Contact page
- A page for each client type the member serves: buyers, sellers, renters, landlords, investors, 55+ communities, luxury, first-time buyers, new construction, relocation, commercial, and land
- Neighborhood or area pages for the areas in `primary_market` and `surrounding_areas`
- A blog or resources section with local and client topics
Report which of these are missing, and which have thin content. Do not call a page missing if the member does not serve that client type.

## Local keyword patterns to look for
- [City] real estate agent, [City] realtor, and homes for sale in [neighborhood]
- [City] buyer agent and [City] listing agent
- [City] apartments for rent or [City] property management (renters and landlords)
- [City] investment properties (investors)
- [City] commercial real estate and office space for lease [City] (commercial)
- Land for sale in [area] (land)
- [Niche] homes in [City]
Check the title, the H1, and the first paragraph of the relevant page for the service and the place. Include the same patterns in each other language the member publishes in.

## Schema
- Use `RealEstateAgent` for the member (or `LocalBusiness` if the member is not an individual agent) with the business name, address or service area, phone, website, and `sameAs` links to the member's profiles.
- Neighborhood pages and listing pages need different markup from the home page. Do not invent listing data.

## Name, address, and phone
Compare with `nap_name`, `nap_address`, and `nap_phone`. Real estate members often use a personal name, a team name, and a brokerage name in different places. The version on the site must match the saved version exactly, and the brokerage name must match how it is licensed.

## Compliance and Fair Housing scan (always High)
Read the visible copy of every audited page. Flag these as findings to review, with the page, the exact words, and a neutral rewrite. Context matters, so say "review" and do not say "violation".
- **Steering and people descriptions:** words that describe who a home or area suits or who lives there, such as "perfect for families", "ideal for young professionals", "great for retirees", "family friendly", "safe neighborhood", "quiet and exclusive", or any mention of religion, ethnicity, or a type of resident.
- **School and safety claims stated as fact:** "great schools", "best school district", "top rated schools", "low crime", "safe area". Rewrite as neutral, verifiable information. For example: "How to find the school district for an address, with a link to the district's official boundary tool." Never rate schools.
- **Outcome promises and rates:** "guaranteed sale", "will appraise", "sell in X days", or quoted rates.
- **Disclosure and notices:** the member's `disclosure_line_full`, Equal Housing wording, and every notice in `required_notices` that the member said they use on the web, in the footer or on the pages they named. Never say whether a notice is legally required. Follow the member's list.
- **Data and photos:** listing data shown from a source the member is not licensed to use.
School district and neighborhood topics are allowed as content when they are neutral and point to official sources, and they are good for local search. Describe the place, the homes, and the amenities. Never describe the people.

## Fix-list wording
Write the rewrite suggestions in the member's voice and follow the Compliance Guardrails page.
