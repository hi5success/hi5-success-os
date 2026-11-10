# GHL Location ID and Private Integration Token

Walk the member through these steps in their GoHighLevel sub-account (not the agency view). Each sub-account needs its own token.

## Location ID
1. In the sub-account, open **Settings**, then **Business Profile**.
2. Copy the **Location ID** (also called Sub-Account ID). It is safe to share it in the chat.

## Private Integration Token
1. In the same sub-account, open **Settings**, then **Private Integrations**.
2. Click **Create new Integration**. Name it "Hi5 Claude social".
3. Turn on exactly these scopes:
   - socialplanner/post.write
   - socialplanner/post.readonly
   - socialplanner/account.readonly
   - medias.write
   - medias.readonly
   - locations.readonly
   - users.readonly
4. Click **Create** and copy the token. GHL shows it only once.
5. Do not paste it in the chat. When the Windows box opens, paste it there and click Save.

## Good to know
- The token is saved encrypted by Windows, so only this member's Windows login can read it. It is never in the chat or a plain file.
- To stop Claude from posting, delete the integration in GHL. To use a new token, add the sub-account again with the same name.
- Photos and videos can be up to 25 MB each.
