---
name: hi5-library
description: Builds the member's Coach Library, a Notion swipe file of the social posts and videos they learn from. Logs one link, a batch of links, or a whole saved folder from Instagram, TikTok, Facebook, or YouTube, read in the member's own logged-in browser, and records the creator, the hook, the main point, the business lesson, the pitch if there is one, topics, and why the member liked it. Rerunning a folder adds only the new saves. The library feeds content ideas, the creator advisors, and the Master Coach, and can be searched any time. Read only on every social account. Triggers when the user runs /hi5-library, says "save this reel", "log this post", "add these to my library", "pull my saved reels", "sync my saved folder", "swipe file", "find hooks about...", or "what have I saved about...".
---

# Hi5 Library: The Coach Library

## Purpose
Turn the posts a member already saves into a searchable library of hooks, pitches, and business lessons, and into the raw material for their Master Coach. The member has done the curating by saving; this skill does the logging.

## Core Rules
- **Read only on every social account.** Open and read posts. Never like, follow, comment, message, share, unsave, or post anything, and never change a setting.
- **The member's own browser, with their OK.** Social posts are read in the member's own browser (the built-in browser or Claude in Chrome), where they are already logged in. Load that browser's skill before the first step in it. If no browser is available, ask the member to paste the caption and transcript, or upload the video file, and log it that way.
- **Gentle on their account.** Read at most 30 posts in one run, at a normal pace. For a bigger folder, do 30, save them, and say "I logged 30. Want me to keep going?"
- **Never invent.** Log only what the post says or shows. If a post has no words (music only, no caption), log what is shown on screen and mark it "visual only". A hook is the post's own opening line, word for word.
- **Save the summary, not the post.** Save the fields below and a short quote of the hook. Never save the full transcript, the video, or images.
- **No duplicates.** Before logging, check the Coach Library for the same link. Skip it and count it as "already saved".
- Where everything is saved, and the safety net if the database is missing: `../hi5-advisor/references/notion.md`.
- Write in plain words. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Step 1: Scan and choose

Find the workspace and the Coach Library using `../hi5-advisor/references/notion.md`. Say in one line what is there, for example "Your library has 84 posts from 12 creators. Your synced folders: Business advice (Instagram), Real estate (TikTok)." Then do what the member asked, or ask:

> 1. Log a link or a batch of links
> 2. Pull a saved folder (or sync one I already pulled)
> 3. Search my library

## Step 2: Log links

Take every link the member pasted. For each one:
1. Open it in the member's browser and read the caption, the on-screen text, and the spoken words (the platform's own transcript or captions if it shows them; otherwise ask the member to paste or upload, and say which posts).
2. Fill the entry (see Fields below).
3. Ask "Why did you like this one?" only when the member logged a single link. For a batch, skip it and say they can add it any time.

## Step 3: Pull a saved folder

1. Ask which platform and which folder or collection, such as "Instagram, saved collection Business advice" or "TikTok, favorites collection Real estate". On YouTube, a playlist counts.
2. Open the folder in the member's browser. If they are not logged in, ask them to log in there and say when they are done. Never type their password.
3. List the posts newest first, skip any already in the library, and log up to 30 (see Core Rules).
4. Save the folder as a synced folder: add a `- platform | folder name | last synced date` bullet under a "Library Folders" heading in the Master Profile (inside its own section, never at the end of the page). Next time, "sync my folders" reopens each one and logs only the new saves.
5. If the session can make scheduled tasks and reach the member's computer, offer once: "Want me to sync these folders every week? I can also check your creator advisors for new content once a month." Set up only what they say yes to:
   - **Weekly sync:** each run syncs every folder under Library Folders and logs only new saves.
   - **Monthly creator check:** each run searches for each Mentor and Public figure advisor's newest long-form content since its Date, and for new Coach Library rows from that creator. It never changes an advisor. It saves a short list of what it found to a "Board Updates" section of the Master Profile (inside its own section, never at the end of the page), and the next time the member runs /hi5-board or /hi5-advisor, offer in one line: "There's new content from [names]. Want me to refresh those advisors?" Refresh with /hi5-advisor Step 5 on a yes, then clear those lines.

## Fields

Each Coach Library row:
- Title: a short name for the post's idea
- Creator, Platform, Link, Posted (date), Saved (today)
- Use (multi-select): Hook, Content idea, Business advice, Sales pitch, Story
- Topics (multi-select): reuse the library's existing topics before adding new ones
- Folder: the saved folder it came from, if any
- Hook: the opening line, word for word
- Main point: one or two lines, in your words
- Lesson: the business lesson in one line, if there is one
- Pitch: how it sells, in one line (the offer, the call to action), if it sells
- Why I liked it: the member's words, or empty
- Status (select): New, Used

## Step 4: Search

When the member asks what they have ("hooks about listings", "advice on pricing", "what did [creator name] say about hiring"), query the Coach Library by Topics, Use, Creator, and words in the fields. Show up to ten matches: the title, creator, the hook or lesson, and the link. Offer one next step that fits, such as "Want three video ideas from these?" (run /hi5-content-plan and choose Write a script, or run /hi5-social, with them) or "Want to ask your board about this?"

## Finish

Say how many posts were logged, skipped as already saved, or need a paste, and where: "Saved to your Coach Library in your Hi5 workspace." Once the library has 20 or more Business advice or Sales pitch posts and no Master Coach exists, offer: "You've saved enough to build your Master Coach. Want me to? Run /hi5-advisor." You can run /hi5-next any time and I'll tell you your best next step.
