---
name: hi5-yt-setup
description: Content setup for Hi5 Success OS. Finds your Hi5 workspace, asks only the content and voice questions that /hi5-setup did not, and saves them to your Master Profile. Run this once before using the other content commands.
---

# /hi5-yt-setup: Content Setup

Do NOT use a form or structured input UI. Ask each question as a plain conversational message and wait for the member's response before asking the next one.

You are running the Content OS setup. It adds the member's content and voice details to the ONE Master Profile that /hi5-setup built. It takes about 10 minutes. At the end they are ready to run /hi5-yt-research.

Never create a second Master Profile or a second Content Planner. Never show the member raw field names or Notion IDs.

## Step 0: Find the Workspace

The workspace root page is titled "Hi5 Success OS Workspace" and its first line is a marker: `hi5-os-root: v1`. Titles can collide with other pages the member owns, so the marker is what identifies the root.

1. Run two Notion searches: one for "Hi5 Success OS Workspace" and one for "hi5-os-root". Combine the results.
2. Open each candidate page. Keep only pages whose first line starts with `hi5-os-root:`. Ignore every other page, even one titled exactly "Hi5 Success OS".
3. No marked page → say: "I don't see your Hi5 workspace yet. Run /hi5-setup first. It takes about 10 minutes and builds your Master Profile, which this setup adds to. Then come back and run /hi5-yt-setup." Then stop. Do not create anything.
4. More than one marked page → list them with their location and ask the member to pick one. Only ask when more than one marked page matches. Never guess.
5. Open the marked page's child "Master Profile". Its "Page IDs" section holds the IDs of everything else. Use them directly.
6. If a saved ID is missing or the page no longer exists, search for it by title under the root page and write the corrected ID back. If the Content Planner does not exist, say: "Your Content Planner is missing. Run /hi5-setup and choose Continue setup, then come back." and stop.

Then check the Master Profile for a "Content Profile" section with values in it.

**If the Content Profile is already filled in:**
Ask: "Would you like to update your content profile or start working on content?" Wait for their answer before continuing. If they update, ask which part, show the current value, and change only that.

**If it is empty or missing:** continue to Step 1.

## Step 1: Keyword Tracker

If `keyword_tracker_db_id` is not in the Page IDs section, create a database called "Keyword Tracker" inside the root page with these properties:
- Keyword (title)
- Status (select: Tracking, Researched, Used, Dropped)
- Google Trends Score (number)
- Trend Direction (select: Rising, Stable, Declining)
- YouTube Video Count (number)
- Avg Views Top 10 (number)
- Competition Level (select: Low, Medium, High)
- Opportunity Score (select: Low, Medium, High)
- Last Updated (date)
- Notes (text)

Save its ID as `keyword_tracker_db_id` in the Master Profile's Page IDs section. Do not announce this to the member.

## Interview Flow

IMPORTANT: Ask every question as a plain conversational message, one at a time. Wait for the response before asking the next question. Do not present the full list upfront.

The profile already holds the member's name, business, industry, market, niche, and social links. Use them. Never re-ask any of it.

**1. Welcome**
Say: "Hi [name]! You already told me about [business_name] in /hi5-setup, so I'll only ask about your content. About a dozen questions, five to ten minutes. Let's start."

**2. What you offer**
If `offer` is already in the Master Profile, skip this question and say "I already have what you offer from setup." Otherwise ask:
"What do you sell or offer, the thing you want your videos to lead people toward?"
Store: offer

**3. Who they reach**
"Who are you trying to reach with your YouTube channel? Describe your ideal viewer."
Store: youtube_audience

**4. Affiliate links or products** *(skippable)*
"Do you promote any affiliate links or products? If yes, which ones? If not, just say skip."
Store: affiliate_links

**5. Overall channel goal**
"What's the main goal of your YouTube channel? For example: attract clients, grow affiliate revenue, drive community signups, build brand awareness."
Store: channel_goal

**6. Content model type**
"How would you describe your content model?
- **Lead Magnet**: your videos attract people who then convert to clients or buyers (common for real estate, coaches, service businesses)
- **Recurring Audience**: you build a loyal subscriber base who comes back for regular content (common for creators, educators, reviewers)
- **Hybrid**: a mix of both

Which fits you best, or is it somewhere in between?"
Store: content_model

**7. Posting frequency**
"How often do you plan to post? For example: once a week, 3x per week, daily."
Store: posting_frequency

**7a. Multiple channels**
"Do you run more than one YouTube channel? If yes, how many and what is each one focused on?"

If they say yes, finish this interview for the first channel. Then, for each additional channel, ask only questions 5, 6, 7, 10, 11, 12, and 13 again (goal, model, frequency, weekly rhythm, competitors, categories) plus the channel's name and URL. Save each additional channel as its own page (see Writing to Notion). If they say no, skip this.

**8. Recording schedule**
"How do you typically record, do you batch record several videos in one session, or do you record one video at a time as you go?"
Store: recording_schedule

