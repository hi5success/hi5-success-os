# Workspace Build: Phase 4

Build the member's Hi5 Success OS workspace in Notion. Create pages and databases in the order below, capture every page and database ID, and save them in the Master Profile's Page IDs section (see `master-profile.md`).

Create only what is listed here. Objection Bank, neighborhood pages, compliance, and voice pages are created later by their own stages.

## Template copy mode

Used when the member copied the official Hi5 Success OS Workspace template into their Notion. Their copy's first line is already the marker `hi5-os-root: v1`. Do not create a new root page.

Template items: Master Profile, Brain Index, Business OS, Business Plan, Quarterly Goals, Business Reviews, Content Planner, Marketing Hub, Voice Library, Dashboards, People, AI Employees, Bottlenecks, Tasks, Client Meeting Notes, Internal Meeting Notes, SOPs, Software Stack, Offers and Services, Proof, Decisions Log, AI Memory

1. Open the member's copy (the marked page). Read its child pages and databases and match them by title: Master Profile, Brain Index, Business OS, Content Planner, Keyword Tracker, Marketing Hub, Voice Library, Dashboards, People, AI Employees, Bottlenecks, Tasks, Client Meeting Notes, Internal Meeting Notes, SOPs, Software Stack, Offers and Services, Proof, Decisions Log, AI Memory. The template also has a Getting Started page. It is template-only, so setup never creates, checks, or recreates it. An old copy may still have a Skill Guide or a Reference Hub. Leave them alone, never create them, and never offer to rebuild them. Open Business OS and match Business Plan, Quarterly Goals, and Business Reviews.
2. Save the IDs in the Master Profile's Page IDs section: `root_page_id` (the copy's own page), `dashboard_page_id` (the same page, because the template's first page is the Dashboard), `business_os_page_id`, `business_plan_page_id`, `quarterly_goals_page_id`, `business_reviews_page_id`, `content_planner_db_id`, `marketing_hub_db_id`, `brain_index_page_id`, `voice_library_db_id`, `dashboards_db_id`, `people_db_id`, `ai_employees_db_id`, `bottlenecks_db_id`, `sops_db_id`, `software_stack_db_id`, `offers_db_id`, `proof_db_id`, `decisions_log_db_id`, `ai_memory_db_id`, `client_meetings_db_id`, `internal_meetings_db_id`, `tasks_db_id`, and `keyword_tracker_db_id` if the copy has a Keyword Tracker. Find a database by its title. The Tasks database is found by the title "Tasks".
3. Create only what is missing from the Template items list, using the titles and lines in step 2 and the database layouts in step 3 below. If the member deleted or renamed one, search under the root by title before creating anything. Never create a second copy of anything. Never remove, rename, or move anything the member has. Skill Guide, Reference Hub, and Getting Started are no longer part of the template, so never create or recreate them. Skills and the setup order live in the Hi5 Vault (vault.hi5success.com).
4. Check the Master Profile page. If it has the Setup Status, Page IDs, and Linked pages headings, keep it and fill in values. If it has no Setup Status heading and its body is only the template's bracketed placeholders, replace the body with the skeleton from `master-profile.md`. If it has other content, ask the member before changing it.
5. Set `workspace_source: template` and `template_version: 3` in Setup Status. A copy with `template_version: 2` (or none) is older: the workspace check offers it the new databases and the Brain Index, and creates them only on the member's OK. Never touch what it already has. The template is the source of truth for options: where an option in this file is missing from the member's copy, use the closest existing option, and add one only with the member's OK. Set `profile_version` to the current version if it is empty.
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
| Brain Index | 🗺️ | See "Brain Index content" below |

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
| Status | select | Not Started, Brainstorming, Ready to Edit, In Progress, Reviewing, Revising, Finalizing, Optimizing, Scheduled, Published |
| Status Changed | date | Set to today by every content skill each time Status moves |
| Role | select | Content Manager, Video Editor, Social Media, YouTube Producer, Blog Writer |
| Channel | select | (created as used) |
| Review Notes | text | Feedback on a draft, from the member to the role that owns the row |
| Published Links | text | Live post links, one per platform, filled when the scheduler or bridge confirms |
| Publish Date | date | |
| Record Date | date | |
| Edit Due Date | date | 48 hours before Publish Date (set in the Content SOP) |
| Content Category | select | (created as used) |
| Content Type | select | (created as used) |
| Deliverable Type | select | Long Form, Short Form, Blog, Email Newsletter, Carousel Post, Static Post, Podcast, Workflow, Social Post |
| Production Style | select | (created as used) |
| Goal | select | Affiliate, Community, Awareness, Mixed |
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
| Clip Number | number | The order of a clip within its long-form (content calendar) |
| Needs from member | text | What a role is waiting for from the member, for example a photo (content calendar) |
| Parent long-form | relation | The long-form a clip belongs to, to this same database, with the reverse relation Clips (content calendar) |
| Parent publish date | rollup | The Publish Date of the Parent long-form (content calendar) |
| Clip Publish Date | formula | The parent publish date plus the Clip Number in days, so clip dates are never calculated by a skill (content calendar) |

Deliverable Type: the template has Carousel Post (skills treat it as a carousel) and no Clip option, because clips are Short Form rows with a parent. Clip rows use Content Type Repurpose. Needs from member (text) is not in the template: add it with the member's OK (the workspace check offers it), and until then write the need as the first line of the row's page. Status is a **select** (not Notion's built-in status type) so the exact values above can be set. The Content Calendar view has no filter, so every Deliverable Type shows, short-form included. In an older copy, Planned and Idea mean Brainstorming, and Scripted and Draft mean In Progress. Never rename or delete the member's own options or properties (Primary Platform stays if they have it). Skills use only the names above.

### 📧 Marketing Hub
Every email sequence, newsletter issue, website page, landing page, SEO plan or audit, and case study is one row, with the full text in the row's page body. The official Hi5 Success OS Workspace Template already includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Title | title | |
| Type | select | Email Sequence, Newsletter, SEO Strategy, SEO Audit, Website Copy, Landing Page, Case Study, LinkedIn Posts, Funnel, Listing Appointment, Listing Launch, Seller Update, Transaction, Sphere Plan, Prospecting, Buyer, Ad Campaign, Property Plan, Other |
| Status | select | Draft, Approved, Published |
| Source Skill | text | The command that made it, for example /hi5-email |
| Date | date | |

### 🎙️ Voice Library
One row per voice, with the full guide, a Learned section, and the samples list in the row's page body. Created by /hi5-voice-creator. The official Hi5 Success OS Workspace Template includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Name | title | |
| Skill Name | text | The skill's folder name, for example jacobs-voice |
| For | select | Self, Teammate, Client or brand |
| Status | select | Active, Draft, Retired |
| Version | number | |
| Date | date | |

### 📊 Dashboards
One row per dashboard built by /hi5-dashboard, with its pages, widgets, data sources, connected apps, the Notion databases it uses, email button settings, and the discovery answers in the row's page body. The official Hi5 Success OS Workspace Template includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Name | title | |
| Status | select | Active, Draft, Retired |
| Version | number | |
| Date | date | |
| Type | select | Command Center, CRM, Content, Money, Transactions, Industry, Custom |
| Industry | text | |
| Artifact link | url | |

### 👥 People
One row per person on the team (the member included), with the person's full profile on the row's page. Created or filled by /hi5-self, and read by /hi5-org-chart and by every Hi5 writing skill that shapes a message for a teammate. The official Hi5 Success OS Workspace Template includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Name | title | |
| Role | text | |
| Email | email | |
| Reports to | text | The manager's name exactly as it is in this database |
| Human or AI | select | Human, AI |
| Personality profile | text | One line, for example "S/C blend, own answers" |
| Human Design profile | text | One line, or "Not shared". Never a birth date, time, or place |
| Communication tips | text | Length, format, detail, directness, and what to lead with |
| Status | select | Active, Waiting for answers, Former |
| Profile source | select | Own answers, Estimated |
| Profile date | date | |

### 🤖 AI Employees
One row per AI employee, with its job description in the row's page body. Each has exactly one human manager. Rows are created by /hi5-org-chart (name, role, and manager) and filled in by /hi5-bottleneck (the full job description). The official Hi5 Success OS Workspace Template includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Name | title | |
| Role | text | |
| Human manager | text | The manager's name exactly as it is in People. Exactly one |
| Status | select | Draft, Active, Paused, Retired |
| Review cadence | select | Monthly, Quarterly, Twice a year |
| Review date | date | |
| Claude Project link | url | |
| Created | date | |
| Version | number | |
| Skills | text | The Hi5 skills this employee uses |
| Channel | text | |
| SOP | url | The SOP row the employee follows |

### 🚧 Bottlenecks
One row per bottleneck found by /hi5-bottleneck, so the next run can review what got fixed and whether the estimates held. The official Hi5 Success OS Workspace Template includes this database with these properties. Properties:

| Property | Type | Options |
|---|---|---|
| Task | title | |
| Owner | text | The owner's name exactly as it is in People |
| Hours per week | number | |
| Pain | number | 1 to 5 |
| Automatable | number | 1 to 5 |
| Fix type | select | Remove or simplify, Existing Hi5 skill or widget, Platform automation, AI help, AI employee, Keep human |
| Status | select | Found, Planned, In progress, Fixed, Dropped, Kept human |
| AI employee | text | The AI employee's name, if the fix is one |
| Estimated hours saved | text | A range, labeled as an estimate, for example "2 to 3" |
| Actual hours saved | number | Filled in on a later run |
| Date | date | |

### ✅ Tasks
Every task for the member, their team, and their AI employees. Used by /hi5-dashboard (the task home when Notion is the home), /hi5-meetings, and any skill that makes a task. The official template includes this database. Properties:

| Property | Type | Options |
|---|---|---|
| Task | title | |
| Status | status (select in a built workspace) | To Do, In Progress, Waiting on Me, Waiting on Others, Done. The template uses Notion's status type |
| Due Date | date | |
| Category | select | Real Estate, (others created as used) |
| Owner | text | A person or AI employee name, exactly as in People or AI Employees |
| Client or Project | text | |
| Source Meeting | url | The meeting note this task came from |
| Notes | text | What the task is waiting on, and the key or link back to its source |

Save its ID as `tasks_db_id` the moment it is created.

### 🗒️ Client Meeting Notes
One row per meeting with a client or prospect. Written by /hi5-meetings. Properties:

| Property | Type | Options |
|---|---|---|
| Title | title | |
| Date | date | |
| Type | select | Consultation, Showing or Walkthrough, (others created as used) |
| Attendees | text | |
| Contact Email | email | |
| Contact Phone | phone | |
| CRM Record | url | |
| CRM Status | select | Not logged, Logged, No match, Needs review |
| Source | select | Google Meet, Zoom, Fathom, Otter, Fireflies, Phone call, Manual |
| Transcript Link | url | |
| Follow-up Date | date | |

### 🗒️ Internal Meeting Notes
One row per team meeting, where every attendee is in People. Written by /hi5-meetings. Properties: Title (title), Date (date), Attendees (text), Source (select: Google Meet, Zoom, Fathom, Otter, Fireflies, Manual; add Phone call with the member's OK), Transcript Link (url).

### 📘 SOPs
One row per standard operating procedure, with the steps in the row's page body. Content skills read the SOP for their role before any work. Five Sample rows ship with the template (Content Management, Video Editing, Social Media Scheduling, YouTube Publishing, Blog Writing). Properties:

| Property | Type | Options |
|---|---|---|
| Name | title | |
| Department | select | (created as used) |
| Owner | text | |
| Trigger | text | |
| Tools | text | |
| Channel | text | |
| Status | select | Sample, Draft, Active, Retired |
| Version | number | |
| Last Reviewed | date | |

### 🧰 Software Stack
One row per tool the business uses. Never passwords. Properties: Tool (title), Category (select, created as used), What It Is For (text), Owner (text), Connected to Claude (select: Yes, No, Not possible), Login Kept In (text, where the login is kept, never the login itself), Monthly Cost (number), Status (select: Active, Trial, Cancelled).

### 🏷️ Offers and Services
One row per thing the member sells, in their own words. Never a suggested price. Properties: Offer (title), Who It Is For (text), What Is Included (text), Price or Fee (text, the member's own words), Status (select: Active, Coming Soon, Retired), Last Reviewed (date).

### 🏆 Proof
Reviews, results, and stories. Properties: Proof (title), Type (select: Review, Testimonial, Result, Award, Media), Client or Source (text), Link (url), Date (date), Approved for Public Use (select: Approved, Ask First, Private). New rows are Ask First until the member approves.

### 🧭 Decisions Log
One row per business or process decision. Properties: Decision (title), Date (date), Area (select, created as used), Why (text), Decided By (text), Changes (text, the pages or SOPs it changed), Status (select: Active, Replaced).

### 🧠 AI Memory
Corrections and lasting preferences, one or two sentences each. Properties: Memory (title), Type (select: Preference, Lesson, Correction, Conversation Summary, Open Question), Area (select, created as used), Applies To (text), Source AI (text), Related Page (url), Date (date), Status (select: Active, Replaced).

## 4. Master Profile page
Write the skeleton from `master-profile.md` into the Master Profile page: the heading 2 sections in order (Setup Status, Page IDs, Identity, Market, Tools, Presence, Brand, Business, Edge, Self Profile, and last of all Linked pages, which holds only the heading) with empty field bullets, then fill in Setup Status (including `profile_version: 4`, `workspace_source: built`, and `template_version: 3`) and Page IDs from what you just created. The Linked pages heading must stay the last block on the page.

## Dashboard content
Write this on the Dashboard page, after the first-line marker (the root page is the Dashboard):

> **Welcome to Hi5 Success OS**
> Everything here is yours. Your skills read your Master Profile so you never re-explain your business. Not sure what to do next? Run /hi5-next. Every skill and the setup order are in the Hi5 Vault: vault.hi5success.com.

Then these views, each a linked view of its database: My Tasks, Content in Production, Content Calendar, Content Performance, and Appointment Calendar. Then a section "Your Workspace" with every page and database grouped under: Start here (Brain Index, Master Profile), Your business (Business OS, Offers and Services, Proof, Software Stack, SOPs), Your team and how you work (People, AI Employees, Bottlenecks, Decisions Log, AI Memory, Voice Library), Your work (Content Planner, Marketing Hub, Tasks, Dashboards), and Growth and history (Client Meeting Notes, Internal Meeting Notes). Every database has its own icon and a one-line description. Titles are plain text.

## Brain Index content
The Brain Index is the map of the member's brain, and the first page any AI reads. Write: one line ("One place that holds everything true about your business, so any AI or teammate can work without you re-explaining it."); the map, which is the same five groups as "Your Workspace" above with a link and one line for each page and database; the reading order ("Read the Brain Index, then the Master Profile, then Compliance and Voice before anything public, then the SOP for the job, then the Active AI Memory rows for that area"); the rules from `../../../references/brain-rules.md` in plain words; and "Every skill and the setup order are in the Hi5 Vault: vault.hi5success.com." When a new page or database is added, add it to the map and to its group on the dashboard. Save its ID as `brain_index_page_id`.
