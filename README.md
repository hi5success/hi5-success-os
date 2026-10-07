# Hi5 Success OS

Hi5 Success OS is a plugin for Claude that turns your AI assistant into a full YouTube content engine, without any extra tools or subscriptions. Connect it once, and Claude can research trending videos in your niche, generate content ideas tailored to your goals, build your content calendar in Notion, write scripts in your voice, and track your analytics, all from a single conversation. Everything saves directly to your own Notion workspace, so you always own your data.

---

## What You Need Before Starting

- **Claude paid plan**: Claude Pro or higher at claude.ai
- **Notion account**: free at [notion.so](https://www.notion.so)
- **YouTube Data API key**, free from [Google Cloud Console](https://console.cloud.google.com) (no credit card required for the free tier)

No Node.js. No local setup. No terminal.

---

## How to Install (3 Steps)

**Step 1: Add the plugin in Claude Cowork**

In Claude, open your Project settings and go to **Plugins**. Click **Add from GitHub** and paste in this repository URL. Claude will detect the plugin automatically.

**Step 2: Add your keys to Project Instructions**

In your Project settings, go to **Project Instructions** and add these four lines, filling in your own IDs and key:

```
MASTER_PROFILE_ID: [your Notion Master Profile page ID]
CONTENT_PLANNER_ID: [your Notion Content Planner database ID]
KEYWORD_TRACKER_ID: [your Notion Keyword Tracker database ID]
YOUTUBE_API_KEY: [your YouTube Data API v3 key]
```

You can find each Notion ID by opening the page, clicking **Share**, then **Copy Link**, the long string of characters after the last slash is the ID.

**Step 3: Run the setup interview**

In Claude, type:

> /hi5-yt-setup

Claude will walk you through a short setup process, about 5–10 minutes, and save your personal profile to Notion. You only need to do this once.

---

## Commands

| Command | What It Does |
|---|---|
| **/hi5-yt-setup** | First-time setup: builds your Master Profile in Notion |
| **/hi5-yt-research** | Researches YouTube keywords or competitor channels and generates video ideas |
| **/hi5-yt-plan** | Runs your monthly planning session and builds your Content Calendar |
| **/hi5-yt-script** | Writes a video script or outline in your voice for a scheduled video |

---

## Questions or Support

Visit us at [hi5success.com](https://hi5success.com) or reach out directly through the site.
