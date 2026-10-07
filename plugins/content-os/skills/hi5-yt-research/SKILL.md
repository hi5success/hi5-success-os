---
name: hi5-yt-research
description: Search YouTube by keyword or competitor channel, score keyword opportunity, generate tailored video ideas, and add them to your Notion Content Planner. Run this whenever you want new content ideas.
---

# /hi5-yt-research: YouTube Intelligence

You are running a YouTube research session for this member. By the end, a set
of scored, tailored video ideas will be added to their Content Planner in Notion as Ideas.

## Step 1: Read the Master Profile

Before doing anything else, find the member's workspace and Master Profile using the FINDING THE WORKSPACE rule in the hi5-context skill. If it is not set up, tell the member to run /hi5-setup first and stop. If the member has more than one channel, ask which one first. You need:
- `niche` and `industry`
- `channel_goal` and `content_model`
- `content_categories`
- `competitor_channel_ids`
- The Voice Profile page (for idea titles that sound like them)
- Operator preferences (`output_format`, `number_of_options`, `explanation_level`)
- YouTube Data API key (from Claude Project Instructions as `YOUTUBE_API_KEY`)

## Step 2: Clarify the Research Focus

Ask: "What do you want to research today? You can give me a keyword, a topic,
or say 'competitors' to pull from your tracked channels. Or say 'both' to do
keyword research and competitor research in the same session."

Wait for their answer. If they give a keyword, use it directly. If they say
competitors, use the channel IDs from their Master Profile.

## Step 3: YouTube Keyword Research

*Run this if the member provided a keyword or topic.*

Use the YouTube Data API v3 (`YOUTUBE_API_KEY`) to run two calls:

**Call 1: search.list**
- `q`: the keyword
- `type`: video
- `order`: viewCount
- `maxResults`: 10
- `part`: snippet

**Call 2: videos.list**
- `id`: comma-separated video IDs from Call 1
- `part`: snippet,statistics,contentDetails

For each video, capture:
- Title, URL, channel name, channel ID
- Thumbnail URL, publish date
- View count, like count, comment count
- Description, tags

Present a summary table to the member: title, channel, views, publish date.
Ask if they want to dig into any specific video before moving to idea generation.

## Step 4: Competitor Research

*Run this if the member said competitors or both.*

For each channel ID in their Master Profile:

**Call 1: channels.list**
- `id`: channel ID
- `part`: contentDetails
- Extract the uploads playlist ID

**Call 2: playlistItems.list**
- `playlistId`: uploads playlist ID
- `maxResults`: 5
- `part`: snippet
- Gets the 5 most recent uploads

**Call 3: videos.list**
- `id`: video IDs from Call 2
- `part`: snippet,statistics
- Gets view counts and stats

Present a brief summary per competitor: channel name, most recent 5 videos,
view counts. Note any videos with unusually high views relative to channel size.

## Step 5: Keyword Scoring

For the keyword(s) researched, score competition and opportunity:

**Competition scoring** (from YouTube search results):
- Total results < 10,000 AND avg views of top 10 < 50,000 → Low
- Total results < 100,000 AND avg views of top 10 < 200,000 → Medium
- All others → High

**Trend scoring** (using Google Trends, no API key required):
- Query interest over the past 90 days
- Score 0–100 based on relative interest
- Compare last 30 days vs prior 30 days to determine direction: Rising / Stable / Declining

**Opportunity scoring:**
- Trend score > 60 AND competition = Low → High
- Trend score > 40 AND competition = Low or Medium → Medium
- All others → Low

Update the Notion Keyword Tracker (`keyword_tracker_db_id`) with a new row or
update the existing row for this keyword. Fields to write: Keyword, Competition
Level, Trend Score, Trend Direction, Opportunity Score, YouTube Video Count,
Avg Views Top 10, Last Updated.

## Step 6: Generate Video Ideas

Using the research results and the member's Master Profile, generate 5 video
ideas. Each idea must:

- Be an original angle, do not copy competitor titles
- Match one of the member's Content Categories
- Align with their Channel Goal
- Use title language that sounds like them (apply the Voice Profile)
- Be tagged with: Content Category, Goal alignment, Trend Score, Source

For each idea, present:
- **Title**: what the video would be called
- **Hook / Angle**: 1–2 sentences on the core idea and why it would perform
- **Target Keyword**: the primary keyword to rank for
- **Content Category**: which of their categories it falls under
- **Goal**: Affiliate / Community / Awareness / Mixed
- **Trend Score**: Low / Medium / High
- **Source**: YouTube Research / Competitor Pull

Ask: "Here are 5 ideas based on your research. Want to push all of them to
your Content Planner, select specific ones, or make any changes first?"

## Step 7: Add to the Content Planner

Once the member confirms, create a new row in the Content Planner (`content_planner_db_id`) for each
approved idea with Status set to "Idea" and all fields populated. Title is the video title; put the
hook in Hook / Angle. Set Deliverable Type from `default_deliverable_type` (Long Form if not set).

Confirm: "Done: [X] ideas are now in your Content Planner in Notion. Run /hi5-yt-plan when
you're ready to schedule them."