**9. Editing turnaround** *(skippable)*
"How many days does it typically take you to go from recorded to published? This helps me set accurate Edit Due Dates on your content calendar. If you're not sure yet, say skip."
Store: edit_turnaround_days

**10. Weekly content rhythm** *(skippable)*
"Do you have a weekly rhythm for which type of content you post on which days? For example: Monday = tutorial, Wednesday = case study, Friday = Q&A. If you don't have one yet, say skip."
Store: weekly_rhythm

**11. Competitor channel IDs** *(skippable)*
"Do you want to track any competitor channels? If yes, share up to 5 YouTube channel IDs. You can find a channel ID by going to the channel page, clicking About, then More, then Copy Channel ID. If you'd rather skip this for now, just say skip."
Store: competitor_channel_ids

**12. Content categories**
Based on their `industry` and `niche`, suggest a starting set:
- Real estate → Buyer Tips, Seller Tips, Market Update, Community Highlight, Agent Attraction
- GoHighLevel / agency / marketing → Tutorial, Tool Review, Case Study, Product Update, Client Results
- Coaching / consulting → Teaching, Client Story, Framework, Q&A, Behind the Scenes
- Lifestyle / cooking / creator → Tutorial, Behind the Scenes, Trending Topic, Day in My Life, Q&A
- Anything else → Tutorial, Behind the Scenes, Trending Topic, Case Study, Q&A

Say: "Based on your niche, here are some content category suggestions: [list them]. You can keep these, swap any out, or add your own. What would you like your categories to be?"
Store: content_categories

**13. Voice card**
First open the Voice Profile page (`voice_profile_page_id`), if one exists. Ask ONLY the questions below whose fields are missing or empty on it. If none are missing, skip this step and say: "I already have your writing voice saved, so I'll use that." Stage 3 of /hi5-setup already covers formality, sentences, and phrases, so for most members only the on-camera questions (energy level and CTA style) remain.

Ask the missing ones, one at a time:
- "How would you describe your vocabulary style? Casual and conversational, professional and polished, or somewhere in between?" → vocabulary_style
- "How would you describe your sentences, short and punchy, long and flowing, or a mix?" → sentence_rhythm
- "What's your energy level on camera? Calm and measured, high energy, or somewhere in between?" → energy_level
- "How do you like to close your videos, what's your CTA style? Direct and assertive, soft and inviting, or conversational like you're talking to a friend?" → cta_style
- "Are there any phrases you say constantly, things that are just very you? And any phrases or words you'd never say?" *(skippable)* → phrases_used, phrases_never_used

**14. Operator preferences**
"Last section: this tells me how you like to work."
- "When I give you output, do you prefer **bullets** or **prose**?" → output_format
- "For scripts: do you want a full word-for-word script, or an outline with key points?" → script_depth
- "When I give recommendations: one strong recommendation, or a few options to choose from?" → number_of_options
- "How much explanation do you want with my recommendations: just the answer, a short reason, or full reasoning?" → explanation_level
- "What platforms do you typically distribute your content to? Select all that apply: YouTube, Instagram, TikTok, Facebook, LinkedIn, X, Threads, Google Business Profile, Podcast. This becomes your default Distribution setting." → distribution
- "What type of content do you primarily create? Long Form video, Short Form, Blog, Podcast, or a mix?" → default_deliverable_type
- "What is your primary platform, the main place you build your audience?" → primary_platform

## After Collecting All Answers

Say: "I have everything I need. Here's what I'm about to add to your Master Profile:" then display a clean summary of all their answers in plain language.

Ask: "Does everything look right? Say yes to save, or tell me what to change."

## Writing to Notion

Once confirmed, write to the member's Master Profile using the Notion connector. Use the exact field names above.

1. **Content Profile section.** Add a heading 2 called "Content Profile" on the Master Profile page, inserted before the Linked pages heading (or update it if it exists). Never append it after the child pages Under it write one bullet per field in the form `- field_name: value`, using the field names in the questions above. Put `channels:` first, listing the channel names (just the one name if they have one channel).
2. **Voice Profile page.** If `voice_profile_page_id` is not set, create a child page called "Voice Profile" under the Master Profile. Write one bullet per voice field (`- vocabulary_style: value`, and so on). Save the new page's ID as `voice_profile_page_id` in Page IDs. If it already exists, change nothing in it.
3. **Extra channels.** For each additional channel, create a child page under the Master Profile called "Channel – [name]" (with an en dash) holding that channel's own fields. Save each as `Name = page id` in `channel_pages` in Page IDs.
4. Do not create any other page. Do not touch other sections.

Then confirm: "Your content profile is saved. You're ready to run /hi5-yt-research whenever you want to start finding content ideas."

Then remind them of the one thing they still need: "One last thing, open your Claude Project settings, go to Project Instructions, and add this one line:

```
YOUTUBE_API_KEY: [your YouTube Data API v3 key]
```

You can get a free key from the Google Cloud Console by enabling the YouTube Data API v3. Everything else is saved in your Notion workspace, so you don't need to paste anything else."
