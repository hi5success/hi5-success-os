---
name: hi5-library
description: Builds the member's Coach Library, a Notion swipe file of the social posts and videos they learn from. Logs one link, a batch of links, or a whole saved folder from Instagram, TikTok, Facebook, or YouTube, read in the member's own logged-in browser, and records the creator, the hook, the main point, the business lesson, the pitch if there is one, topics, and why the member liked it. Rerunning a folder adds only the new saves. The library feeds content ideas, the creator advisors, and the Master Coach, and can be searched any time. Read only on every social account. Triggers when the user runs /hi5-library, says "save this reel", "log this post", "add these to my library", "pull my saved reels", "sync my saved folder", "swipe file", "find hooks about...", or "what have I saved about...".
---

# Hi5 Library: The Coach Library

## Purpose
Turn the posts a member already saves into a searchable library of hooks, pitches, and business lessons, and into the raw material for their Master Coach. The member has done the curating by saving; this skill does the logging.

## Core Rules
- **Brain rules.** Before you save anything to the member's workspace, read `../../references/brain-rules.md`: where a new thing goes, never a second copy, no passwords, and one Decisions Log or AI Memory row for a lasting change or correction.
- **Read only on every social account.** Open and read posts. Never like, follow, comment, message, share, unsave, or post anything, and never change a setting.
- **The member's own browser, with their OK.** Social posts are read in the member's own browser (the built-in browser or Claude in Chrome), where they are already logged in. Load that browser's skill before the first step in it. If no browser is available, ask the member to paste the caption and transcript, or upload the video file, and log it that way.
- **Gentle on their account.** Read at most 30 posts in one run, at a normal pace. For a bigger folder, do 30, save them, and say "I logged 30. Want me to keep going?"
- **Never invent.** Log only what the post says or shows. If a post has no words at all (music only, no caption), log what is shown on screen and mark it "visual only". If a post has speech but no transcript was available, mark it "words not read", ask the member to paste the words, and log only the caption and what is shown until they do. Mark such a row by leaving Words read unchecked and starting its Main point with "Words not read." Check Words read on every other row, including "visual only" posts (they have no words to read). The hook is the first spoken line, word for word. If nobody speaks, the hook is the first line of the caption.
- **Save the summary, not the post.** Save the fields below and a short quote of the hook. Never save the full transcript, the video, or images.
- **No duplicates.** Before logging, check the Coach Library for the same link. Skip it and count it as "already saved".
- Where everything is saved, and the safety net if the database is missing: `../hi5-advisor/references/notion.md`.
- **Dollar signs.** Write every $ as \$ in anything you save to Notion (see `../hi5-advisor/references/notion.md`).
- Write in plain words. Never use em dashes in anything you say or write. Before you send anything, scan your message for em dashes and replace each one with a comma, a colon, or a new sentence.

---

## Step 1: Scan and choose

Find the workspace and the Coach Library using `../hi5-advisor/references/notion.md`. Say in one line what is there, for example "Your library has 84 posts from 12 creators. Your synced folders: Business advice (Instagram), Client stories (TikTok)." Then do what the member asked, or ask:

> 1. Log a link or a batch of links
> 2. Pull a saved folder (or sync one I already pulled)
> 3. Search my library

## Step 2: Log links

Take every link the member pasted. For each one:
1. Open it in the member's browser and read the caption, the on-screen text, and the spoken words (the platform's own transcript or captions if it shows them; otherwise ask the member to paste or upload, and say which posts).
2. Fill the entry (see Fields below).
3. Ask "Why did you like this one?" only when the member logged a single link. For a batch, skip it and say they can add it any time.

## Step 3: Pull a saved folder

1. Ask which platform and which folder or collection, such as "Instagram, saved collection Business advice", "TikTok, favorites collection Real estate" (real estate), or "TikTok, favorites collection Dental marketing" (a dental office). On YouTube, a playlist counts. Also ask for the folder's link, or copy the address from the browser once it is open.
2. Open the folder in the member's browser. If they are not logged in, ask them to log in there and say when they are done. Never type their password.
3. List the posts newest first, skip any already in the library, and log up to 30 (see Core Rules).
4. Save the folder as a synced folder: add a `- platform | folder name | folder URL | last synced <date and time>` bullet under a "Library Folders" heading in the Master Profile (inside its own section, never at the end of the page). Next time, "sync my folders" opens each URL and logs only the new saves. If a saved bullet has no URL, ask the member for it once and write it in.
5. If the session can make scheduled tasks and reach the member's computer, offer once: "Want me to sync these folders every week? I can also check your creator advisors for new content once a month." Set up only what they say yes to:
   - **Weekly sync:** each run syncs every folder under Library Folders and logs only new saves.
   - **Monthly creator check:** each run searches for each Mentor and Public figure advisor's newest long-form content since its Date, and for new Coach Library rows from that creator. It never changes an advisor. It saves what it found to a "Board Updates" section of the Master Profile (inside its own section, never at the end of the page), one bullet per finding: `- advisor key | what's new | found <date>`. Skip anything already listed. The next time the member runs /hi5-board or /hi5-advisor, offer in one line: "There's new content from [names]. Want me to refresh those advisors?" Refresh with /hi5-advisor Step 5 on a yes, which clears that creator's lines. On a no, add `| declined <date>` to those lines and do not offer them again until the next monthly check finds newer content.

## Fields

Each Coach Library row:
- Title: a short name for the post's idea
- Creator, Platform, Link, Posted (date), Saved (now, with the time)
- Use (multi-select): Hook, Content idea, Business advice, Sales pitch, Story
- Topics (multi-select): reuse the library's existing topics. If none fits, add the new topic to the database first, then save the row (see `../hi5-advisor/references/notion.md`)
- Folder: the saved folder it came from, if any
- Hook: the first spoken line, word for word (if nobody speaks, the first line of the caption)
- Main point: one or two lines, in your words
- Lesson: the business lesson in one line, if there is one
- Pitch: how it sells, in one line (the offer, the call to action), if it sells
- Why I liked it: the member's words, or empty
- Words read (checkbox): checked when the words were read or pasted, or the post has none (visual only); unchecked when the row is marked "words not read"
- Status (select): New, Used

## Step 4: Search

When the member asks what they have ("hooks about listings" for a real estate member, "hooks about new patients" for a dental office, "advice on pricing", "what did [creator name] say about hiring"), query the Coach Library by Topics, Use, Creator, and words in the fields. Show up to ten matches: the title, creator, the hook or lesson, and the link. When the member asks to fix the unread posts ("show me posts with words not read", "fix my unread posts"), list the rows with Words read unchecked, ask for the pasted words one post at a time, fill in the Hook, Main point, Lesson, and Pitch from them, and check Words read. Offer one next step that fits, such as "Want three video ideas from these?" (run /hi5-content-plan and choose Write a script, or run /hi5-social, with them) or "Want to ask your board about this?"

## Finish

Say how many posts were logged, skipped as already saved, or need a paste, and where: "Saved to your Coach Library in your Hi5 workspace." Once the library has 20 or more Business advice or Sales pitch posts and no Master Coach exists, offer: "You've saved enough to build your Master Coach. Want me to? Run /hi5-advisor." You can run /hi5-next any time and I'll tell you your best next step.
