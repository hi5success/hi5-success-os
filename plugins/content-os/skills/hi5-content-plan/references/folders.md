# Folders

Made by setup (the top level) and by the Content Manager (one folder per piece), in the member's file location. Every row links to its folder (Asset Folder URL), and every role exports into that folder.

```
Content/
  Long-form/<YYYY-MM-DD Topic>/   Raw, B-roll, Exports, Exports/Clips, Covers
  Short-form/<YYYY-MM-DD Topic>/  Raw, B-roll, Exports, Covers
  Posts/<YYYY-MM-DD Topic>/       Assets, Exports
  Brand/                          Cutouts, Reference photos, Cover examples
```
- **Date in the name** is the publish date (or the record date if there is no publish date yet). Topic is a short, plain title.
- **Short-form** folders are for one-off shorts only. Clips live in their long-form's Exports/Clips folder.
- **Brand/Cutouts** holds no-background photos for thumbnails and covers. Reference photos feed image option C. Cover examples hold finished covers to match.
- **Transcripts** are saved as files in the same folder as the video they belong to (Exports for a long-form or short, Exports/Clips for a clip), so there is no separate Transcript folder.
- **Covers** inside a piece's folder holds that piece's cover files.
- Only create the folders the roles in use need. No video editing means no Long-form or Short-form folders. No social media means no Posts folder. Skip the Covers folder if no platform uses a cover.

## The synced folder
Everything lives in the member's synced folder: the Google Drive, Dropbox, or OneDrive desktop app, or a plain local folder. Setup asks for that path once and saves it in Content Settings (synced_folder_path). Every role reads and writes files straight into it with the local file tools, never through the Drive connector. The Drive connector is only for getting a share link. The CapCut bridge exports into this folder and splits files that are over the size limit, so no role adds any export or split step.
- Create the folders with the local file tools, inside the saved path.
- If the path does not exist or cannot be written, say so in one line, ask the member for the right path, and update Content Settings.
- Link each folder in the row's Asset Folder URL (a share link from the connector if the member wants one, otherwise the local path).
