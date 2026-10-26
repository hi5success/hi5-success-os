# Folders

Made by setup (the top level) and by the Content Manager (one folder per piece), in the member's file location. Every row links to its folder (Asset Folder URL), and every role exports into that folder.

```
Content/
  Long-form/<YYYY-MM-DD Topic>/   Raw, B-roll, Transcript, Exports, Exports/Clips, Covers
  Short-form/<YYYY-MM-DD Topic>/  Raw, B-roll, Transcript, Exports, Covers
  Posts/<YYYY-MM-DD Topic>/       Assets, Exports
  Brand/                          Cutouts, Reference photos, Cover examples
```
- **Date in the name** is the publish date (or the record date if there is no publish date yet). Topic is a short, plain title.
- **Short-form** folders are for one-off shorts only. Clips live in their long-form's Exports/Clips folder.
- **Brand/Cutouts** holds no-background photos for thumbnails and covers. Reference photos feed image option C. Cover examples hold finished covers to match.
- **Covers** inside a piece's folder holds that piece's cover files.
- Only create the pieces the member's picked channels need. Skip the Covers folder if no platform uses a cover.

## Making the folders by file location
- **Google Drive app:** use the Drive connector's create file operation with the folder type, one level at a time (the parent id comes from the level above, so create the siblings of one level together). Text files (a transcript) upload fine. Images are large, so see the covers reference.
- **Dropbox app:** use the Dropbox connector if it can create folders.
- **A local folder:** create them with the local file tools Claude has on the member's computer, inside the folder path saved in Studio Settings.
If the connector cannot create a folder, say so in one line, give the exact folder path to make by hand, and continue. Link every folder in the row's Asset Folder URL (or the local path if there is no link).
