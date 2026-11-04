# Folders

Made by setup (the top level) and by the Content Manager (one folder per project, created with the video row), in the member's synced folder (`file_storage` in the Master Profile, or `synced_folder_path` in Content Settings). The row links to its folder in Asset Folder URL, and every role works in it. The layout comes from the channel's SOP, with this default as the fallback.

```
Content/
  [Channel]/
    [Video Title]/               <- named after the project, no date
      Clips/                     <- raw footage (members may call it Raw Footage)
      B-Roll/                    <- photos and videos for the edit
      Exports/
        [Video Title] - Final.mp4
        [Video Title] - Thumbnail.png
        [Video Title] - Transcript.txt
        Short Form/
          Reel 1 - Intro Hook - [Video Title].mp4
          Reel 1 - Intro Hook - [Video Title] - Cover.png
          Reel 2 - [hook] - [Video Title].mp4
          Reel 2 - [hook] - [Video Title] - Cover.png
  Brand/                         <- cutouts, reference photos, cover examples
```

## Rules
- **Never rename a folder after it is created.**
- If the name already exists, add " 2". Never merge into an existing project.
- The Blog Writer reads the transcript from Exports.
- Brand photos stay in Content/Brand/ (Cutouts, Reference photos, Cover examples).
- Statics and carousels use a project folder with Assets and Exports.
- Transcripts, covers, and finals are files in Exports, next to the video they belong to. There is no separate Transcript or Covers folder.
- Only create the folders the roles in use need. No video editing means no Clips, B-Roll, or Short Form folders.
- **No synced folder:** skip the folders and ask the member for links.

## The synced folder
Everything lives in the member's synced folder: the Google Drive, Dropbox, or OneDrive desktop app, or a plain local folder. Setup asks for that path once and saves it as `file_storage` in the Master Profile (and in Content Settings as synced_folder_path). Every role reads and writes files straight into it with the local file tools, never through the Drive connector. The Drive connector is only for getting a share link. The CapCut bridge exports into this folder and splits files that are over the size limit, so no role adds any export or split step.
- Create the folders with the local file tools, inside the saved path.
- If the path does not exist or cannot be written, say so in one line, ask the member for the right path, and update the saved path.
- Link each folder in the row's Asset Folder URL (a share link from the connector if the member wants one, otherwise the local path).
