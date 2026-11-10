# Brands

Every piece of content belongs to one **brand** (for example "Learn GHL", "Real estate marketing", "Personal"). The brand decides the Style Guide, the folder, the YouTube channel, and the social accounts. Members see the word "brand". In Notion the brand is the Content Planner's existing `Channel` property and the "Channel – [brand]" pages; never rename them.

## Where brands live
- `channels` in the Content Profile lists the brand names, the first brand first. One name means one brand.
- The **first brand's** settings are in Content Settings. Each **other brand** has a child page under the Master Profile called "Channel – [brand]" (with an en dash), its ID saved as `Brand = page id` in `channel_pages`. A field on a brand page overrides Content Settings, except the three posting fields below.
- Each Content Planner row's `Channel` holds its brand. Folders are `Content/[brand]/...`.

## The three posting fields (per brand)
- `youtube_upload_channel`: the YouTube uploader's saved channel name (from youtube_list_channels), for example `learn-ghl`.
- `ghl_subaccount`: the GHL social connector's sub-account name (from list_social_accounts), for example `jacob-shireman`. Brands may share one sub-account or each have their own.
- `social_account_ids`: `platform = account id (account name)` pairs from list_social_accounts, for example `instagram = abc123 (@learnghl), facebook = def456 (Learn GHL)`.

**Never inherited.** For a brand with its own page, read these three only from that page. If one is missing there, ask (see "Add a brand"), and never use another brand's value or Content Settings. The older Content Settings fields `youtube_channel` and `social_accounts` stay and are never removed; they count only for the first brand, and only when its new field is missing.

## Which brand is this for? (every piece of content)
Resolve the brand in this order, and stop at the first answer:
1. **The member named it** in the request ("a reel for Learn GHL").
2. **This project's brand:** a line `Hi5 brand: <brand>` in this Claude project's instructions (or the project folder's CLAUDE.md). Use it without asking. If it names a brand that is not in `channels`, say so in one line and ask.
3. **Only one brand** in `channels`: use it. Never ask.
4. **Several brands and no answer yet:** ask "What brand is this for?" with the brands as A, B, C options. Never add an "another brand" option here: adding a brand is its own step.

For a calendar row, the row's `Channel` is the answer: never guess or change it. A row with no `Channel` gets the order above, and the answer is set on the row.

## Set this project's brand
Members often keep one Claude project per brand. Offer it once when the member has several brands and works in a project with no brand line:
"Want this project to always work on [brand]? Then I won't ask which brand each time."
- Show the line in a code block: `Hi5 brand: [brand]`.
- **A Claude Code project folder:** with their OK, add that one line to the folder's CLAUDE.md (create the file if there is none). Change nothing else in it.
- **A Claude project on claude.ai or in the desktop app:** you cannot change project instructions. Ask the member to open the project's instructions, paste the line at the end, and save. Offer screenshot help. Never claim it is set.
- To change it later, replace that one line.

## Add a brand
A menu item in /hi5-content-plan ("Add a brand") and in the /hi5-setup re-run menu. One brand per run:
1. Ask the brand name. If it is already in `channels`, say so and offer to fill its missing fields instead.
2. If the YouTube uploader is installed: call youtube_list_channels and ask "Which YouTube channel is [brand]?" If the channel is not saved yet, say "/hi5-connector adds it" and leave the field empty for now.
3. If GHL social is installed: call list_social_accounts, ask which sub-account, then "Which of these accounts are [brand]?" (by name), and save the IDs with the names.
4. Show what you will write, then with the member's OK:
   - Add the name to `channels`.
   - Add it as an option of the Content Planner's Channel select (keep every existing option; notion-structure.md has the method).
   - Create "Channel – [brand]" under the Master Profile with the three posting fields, save it in `channel_pages`.
   - Offer the brand's Style Guide and Edit Log pages and its folder `Content/[brand]/` (setup-calendar.md).
   - Add one Decisions Log row ("Added brand [brand]").
5. Offer "Set this project's brand" for the new brand.
The first brand of a new member is set up by setup (setup.md) and stores its posting fields in Content Settings.

## Posting by brand
- **YouTube:** the brand's `youtube_upload_channel` is the suggestion in the confirm question ("Schedule this on learn-ghl (Learn GHL) for Thursday 9:00 AM?"). Pass the channel only after a yes. If it is missing, list the saved channels and ask, then offer to save the answer on the brand.
- **Social (GHL):** use the brand's `ghl_subaccount` and only its `social_account_ids` for the row's Platforms. First call list_social_accounts and check each ID is there and not expired. Then confirm by name: "Post to @learnghl on Instagram and Learn GHL on Facebook, Thursday 9:00 AM?". If a platform has no ID for this brand, or it is expired, name it in one line and skip that platform. Never post to another brand's account and never pick an account by guessing.

## Several businesses
When a member mentions another business, ask: "Is this another brand of the same business, or a separate business?"
- **Another brand** (the default, and the simplest even for a separate business): run "Add a brand" in the same Hi5 workspace.
- **Fully separate** (its own Notion workspace): Claude's Notion connection works with one workspace at a time. Say: "Keep this business in its own Notion workspace, and when you work on it, reconnect Notion in Claude and pick that workspace. Then run /hi5-setup there." Never mix two workspaces in one piece of work.
