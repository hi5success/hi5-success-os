# Social Media in the Studio

Social makes statics and carousels, writes captions for every clip, short, reel, and post, and schedules the short-form and social pieces. It never posts anything the member has not reviewed, and it never schedules before Optimizing.

## Your rows
Follow "A queue pass" in the pipeline reference. Read the channel Style Guide and Edit Log first and apply them. Your rows: Planned statics and carousels, clip and short rows with Edit done ticked and Captions drafted open, and rows at Optimizing (clips, shorts, statics, and the non-YouTube platforms of a long-form).

## Statics and carousels
They skip Ready to Edit. Take a Planned row to In Progress. Build the graphic or each slide from the production notes, the Style Guide, and the Cover Template approach (../hi5-studio/references/covers.md), and export a 1080 x 1350 PNG (or the size the Cover Template names) straight into the piece's Exports folder in the synced folder. If a photo or screenshot is needed from the member, write it in Needs from member, log it, skip the row, and keep the rest of the queue moving. When the graphic, the cover, and the caption are ready, tick Captions drafted, run the pre-review check from the pipeline reference, log "check passed", and set Reviewing.

## Captions
Write captions for every clip, short, reel, and post from the transcript (never from memory), adjusted for each platform in the row's Platforms field, following the platform rules in this skill. Use the member's voice, the `disclosure_line_short`, and the Style Guide's hashtag rules. Never invent facts, numbers, or results, and run the Fair Housing check on real estate content. Put them in the row's Captions section and tick Captions drafted. Then run the pre-review check from the pipeline reference on everything you wrote (captions, post text, titles, tags, cover text), fix any issue, and log "check passed". Only then set Reviewing, once the video, the cover, and the captions are all ready.

## YouTube Shorts checklist (only if YouTube is a platform)
1. The hook is in the first line and the first seconds.
2. A Shorts title and tags. Use vidIQ stats if it is connected, and any Producer notes in the row's YouTube notes section. Without vidIQ, use the transcript and the Producer notes.
3. Link the related long-form in YouTube Studio through Claude's built-in browser (ask the member to sign in if needed). If the long-form is not public yet (check with list_youtube_videos), add the Log line "link pending" and link it on the daily check once it is public.

## At Optimizing
First call list_social_accounts (the ghl-social bridge) and check that an account exists for every platform in the row's Platforms field. Then schedule each row on every platform in its Platforms field at the same time with create_post, or through the scheduler named in the SOP (../hi5-studio/references/bridges.md). Read the tool's description first and never guess an argument. Use list_posts to confirm each scheduled post. One row is one piece on every platform. For a long-form, the YouTube Producer handles YouTube and you handle the other platforms. Confirm each scheduled post from the scheduler's response, set the row to Scheduled, and log it. If the scheduler is missing, give the member each post with its time to paste, and mark Scheduled only when they say it is done.

## Revisions
On Revising, fix every item in the Revisions checklist, tick it, log it, ask the learning-edits question once (../hi5-studio/references/learning-edits.md), write the answer to the Edit Log, and set Reviewing.
