# Covers and Images

Claude builds covers itself from the member's Cover Template page, so every cover has the same layout with a new image and new text. Claude never claims to generate images itself.

## Where the images come from
- **The member's Brand folder.** The member keeps approved photos and cutouts in Content/Brand/ (Cutouts, Reference photos, Cover examples) in the synced folder. Claude looks at what is there and picks the right one for the piece (a good expression, a clean background, the same look as the Cover examples). If nothing fits, say so in the row's Needs from member.
- **A still from the video**, if the Cover Template or Content Settings says so for that channel.
- **A new image made in ChatGPT**, when the member needs one that does not exist yet. Use Claude's built-in browser to open the member's ChatGPT, upload the reference photos from Brand/Reference photos, ask for the image, and save the result into Content/Brand/ so it can be reused. Ask the member to sign in if needed.
The choice is saved in Content Settings (cover_image_option), per channel if they differ.

## Exact sizes
| Use | Size |
|---|---|
| YouTube thumbnail | 1280 x 720 |
| Reel or short cover | 1080 x 1920 |
| Static post | 1080 x 1350 |
| Any other post | The size on the Cover Template page |

## Cover tool (Content Settings, cover_tool)
- **A) Claude Design or a Claude artifact (default).** The steps below.
- **B) Canva.** Claude builds or edits the design in the member's Canva with the Canva connector, using the Cover Template and a photo or cutout from Content/Brand/. The member then downloads the design from Canva into the row's Covers folder by hand. Say that once, plainly: "I'll build it in Canva. You download it into the Covers folder yourself, and then I'll tick Cover made." Do not tick Cover made until the member says it is in the folder. Nothing is exported automatically yet. If the Canva connector is not connected, say so and use option A.

## Default: Claude Design or a Claude artifact
1. Read the Cover Template page and the last cover link. Match size, text position, fonts, colors, and logo exactly.
2. Pick the photo or cutout from Content/Brand/ and read the cover text (a few words from the title or hook).
3. Build the cover from the Cover Template in Claude Design, or as a Claude artifact, at the exact pixel size for the use.
4. Export a PNG at the exact size and write it straight into the row's folder in the synced folder (Covers for a video, Exports for a static post), named cover-<use>-<width>x<height>.png. Never upload it through the Drive connector.
5. Read the PNG's width and height from its header and check they match the size exactly. If they do not, redo it.
6. Update the Cover Template page's last cover link, link the file on the row, and tick Cover made.
7. Cover text is short. No income or results claims, no invented facts, nothing that points to a protected class, and the disclosure and brokerage lines the member's Compliance page requires.

## Fallback: HTML and a screenshot
Use this only if Claude Design and artifacts are not available. Build one HTML page at the exact pixel size (no margin, fixed width and height, overflow hidden), open it in Claude's built-in browser, set the window to the cover size at device scale 1, take a PNG screenshot, copy it into the row's folder, and check the size as above. Do not walk the member through any local server steps. If the browser cannot open the page, give the member the layout notes, the size, and the image to place, and tick Cover made only when they say it is done.

## Optional: a CapCut draft
Only for a cover that is built into the first frame of a video: add the image and the text to the draft with capcut_add_image and capcut_add_text. That puts the cover inside the video edit, so it does not replace the PNG for thumbnails or post covers.
