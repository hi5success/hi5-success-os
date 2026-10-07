# Site Audit Checks and Priority Rules

Used by `SKILL.md`. These are practical guidelines for small business and real estate sites, not official Google rules. Say that when a threshold matters. Record the page and the evidence for every finding.

## Page checks (run on every page you audit)

| Check | What to read | Passes when | Default priority if it fails |
|---|---|---|---|
| Title tag | The `<title>` | Present, unique on the site, roughly 50 to 60 characters, and leads with what the page is about (service or topic, plus the place when it is a local page) | High on key pages, Medium elsewhere |
| Meta description | `meta name="description"` | Present, unique, roughly 120 to 160 characters, reads like a reason to click | Medium |
| H1 | The page headings | Exactly one H1 that says what the page is about | High if missing or several, Medium if vague |
| Heading structure | H2 and H3 | A logical outline that answers the questions a visitor has | Low |
| Local keywords | The visible copy | The main service or topic and the place appear naturally in the title, the H1, the first paragraph, and the body. No stuffing | High on key local pages |
| Content depth | The visible text | Enough useful content for the page's job. A page with only a few sentences is thin | Medium for service and local pages, Low elsewhere |
| Images | `img` tags | Descriptive file names and alt text, and images are not huge | Low to Medium |
| Internal links | Links in the copy and navigation | The page links to the member's key pages with descriptive anchor text, and is linked from other pages. A page nothing links to is an orphan | Medium, High for an orphan key page |
| Canonical and indexing | `rel="canonical"` and `robots` meta | Canonical points to the right URL, and no key page is set to `noindex` by accident | High if a key page is noindex |
| Schema | JSON-LD in the page | Local pages have the right structured data (see the industry file) with correct name, address, phone, and URL. FAQ content may use FAQ markup | Medium |
| Mobile setup | `meta name="viewport"` and layout | A viewport tag is present and the page does not need sideways scrolling | High if missing |
| Language setup | `html lang`, `hreflang` | See the language checks below | Medium |

## Site checks (run once)

| Check | What to read | Passes when | Default priority if it fails |
|---|---|---|---|
| HTTPS and redirects | The homepage over http and with and without www | One secure version, and the others redirect to it in a single step | High if no HTTPS, Medium for redirect chains |
| robots.txt | `/robots.txt` | It exists and does not block the whole site or key sections | High if it blocks key pages |
| Sitemap | `/sitemap.xml` | It exists, lists the key pages, and uses the secure URLs | Medium |
| Broken links | Internal links, plus a sample of external links | No links that return an error. Check the navigation, footer, and the key pages' links | High for broken navigation or key page links, Medium elsewhere |
| 404 page | A made up URL | A helpful page that returns a 404 and links back to the site | Low |
| Orphan pages | Sitemap pages with no internal links | Every important page is linked from somewhere | Medium |
| Name, address, phone | The footer, the contact page, and the schema | The business name, address (or service area), and phone match the saved details exactly, on every page they appear | High if they conflict, Medium if missing |
| Disclosure and notices | The footer and key pages | The member's disclosure line and any required notices appear where the member said they use them on the web | High if missing |
| Speed | PageSpeed Insights on mobile | A good mobile performance score and healthy timing numbers. Report the top opportunities | High if the score is poor, Medium if middling |

## Language checks (only if the member publishes in more than one language)
- Each language has its own page address, not a language switch that hides content.
- Pages carry the right `html lang`, and language versions point to each other with `hreflang`.
- The copy in the other language reads naturally, not as a machine translation. If it looks translated word for word, say so and suggest rewriting it natively with /hi5-website.
- The title, meta description, and local keywords exist in each language.
- Ask once which languages they publish in and save `languages_published`. Use `languages` from the profile as the starting guess.

## Compliance and language scan (always High)
Run the scan in the industry file against the visible copy of every audited page. Flag each hit with the page, the exact words, and a neutral rewrite. These are findings to review, not automatic violations, because context matters. Follow the member's Compliance Guardrails page.

## Priority rules
1. **High:** anything that stops pages from being found or used (noindex on a key page, robots blocking, no HTTPS, a missing viewport tag, broken navigation), conflicting business details, missing disclosure or required notices, every compliance or Fair Housing finding, and a poor mobile speed score.
2. **Medium:** things that cost clicks or relevance on many pages (missing or duplicate titles and descriptions on non-key pages, thin local pages, no schema, orphan pages, redirect chains, hreflang gaps).
3. **Low:** polish (heading outline, image names, 404 page).
4. Within a priority, put findings that affect many pages first, then the easiest fixes first.
5. The fix list at the top has at most 10 items. Everything else goes in the table in the saved page.
