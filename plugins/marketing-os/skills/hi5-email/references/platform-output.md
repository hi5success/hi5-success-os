# Platform-Ready Output

Used by `SKILL.md` Step 5 (and Step 6 when a draft is created in a platform). For every email, give three things: the draft rendered in the chat, a ready-to-paste HTML body, and a plain-text version.

## 1. The rendered draft
Show the email formatted in the chat the way a reader will see it (real bold, italics, bullets, and headings, not raw code). Follow the formatting style and emoji choice for this campaign.

## 2. The HTML body (paste-ready)
- Clean HTML with inline styles only. No scripts, no external CSS, no style blocks, no images unless the member supplied them.
- Allowed tags: one wrapper div, p, ul and li, strong, em, small, a, br, and h2 or h3 for formatting style C only. Never the u tag, and never underline styling on anything that is not a link.
- Mobile safe: one column, a wrapper at most 600px wide, 16px body text, line height about 1.5, and a font stack of Arial, Helvetica, sans-serif. Give every p a bottom margin so paragraphs have breathing room.
- Real line breaks in the source: put each block element on its own line so the code is readable and survives a paste.
- The P.S. is wrapped in em (italic) for styles B and C.
- Bullets are a real ul with li items, never dashes typed as markers.
- An asterisked claim gets its disclaimer in small at the bottom, above the footer.
- The footer is one small block: the disclosure line, required notices, the unsubscribe line, and the mailing address, each on its own line (use br).
- Links are a with an href. Where the link is not known, keep the visible placeholder in the href, for example href="[LINK: checkout]", so it cannot be sent unnoticed.
- A first-name merge field only if the platform is known (for GoHighLevel, {{contact.first_name}}). Otherwise write the draft without it.

Skeleton for style B:

<div style="max-width:600px;margin:0 auto;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5;color:#222222;">
<p style="margin:0 0 16px 0;">Opening line with <strong>one key phrase</strong>.</p>
<ul style="margin:0 0 16px 20px;padding:0;">
<li style="margin:0 0 6px 0;">First item</li>
<li style="margin:0 0 6px 0;">Second item</li>
<li style="margin:0 0 6px 0;">Third item</li>
</ul>
<p style="margin:0 0 16px 0;"><a href="[LINK: name]" style="color:#0b5cad;">Link text</a></p>
<p style="margin:0 0 16px 0;">Name</p>
<p style="margin:0 0 16px 0;"><em>P.S. The P.S. text.</em></p>
<p style="margin:24px 0 0 0;"><small>*Results vary and are not typical.<br>Disclosure line.<br>Unsubscribe line.<br>Mailing address.</small></p>
</div>

Style C adds h2 or h3 section headings (inline styled), bold labels, and bullets inside clear blocks. Style A uses only p, a, and the footer.

## 3. The plain-text version
Real line breaks, a blank line between paragraphs, and "•" for bullets (never a dash). No markup characters for bold or italic. Keep the P.S. as a line starting "P.S.". Put the disclaimer line, then the footer lines, at the bottom. Give it even when the platform takes HTML, because some need both.

## 4. By platform
Screens and menus differ by platform and version, so say "look for" and ask for a screenshot if the member's screen does not match. Read the platform from the profile first (`email_platform`, then `crm`). If it is missing, ask once with lettered options (GoHighLevel, Mailchimp, Constant Contact, Klaviyo, Gmail, other) and save it.
- **GoHighLevel:** can be created through the connector as a draft template (below), or pasted into an email template with the code editor option.
- **Mailchimp:** look for a custom HTML or "code your own" email, and paste the HTML body.
- **Constant Contact:** look for a custom code email option, and paste the HTML body.
- **Klaviyo:** look for a template with an HTML or code block, and paste the HTML body.
- **Gmail:** HTML does not paste cleanly into Gmail. Copy the rendered version from the chat into the compose window for rich text, or use the plain-text version.
- **Other:** say what you do not know, and give the generic steps: open the HTML or code view in the builder and paste the body, then check the preview on a phone width.

## 5. Creating a draft in GoHighLevel through the connector
Only after the member says OK to a specific draft. Never send, and never schedule or publish anything.
1. Show what will be created (the name, the type, the subject, the preview text, and which sub-account). Use the sub-account from `ghl_location_name`. If there is more than one and the profile does not say, call list_locations and ask which. Never guess.
2. Search the connector's operations (search_operations) for "create email template", read its description (describe_operation), then run create-email-template with: name (for example "[Draft] launch email 1"), editorType "html", editorContent (the full HTML body as one string with real line breaks), subjectLine, and previewText. A write needs an idempotency key and a short reason.
3. Read it back with get-email-template. The connector returns a link to the stored HTML (editorContentUrl) rather than the content itself, so fetch that link and check that the stored content still has its separate lines, paragraphs, and list items and is not one long line. GoHighLevel may add small email-client compatibility wrappers around links, which is fine. Say what you checked. If the plain-text version is needed too, create a second template with editorType "text".
4. Report the template name and where to find it (look for it under email templates in that sub-account). It stays a template. Nothing is sent, scheduled, or published.
5. A campaign draft (create-email-campaign) also needs the acting user's id and a time zone. Offer it only if the member asks, and keep it a draft.
6. If the connector refuses, needs approval the member has not given, or cannot take HTML, say so and give the paste steps above. Never retry a write automatically.
