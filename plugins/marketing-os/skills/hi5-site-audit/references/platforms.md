# Website Platforms: Detection and Fix Steps

Used by `SKILL.md` (Step 2 and Step 8) and by /hi5-seo. Detect the platform, confirm it with the member, save `website_platform`, and give fix steps for that platform.

**How to give steps.** Describe where to look in general terms, such as "open the page in your site builder and find its SEO settings". Never assume exact menu names, because platforms change them. Say: "If your screen looks different, send me a screenshot and I'll tell you exactly what to click." Give one step at a time and wait. If a fix needs code or a developer, say so plainly and offer to write the exact text or code for them to send.

## Detection signals
These are common signals, not proof. Always confirm with the member.

| Platform | Common signals in the page source or addresses |
|---|---|
| GoHighLevel (including Hi5 Connect and the Real Estate GHL Snapshot) | Files loaded from `leadconnectorhq.com`, `msgsndr.com`, or `filesafe.space`, and the words "highlevel" or "gohighlevel" in the source |
| Astro | `<meta name="generator" content="Astro ...">`, `astro-island` elements, and files under `/_astro/` |
| WordPress | Paths containing `/wp-content/`, `/wp-includes/`, or `/wp-json/`, and a WordPress generator meta tag |
| Squarespace | Files from `squarespace.com` and a Squarespace generator tag |
| Wix | Files from `wixstatic.com` and a Wix generator tag |
| Real estate website providers (kvCORE or BoldTrail, Sierra Interactive, IDX Broker, Real Geeks, and similar) | The provider's name in the page source, scripts, or footer |
| Shopify | Files from `cdn.shopify.com` |
| Other | None of the above. Ask the member |

## GoHighLevel (including Hi5 Connect)
- **Titles and meta descriptions:** open the page in the builder and look for the page's SEO or settings area, where the title and description are set for each page.
- **Headings:** in the builder, choose the heading element for the page's main title and set it as the H1. Use only one H1 per page, and H2 for sections.
- **Schema and code:** the page and the site both have a place for custom code in the head. Add the structured data there. Offer to write the exact JSON-LD for them to paste.
- **Images and speed:** compress images before uploading, add alt text in each image's settings, and remove heavy sections, large videos, and extra scripts that are not needed.
- **Internal links:** add links with button or text link elements, using words that describe the destination.
- **Redirects and sitemap:** look for the site's SEO settings for the sitemap and for redirects. Make sure the secure address is the main one.
- **Languages:** build a separate page for each language with its own address, and add the language tags in the head code.
- **Listings consistency:** the GHL Listings add-on, which is included with Hi5 Connect, can help keep business listings consistent. Mention it as an option only for members on GoHighLevel or Hi5 Connect.

## Astro
- **Who can do it:** Astro sites are code. The member or their developer edits the files. Offer to write the exact changes.
- **Titles and meta descriptions:** set them in the page's layout through props so every page has its own title and description in the head.
- **Headings:** one H1 in each page's component, and a clear outline below it.
- **Schema:** add a JSON-LD script in the layout head, filled from the page's data.
- **Images and speed:** use Astro's image handling so images are resized and compressed, set width and height, and load below-the-fold images lazily.
- **Sitemap:** use Astro's sitemap integration, with the site address set in the config.
- **Languages:** use separate routes for each language, set the language on the page, and add `hreflang` links in the head.

## WordPress
- **Titles, meta, schema, and sitemap:** an SEO plugin (for example Yoast or Rank Math) handles the title and description for each page, structured data, and the sitemap. Open the page editor and look for its SEO panel.
- **Headings:** in the block editor, set the page title as the H1 and use H2 and H3 for sections.
- **Images and speed:** compress images, add alt text in the media settings, and use a caching and image optimization plugin.
- **Internal links:** add links in the editor with descriptive anchor text.
- **Languages:** use a translation plugin or build separate pages per language, and make sure `hreflang` tags are added.

## Squarespace and Wix
- **Titles and meta descriptions:** open each page's settings and look for its SEO fields.
- **Headings:** use heading styles in the editor, and keep one H1 per page.
- **Schema and code:** look for a code injection area for the site header. Some plans limit it.
- **Images and speed:** compress images before uploading, add alt text in the image settings, and trim large sections. Control over speed is limited on these platforms. Say so.
- **Languages:** use the platform's multilingual features or separate pages per language.

## Real estate website providers (kvCORE or BoldTrail, Sierra Interactive, IDX Broker, Real Geeks, and similar)
- **Control varies a lot.** Most let you edit page titles and descriptions and content pages, but not the templates. Say what you can and cannot change.
- Focus on the content pages the member controls: neighborhood pages, blog posts, and service pages.
- For anything the member cannot change, give them a short, specific message to send to the provider's support, and offer to write it.

## Shopify and other platforms
- Describe the fix by what it is (the title field, the headings, the image alt text) and ask the member to find the matching setting. Use screenshots to guide them. For anything that needs code, offer to write it.

## Fix types, in plain words
| Fix | What to tell the member |
|---|---|
| Missing or duplicate title or meta description | Each page needs its own title and a short description that says what the page is and why to click. Offer to write them. |
| No H1, or several | Each page needs exactly one main heading that says what the page is about. |
| Missing or wrong schema | Add structured data so Google can read the business name, address, phone, and website. Offer to write it. |
| Slow pages | Compress images, remove unused sections and scripts, and avoid autoplay video. Re-test with PageSpeed Insights. |
| Broken links | Update or remove them. List every broken link with the page it is on. |
| Weak internal links | Link from related pages to the key pages, using words that describe the destination. |
| Conflicting name, address, or phone | Use one exact version everywhere, matching the saved details. |
| Missing disclosure or notices | Add the disclosure line and any required notices where the member said they use them on the web. |
| Missing or poor language pages | Build a native page for each language with its own address and language tags. |
