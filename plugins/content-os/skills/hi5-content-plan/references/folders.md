# Folders

Made by setup (the top level) and by the Content Manager (one folder per project, created with the video row), in the member's synced folder (`file_storage` in the Master Profile, or `synced_folder_path` in Content Settings). The row links to its folder in Asset Folder URL, and every role works in it. The layout comes from the channel's SOP, with this default as the fallback.

```
Content/
  [Channel]/
    [Video Title]/               <- named after the project, no date
      Clips/                     <- raw footage (members may call it Raw Footage)
      B-Roll/                    <- photos and videos for the edit, and the graphics Claude makes
        Footage/                 <- optional: the member's own B-roll
        Made by Claude/          <- optional: Claude Motion videos, motion graphics, and stills
      Export/
        [Video Title] - Final.mp4
        [Video Title] - Thumbnail.png
        [Video Title] - Transcript.txt
        [Video Title] - Transcript.srt
        Shorts/                  <- only for reels cut from a long-form
          Reel 1 - Intro Hook - [Video Title].mp4
          Reel 1 - Intro Hook - [Video Title] - Cover.png
  Brand/                         <- cutouts, reference photos, cover examples, Video Preferences.md
```

A short-form-only video (no long-form) has no Shorts folder: its final, cover, and transcript go straight into its own Export folder.

## Rules
- **Never rename a folder after it is created.** Projects made before Content OS 2.2.0 use `Exports` and `Exports/Short Form`. When those exist, keep using them for that project and never rename them. New projects use `Export` and `Export/Shorts`.
- If the name already exists, add " 2". Never merge into an existing project.
- The Blog Writer and the YouTube role read the transcript from Export.
- Brand photos stay in Content/Brand/ (Cutouts, Reference photos, Cover examples).
- Statics and carousels use a project folder with Assets and Export.
- Transcripts, covers, and finals are files in Export, next to the video they belong to. There is no separate Transcript or Covers folder.
- Only create the folders the roles in use need. No video editing means no Clips, B-Roll, or Shorts folders.
- **No synced folder:** skip the folders and ask the member for links.

## The synced folder (the root)
Everything lives in the member's synced folder: the Google Drive, Dropbox, or OneDrive desktop app (a Google shared drive works too), or a plain local folder. Setup asks for that root once and saves it as `file_storage` in the Master Profile (and in Content Settings as synced_folder_path). Never ask for a new folder for each video. Every role reads and writes files straight into it with the local file tools, never through the Drive connector. The Drive connector is only for getting a share link. Finished videos are exported from CapCut into this folder, or moved here with capcut_move_export, and no role splits a file into pieces.
- Create the folders with the local file tools, inside the saved path.
- If the path does not exist or cannot be written, say so in one line, ask the member for the right path, and update the saved path.
- Link each folder in the row's Asset Folder URL (a share link from the connector if the member wants one, otherwise the local path).

## Finding a video the member names
The member names a place and a file, for example "inside the YouTube folder there is a video called Market Update". Search the saved root for it with the local file tools (folder and file names, not case sensitive). If one file matches, say its full path in one line and use it. If several match, list them and ask which. If none match, say where you looked and ask for the folder. A direct folder link or a local path the member gives works the same way, for that request only.
- **A link with no desktop app:** the Drive connector can find and read a file, but CapCut needs the file on this computer. Ask the member to install the Google Drive (or Dropbox, or OneDrive) desktop app, or to download the file into a local folder, and continue from that path.

## Teams working on client folders
A team editor is given one client's folder (for example `[Shared drive]/Clients/[Client]/YouTube`) and treats it as the root for that work. Work only inside that folder, use that client's Brand folder, Style Guide, and Video Preferences, and never open, read, or write another client's folder. If a request points outside it, stop and ask.
