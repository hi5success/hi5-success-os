# Workspace Build: Phase 4

Build the member's Hi5 Success OS workspace in Notion. Create pages and databases in the order below, capture every page and database ID, and save them in the Master Profile's Page IDs section (see `master-profile.md`).

Create only what is listed here. Objection Bank, neighborhood pages, compliance, and voice pages are created later by their own stages.

## Template copy mode

Used when the member copied the official Hi5 Success OS Workspace template into their Notion. Their copy's first line is already the marker `hi5-os-root: v1`. Do not create a new root page.

Template items: Master Profile, Business OS, Business Plan, Quarterly Goals, Business Reviews, Skill Guide, Content Planner, Marketing Hub

1. Open the member's copy (the marked page). Read its child pages and databases and match them by title: Master Profile, Business OS, Skill Guide, Reference Hub, Content Planner, Keyword Tracker, Marketing Hub, Tasks, Client Meeting Notes, Internal Meeting Notes. Open Business OS and match Business Plan, Quarterly Goals, and Business Reviews.
2. Save the IDs in the Master Profile's Page IDs section: `root_page_id` (the copy's own page), `dashboard_page_id` (the same page, because the template's first page is the Dashboard), `business_os_page_id`, `business_plan_page_id`, `quarterly_goals_page_id`, `business_reviews_page_id`, `content_planner_db_id`, `marketing_hub_db_id`, `skill_guide_page_id`, and `keyword_tracker_db_id` if the copy has a Keyword Tracker.
3. Create only what is missing from the Template items list, using the titles and lines in step 2 and the database layouts in step 3 below. If the member deleted or renamed one, search under the root by title before creating anything. Never create a second copy of anything. Never remove, rename, or move anything the member has. Tasks, Client Meeting Notes, Internal Meeting Notes, and the Reference Hub are not required, so never recreate them.
4. Check the Master Profile page. If it has the Setup Status, Page IDs, and Linked pages headings, keep it and fill in values. If it has no Setup Status heading and its body is only the template's bracketed placeholders, replace the body with the skeleton from `master-profile.md`. If it has other content, ask the member before changing it.
5. Set `workspace_source: template` and `template_version: 2` in Setup Status. Set `profile_version` to the current version if it is empty.
6. Say nothing technical. Tell the member that their workspace is connected and what you added, if anything.

---

## Full build mode

Everything from here to the end of step 4 is the full build, used only when the member chose not to copy the template. It creates the same layout as the template.

## 1. Root page
Create a page called **Hi5 Success OS Workspace** (icon 🚀) at the top level of the member's Notion workspace. Everything below is created inside it.

The very first line of the page body must be exactly:

`hi5-os-root: v1`

This marker is how every Hi5 skill recognizes the root page (the title alone is not reliable, since members may already own a page called "Hi5 Success OS"). Do not remove or change it, and tell the member not to delete that first line. Add a second line under it in plain language: "Hi5 Success OS saves your profile and work in this workspace. Please leave the line above as is."

Save the root page's ID as `root_page_id` in the Master Profile (step 4).

## 2. Pages (create in this order, all inside the root page)

| Title | Icon | Content |
|---|---|---|
| Dashboard | 🏠 | See "Dashboard content" below |
| Master Profile | 👤 | See step 4 |
| Business OS | 💼 | One line: "Your business plan, quarterly goals, and business reviews." |
| Skill Guide | 📖 | See "Skill Guide content" below |

Inside **Business OS** create three empty pages:
- Business Plan
- Quarterly Goals
- Business Reviews

Each gets one line: "Created by /hi5-bizplan." / "Created by /hi5-goals." / "Created by /hi5-bizreview." respectively.

## 3. Databases (inside the root page)

### 📋 Content Planner
Every video, blog, and piece of content is one row. Properties:

| Property | Type | Options |
|---|---|---|
| Title | title | |
| Status | select | Idea, Scheduled, Scripted, Draft, Published |
| Publish Date | date | |
| Record Date | date | |
| Edit Due Date | date | |
| Content Category | select | (created as used) |
| Content Type | select | (created as used) |
| Deliverable Type | select | Long Form, Short Form, Blog, Podcast, Social Post |
| Production Style | select | (created as used) |
| Goal | select | Affiliate, Community, Awareness, Mixed |
| Primary Platform | select | (created as used) |
| Distribution | multi-select | (created as used) |
| Target Keyword | text | |
| Hook / Angle | text | |
| Source | select | YouTube Research, Competitor Pull, Manual |
| Trend Score | select | Low, Medium, High |
| Assigned To | person | |
| Related To | text | Title of the piece this was made from (for blog, captions, and repurposed content) |
| Asset Folder URL | url | |
| Export / Deliverables URL | url | |
| YouTube URL | url | |
| Thumbnail URL | url | |
| Views Total | number | |
| Views Last 7 Days | number | |
| Click-Through Rate % | number | |
| Watch Time Avg % | number | |
| Top Traffic Source | text | |
| Performance Tier | select | (created as used) |
| Repurpose Status | select | Not Started, Clips Created, Captions Written, Posted |
| Last Analytics Pull | date | |

Status is a **select** (not Notion's built-in status type) so the exact values above can be set.

### 📧 Marketing Hub
Every email sequence, newsletter issue, website page, landing page, SEO plan or audit, and case study is one row, with the full text in the row's page body. The official Hi5 Success OS Workspace Template already includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Title | title | |
| Type | select | Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Other |
| Status | select | Draft, Approved, Published |
| Source Skill | text | The command that made it, for example /hi5-email |
| Date | date | |

## 4. Master Profile page
Write the skeleton from `master-profile.md` into the Master Profile page: the heading 2 sections in order (Setup Status, Page IDs, Identity, Market, Tools, Presence, Brand, Business, Edge, Self Profile, and last of all Linked pages, which holds only the heading) with empty field bullets, then fill in Setup Status (including `profile_version: 3`, `workspace_source: built`, and `template_version: none`) and Page IDs from what you just created. The Linked pages heading must stay the last block on the page.

## Dashboard content
Write this on the Dashboard page:

> **Welcome to Hi5 Success OS**
> Everything here is yours. Your skills read your Master Profile so you never re-explain your business.
>
> **Not sure what to do next?** Run /hi5-next. It reads your progress and tells you your best next step.
>
> **The path**
> 1. **Foundation:** finish your setup (run /hi5-setup and choose "Continue setup"), then /hi5-self, /hi5-bizplan, /hi5-goals, and /hi5-bizreview
> 2. **Content strategy:** /hi5-yt-setup, /hi5-yt-research, /hi5-yt-plan (if you plan to make videos)
> 3. **Create:** /hi5-yt-script, /hi5-repurpose, /hi5-social, /hi5-blog
> 4. **Get found:** /hi5-seo, /hi5-site-audit, /hi5-website
> 5. **Nurture:** /hi5-email, /hi5-newsletter
> 6. **Grow:** /hi5-landing, /hi5-funnel, /hi5-casestudy
>
> **Real estate members with Real Estate OS installed:** /hi5-re-crm, /hi5-re-listing-appt, /hi5-re-listing-launch, and /hi5-re-seller-updates
>
> **Tip:** keep a few separate Claude Projects, one per topic. Run /hi5-next and I'll show you how.
>
> **Your workspace:** Master Profile · Business OS · Content Planner · Marketing Hub · Skill Guide

## Skill Guide content
A short table the member can reference. One section per plugin, one line per skill: command and what it does. Mark each plugin "if installed". Use the skill descriptions from the plugins:
- **Business OS:** /hi5-setup, /hi5-next, /hi5-self, /hi5-bizplan, /hi5-goals, /hi5-bizreview
- **Content OS:** /hi5-yt-setup, /hi5-yt-research, /hi5-yt-plan, /hi5-yt-script, /hi5-repurpose, /hi5-blog, /hi5-social
- **Real Estate OS (real estate members, a separate install):** /hi5-re-crm, /hi5-re-listing-appt, /hi5-re-listing-launch, /hi5-re-seller-updates
- **Marketing OS:** /hi5-email, /hi5-newsletter, /hi5-seo, /hi5-site-audit, /hi5-linkedin, /hi5-website, /hi5-landing, /hi5-funnel, /hi5-casestudy

Finish with: "Run /hi5-next any time for your best next step, and /hi5-setup to update your profile or continue setup."
