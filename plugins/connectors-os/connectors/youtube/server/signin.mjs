// Run by the installer (-Action add-channel), never by Claude. Opens Google sign-in in the browser on a one-time local page,
// the member picks the channel (Google shows the brand-account picker) and clicks Allow. Prints one JSON line to stdout:
// {channelId, title, handle, tokens}. The installer encrypts it; nothing is written here.
import http from "http";
import { spawn } from "child_process";
import { youtube, auth as gauth } from "@googleapis/youtube";

const SCOPES = [
  "https://www.googleapis.com/auth/youtube",            // upload, edit, thumbnails
  "https://www.googleapis.com/auth/youtube.readonly",   // YouTube Analytics now requires it
  "https://www.googleapis.com/auth/yt-analytics.readonly",
];
const client = JSON.parse(process.env.HI5_YT_CLIENT || "{}");
if (!client.client_id) { console.error("No Google client set up."); process.exit(2); }

const page = (msg) => `<!doctype html><meta charset="utf-8"><title>Hi5 YouTube</title><body style="font-family:system-ui;max-width:520px;margin:80px auto;text-align:center"><h2>${msg}</h2><p>You can close this tab and go back to Claude.</p></body>`;
const esc = (s) => String(s).replace(/[&<>"']/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));

const srv = http.createServer(async (req, res) => {
  const url = new URL(req.url, "http://127.0.0.1");
  if (url.pathname !== "/") { res.writeHead(404).end(); return; }
  const code = url.searchParams.get("code");
  if (!code) { res.writeHead(400, { "Content-Type": "text/html" }).end(page("Sign-in was cancelled.")); finish(3, "Sign-in was cancelled in the browser."); return; }
  try {
    const o = new gauth.OAuth2(client.client_id, client.client_secret, redirectUri);
    const { tokens } = await o.getToken(code);
    if (!tokens.refresh_token) throw new Error("Google did not return a lasting sign-in. Try again.");
    o.setCredentials(tokens);
    const ch = (await youtube({ version: "v3", auth: o }).channels.list({ part: ["snippet"], mine: true })).data.items?.[0];
    if (!ch) throw new Error("That Google account has no YouTube channel. Try again and pick the channel (or its brand account).");
    res.writeHead(200, { "Content-Type": "text/html" }).end(page(`Connected: ${esc(ch.snippet.title)}`));
    process.stdout.write(JSON.stringify({ channelId: ch.id, title: ch.snippet.title, handle: ch.snippet.customUrl || null, tokens }) + "\n");
    finish(0);
  } catch (e) {
    res.writeHead(500, { "Content-Type": "text/html" }).end(page(`Something went wrong: ${esc(e.message)}`));
    finish(4, e.message);
  }
});
let redirectUri;
function finish(code, msg) { if (msg) console.error(msg); srv.close(); setTimeout(() => process.exit(code), 200); }
srv.listen(0, "127.0.0.1", () => {
  redirectUri = `http://127.0.0.1:${srv.address().port}`;
  // select_account shows the account and brand-account picker, consent makes Google return a refresh token every time.
  const authUrl = new gauth.OAuth2(client.client_id, client.client_secret, redirectUri)
    .generateAuthUrl({ access_type: "offline", prompt: "select_account consent", scope: SCOPES });
  spawn("rundll32", ["url.dll,FileProtocolHandler", authUrl], { detached: true, stdio: "ignore" }).on("error", () => {}).unref();
  console.error(`If no browser opened, open this link: ${authUrl}`);
  setTimeout(() => finish(5, "Nobody finished the Google sign-in within 10 minutes."), 10 * 60 * 1000).unref();
});
