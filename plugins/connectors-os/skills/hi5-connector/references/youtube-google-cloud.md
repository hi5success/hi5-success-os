# Your own Google project for YouTube

Each member makes their own free Google Cloud project. It gives them their own YouTube limits (about 100 uploads a day) and needs no review by Google, because it is for their own use. A team uses the team's project and client file instead.

Google renames these screens often. Go by what the screenshot shows, not by exact button names, and never guess: if the screen looks different, ask for a screenshot of the whole page.

## Before starting
Say: "You'll sign in to Google Cloud with the Google account that owns or manages your YouTube channel. It's free; Google may ask you to accept its terms the first time, and that click is yours."

## The steps (a screenshot after each)
1. **Open** console.cloud.google.com and sign in (the member). Accept Google's terms if asked (the member).
2. **New project.** Click the project picker at the top, then New project. Name it `Hi5 YouTube`, click Create, and make sure it is selected at the top.
3. **Turn on two APIs.** In the search bar, open **YouTube Data API v3** and click Enable. Then open **YouTube Analytics API** and click Enable.
4. **Google Auth Platform** (it may be called OAuth consent screen). Click Get started.
   - App name: `Hi5 YouTube`. User support email: theirs.
   - Audience: **External**.
   - Contact email: theirs. Agree to the policy (the member), then Create.
5. **Audience: Publish app**, then Confirm. Check the screenshot says **In production**. This matters: in Testing, Google signs the channel out every 7 days.
6. **Clients: Create client.**
   - Application type: **Desktop app**. Name: `Hi5 YouTube`. Create.
   - Click **Download JSON** (the member) and save it in Documents.
   - Check the screenshot says Desktop, not Web application.
7. Ask for the downloaded file's full path, for example `C:\Users\<name>\Documents\client_secret_....json`. Never open the file or paste it into the chat. Run `set-client` with that path.

## What the member will see when adding a channel
- Google's account picker, then (for a channel on a brand account) "Choose an account or brand account": pick the channel.
- "Google hasn't verified this app": click Advanced, then Go to Hi5 YouTube. It is their own app.
- A page listing what the app can do (manage YouTube videos, view YouTube Analytics): click Allow or Continue (the member).
- "Connected: <channel>". They can close the tab.

## Rules
- Claude never signs in, never accepts terms or policies, and never clicks Allow or Continue on a Google consent page. When the browser reaches one of those, stop and say exactly what the member must click.
- Never type, read aloud, or paste a client secret or token. The client file stays on the computer.
- No client file or credential ever goes into a repository, a Notion page, or a chat. A team keeps its client file in its own private Drive folder and points the installer at it.
- Each Google project is for one member or one team.
