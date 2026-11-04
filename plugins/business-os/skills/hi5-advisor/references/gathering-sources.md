# Gathering Sources for a Mentor or Public Figure

The goal is 10 to 30 good sources: enough to see how the person really thinks, not everything they ever said. Depth beats volume. Long-form beats clips. Most creators say the same ideas in their long videos and podcasts that they cut into short clips, so long-form carries almost all the value.

## What counts
- Best: long interviews and podcasts, keynotes, their own long videos, their books, essays and newsletters they wrote, courses the member bought.
- Good: their blog posts, long social posts and captions, show notes with detailed summaries.
- Skip: short clips without much said, reaction videos, other people's summaries of them, quote sites, fan pages, anything AI-written, and anything behind a login the member does not own.

## Which way to fetch, by source

Pick the first route that works for each source. Never guess what a video says from its title.

| Source | Route 1 | Route 2 | Route 3 |
|---|---|---|---|
| YouTube video | The fetch script, on the member's computer (see below) | Web fetch of the video page, if it returns a transcript | Ask the member to paste the transcript: open the video, click More under the title, then Show transcript, and copy it |
| Podcast | Web fetch of the episode page or the podcast's own transcript page | The fetch script on its YouTube version, if there is one | Member pastes or uploads a transcript |
| Article, blog, newsletter | Web fetch | The fetch script | Member pastes the text |
| PDF | Member uploads it | The fetch script | |
| Book | The member's own notes or highlights, pasted or uploaded, plus the author's public talks about the book. Never reproduce a book | | |
| Posts the member saved | The Coach Library: every row from this creator is already a source | | |
| Instagram, TikTok, Facebook reels | The member's own browser (see below) | Member pastes captions or transcripts, or uploads the video | Skip when the creator's short-form only repeats their long-form |
| LinkedIn or X posts | The member's own browser, or member pastes the posts | | |

### The fetch script (`scripts/fetch.mjs`)
Adapted from Roast Room (MIT license, see `LICENSE-roast-room.txt`). It turns web pages into text, YouTube videos into transcripts, and PDFs into text, and keeps the source id table. It needs Node 20 or newer and internet access, so it only works where the member's own computer runs the command (Claude Code, or the desktop app with a shell on their computer). The cloud workspace cannot reach these sites; there, use web fetch and pasting instead and do not retry the script.

Run it on the member's computer with a build folder outside their Notion and project files, for example `~/hi5-advisor-build/<key>`:
- Fetch links: `node <skill dir>/scripts/fetch.mjs <build dir> <url> [<url> ...]`
- Add a file the member gave you: `node <skill dir>/scripts/fetch.mjs <build dir> --add <file> --title "..." [--url ...] [--date YYYY-MM-DD]`
- See what you have: `node <skill dir>/scripts/fetch.mjs <build dir> --manifest`

YouTube works better if `yt-dlp` is installed; without it the script uses YouTube's own captions. PDFs need `pdftotext`; without it, read the PDF yourself and `--add` the text. A line marked `thin` means a login wall, a paywall, or a page built by JavaScript: try another route. When the brain is saved, delete the build folder (ask first), so no raw content stays on the member's computer.

### Instagram, TikTok, and Facebook
These sites show almost nothing without a login, so plain fetching fails. Many creators post short-form ideas they never cover in long-form, so offer it:
1. Ask: "Does [Name] post things on Instagram or TikTok that aren't in their long videos? If so, I can read some in your browser, where you're logged in."
2. On a yes, use the member's own browser (the built-in browser or Claude in Chrome), loading that browser's skill first. If they are not logged in, ask them to log in there and say when they are done; never type their password. Open the creator's profile and read the caption, on-screen text, and spoken words (the platform's transcript or captions, when it shows them) of 10 to 30 posts: pinned and most viewed first, then the newest. Follow the read-only and pacing rules in `../../hi5-library/SKILL.md`.
3. Log each post as a Coach Library row (so the member keeps it in their swipe file too) and as a source (kind post) with its link and date.
If no browser is connected, ask the member to paste captions or transcripts, or upload the video files, or skip.

## Steps
1. **Ask the member for their favorites first.** "Which videos, podcasts, books, or posts of theirs have helped you most? Paste links, or just name them." Their picks matter most, because that is the advisor they want.
2. **Find the rest.** Search the web for the person's own channel, podcast, site, and books, then their best-known long interviews. Prefer their own channels and official pages. Show the member the proposed list (title, kind, date, link) and wait for their OK before reading.
3. **Read each one** using the routes above.
4. **Log every source** as you go: the next id (S001, S002, ...), title, kind, date, and link. Keep source notes in the chat or the build folder only. Never save raw transcripts or full articles to Notion.
5. **Stop when it repeats.** When new sources stop adding new principles or positions, say so and stop, even under 10. With fewer than 5 sources, tell the member the advisor will be thin and mark it Draft.

## Extracting the brain
Work section by section from `brain-spec.md`. For every principle, framework, position, story, and quote, note the source id it came from. Paraphrase in your own words everywhere except the Quotes section. A quote must appear word for word in a source you read; otherwise drop it. When two sources disagree, keep the newer one and note the change in Positions. Mark any principle seen in only one source (single source).

## The rules that never bend
- Quotes come from raw text only. Web fetch can return a summary instead of the page, so treat what it returns as material to paraphrase, never to quote. Take a quote only from text the member pasted, from the fetch script's files, or from the raw page itself.
- A simulation, always. The brain, every meeting, and every answer label the advisor as simulated. It never claims to be the person and never says the person agreed, endorsed, or reviewed anything.
- Public work only, or the member's own material. Private people (a coach, a manager, a friend) need their OK first: "Make sure you have their OK to build an advisor from their material."
- For the member's eyes only. The member may not use the advisor's name, face, or words to market their own business, and never as an endorsement. Say this once when the build is done.
- No faces. Board advisors never download or make photos or likenesses of real people.
