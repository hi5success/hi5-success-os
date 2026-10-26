# Covers and Images

Claude builds covers itself from the member's Cover Template page, so every cover has the same layout with a new image and new text. There is no Canva step in this version. Claude never claims to generate images itself.

## Image options (set in Studio Settings, per channel if they differ)
- **A) A still from the video.** Pull a frame (a good expression, clean background) from the exported video or the edit project.
- **B) A cutout on a textured solid background.** Use a no-background photo from Brand/Cutouts on a textured solid color from the member's brand colors.
- **C) A new image made in ChatGPT.** Use Claude's built-in browser to open the member's ChatGPT, upload the reference photos from Brand/Reference photos, ask for the image, and save the result to the piece's Covers folder. Ask the member to sign in if needed.

## Exact sizes
| Use | Size |
|---|---|
| YouTube thumbnail | 1280 x 720 |
| Reel or short cover | 1080 x 1920 |
| Any other post | The size on the Cover Template page (for example 1080 x 1350) |

## Default: HTML layout, screenshot
1. Read the Cover Template page and the last cover link. Match size, text position, fonts, colors, and logo exactly.
2. Build the cover as one HTML page at the exact pixel size: html and body with no margin, a fixed width and height, and overflow hidden. Use the image and a few words of cover text from the title or hook.
3. Open it in Claude's built-in browser. The browser may block local files, so serve the page from a small local page server on 127.0.0.1 or open it as a data URL.
4. Set the browser window to exactly the cover size (viewport 1280 by 720, or 1080 by 1920), keep the device scale at 1 (css pixels), and take a PNG screenshot.
5. The screenshot tool may only save inside its allowed folders, so save it there first, then copy the file into the row's Covers folder with the Drive connector or the local file tools. Name it cover-<use>-<width>x<height>.png.
5b. If the Drive connector cannot take the image (an image upload has to be sent inline and is large), keep the file in a local folder the member can reach (for example a Hi5 Studio folder in Documents), say the exact path in the row's Log, and ask the member to drag it into the Covers folder. Small files can go through the connector.
6. Read the PNG's width and height from its header and check they match the size exactly. If they do not, redo it. A test run produced exactly 1280 x 720 and 1080 x 1920.
7. Update the Cover Template page's last cover link, link the file on the row, and tick Cover made.
8. Cover text is short (a few words). No income or results claims, no invented facts, and nothing that points to a protected class.

## Optional: a CapCut draft
For a cover that is built into the first frame of a video, add the image and the text to the draft with capcut_add_image and capcut_add_text instead. That puts the cover inside the video edit, not in a separate file, so it does not replace the screenshot for thumbnails or post covers. Use it only when the Style Guide asks for it.

## If the browser is not available
Give the member the exact layout notes, the size, and the image to place, and tick Cover made only when they say it is done.
