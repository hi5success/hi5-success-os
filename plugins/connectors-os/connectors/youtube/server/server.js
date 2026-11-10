// Hi5 YouTube connector. Based on the youtube-manager server (loopback sign-in, one saved login per channel).
// Channels are added only by the installer (-Action add-channel); the launcher decrypts them into HI5_YT_JSON.
// No default channel: every tool names its channel, and privacy is always explicit.
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { CallToolRequestSchema, ListToolsRequestSchema } from "@modelcontextprotocol/sdk/types.js";
import { youtube, auth as gauth } from "@googleapis/youtube";
import { youtubeAnalytics } from "@googleapis/youtubeanalytics";
import fs from "fs";
import path from "path";
import { findChannel, uploadStatus, mediaInside } from "./lib.js";

const ADD_HELP = "Channels are added with /hi5-connector (YouTube, add a channel).";
let store = { client: null, channels: [] };
try { store = JSON.parse(process.env.HI5_YT_JSON || "{}"); } catch { /* reported below */ }
const channels = store.channels || [];
const MEDIA_ROOTS = (process.env.MEDIA_ROOTS || "").split(";").filter(Boolean);

function api(ch) {
  if (!store.client) throw new Error(`The Google client file is not set up yet. ${ADD_HELP}`);
  const auth = new gauth.OAuth2(store.client.client_id, store.client.client_secret);
  auth.setCredentials(ch.tokens);
  return { yt: youtube({ version: "v3", auth }), ya: youtubeAnalytics({ version: "v2", auth }) };
}
const pick = (name) => findChannel(channels, name, ADD_HELP);
const localFile = (p, what) => {
  const f = path.resolve(p);
  if (!fs.existsSync(f)) throw new Error(`${what} not found: ${f}`);
  if (MEDIA_ROOTS.length && !mediaInside(f, MEDIA_ROOTS)) throw new Error(`${what} is outside the allowed folders (${MEDIA_ROOTS.join(", ")}). Run /hi5-connector to add a folder.`);
  return f;
};

const channel = { type: "string", description: "Required. The saved channel name, @handle, or channel ID the member chose for THIS action. Never assume one; ask if unclear." };
const privacy = { type: "string", enum: ["scheduled", "private", "unlisted", "public"], description: "Required, no default. scheduled = private until publish_at, then public (the normal path). unlisted = anyone with the link. public = live now, only when the member clearly said to post now (also set post_now)." };
const publishAt = { type: "string", description: "For scheduled: the publish time in ISO 8601 with a time zone, e.g. 2026-11-14T09:00:00-06:00. Must be in the future." };
const postNow = { type: "boolean", description: "Set true only when the member clearly said to post it publicly now. Needed for privacy public." };
const madeForKids = { type: "boolean", description: "Required on upload: is this video made for kids (YouTube's audience setting)? Ask the member if unknown." };

const TOOLS = [
  { name: "youtube_list_channels", description: "List the YouTube channels saved on this computer (name, title, handle). Never picks one for you.", inputSchema: { type: "object", properties: {} } },
  { name: "youtube_upload_video", description: "Upload a video file from this computer to the named channel, with title, description, tags, category, privacy (no default), schedule, made-for-kids, and an optional thumbnail. Large files take minutes.",
    inputSchema: { type: "object", properties: {
      channel, file_path: { type: "string", description: "Absolute path of the video file" },
      title: { type: "string", description: "Title, up to 100 characters" }, description: { type: "string" },
      tags: { type: "array", items: { type: "string" } }, category_id: { type: "string", description: "Category ID from youtube_list_categories (e.g. 22 People & Blogs, 27 Education)" },
      privacy, publish_at: publishAt, post_now: postNow, made_for_kids: madeForKids,
      thumbnail_path: { type: "string", description: "Optional JPG or PNG under 2 MB, set right after the upload" },
      playlist_id: { type: "string", description: "Optional playlist to add the video to" } },
      required: ["channel", "file_path", "title", "privacy", "made_for_kids"] } },
  { name: "youtube_update_video", description: "Edit an existing video on the named channel: title, description, tags, category, privacy or schedule, made-for-kids. Only the fields given change.",
    inputSchema: { type: "object", properties: {
      channel, video_id: { type: "string" }, title: { type: "string" }, description: { type: "string" },
      tags: { type: "array", items: { type: "string" } }, category_id: { type: "string" },
      privacy, publish_at: publishAt, post_now: postNow, made_for_kids: { type: "boolean" } },
      required: ["channel", "video_id"] } },
  { name: "youtube_set_thumbnail", description: "Set a custom thumbnail (JPG or PNG under 2 MB) on a video of the named channel. The channel must be phone-verified on YouTube for custom thumbnails.",
    inputSchema: { type: "object", properties: { channel, video_id: { type: "string" }, image_path: { type: "string" } }, required: ["channel", "video_id", "image_path"] } },
  { name: "youtube_list_videos", description: "List the newest uploads of the named channel, including private, unlisted, and scheduled videos.",
    inputSchema: { type: "object", properties: { channel, max_results: { type: "number", description: "1 to 50, default 10" } }, required: ["channel"] } },
  { name: "youtube_get_video", description: "Get one video's title, description, tags, category, privacy, schedule, and stats.",
    inputSchema: { type: "object", properties: { channel, video_id: { type: "string" } }, required: ["channel", "video_id"] } },
  { name: "youtube_list_categories", description: "List YouTube video categories (ID and name) for the channel's region.",
    inputSchema: { type: "object", properties: { channel, region: { type: "string", description: "Two-letter region, default US" } }, required: ["channel"] } },
  { name: "youtube_analytics", description: "YouTube Analytics for the named channel or one of its videos over a date range. Default metrics: views, estimatedMinutesWatched, averageViewDuration, subscribersGained. No revenue data.",
    inputSchema: { type: "object", properties: {
      channel, start_date: { type: "string", description: "YYYY-MM-DD" }, end_date: { type: "string", description: "YYYY-MM-DD" },
      metrics: { type: "string", description: "Comma-separated metrics" }, dimensions: { type: "string", description: "Optional, e.g. day, video, country" },
      video_id: { type: "string", description: "Optional: only this video" }, sort: { type: "string", description: "Optional, e.g. -views" },
      max_results: { type: "number" } }, required: ["channel", "start_date", "end_date"] } },
];

const text = (t, isError = false) => ({ content: [{ type: "text", text: typeof t === "string" ? t : JSON.stringify(t, null, 2) }], ...(isError && { isError }) });
const watch = (id) => `https://www.youtube.com/watch?v=${id}`;

async function handle(name, a) {
  if (name === "youtube_list_channels") {
    if (!channels.length) return `No channels saved yet. ${ADD_HELP}`;
    return channels.map(c => ({ name: c.name, title: c.title, handle: c.handle || null, channel_id: c.channelId }));
  }
  const ch = pick(a.channel);
  const { yt, ya } = api(ch);

  if (name === "youtube_upload_video") {
    const status = { ...uploadStatus(a.privacy, a.publish_at, a.post_now), selfDeclaredMadeForKids: a.made_for_kids };
    if (typeof a.made_for_kids !== "boolean") throw new Error("made_for_kids is required. Ask the member whether the video is made for kids.");
    const file = localFile(a.file_path, "Video file");
    const thumb = a.thumbnail_path ? localFile(a.thumbnail_path, "Thumbnail") : null;
    const snippet = { title: a.title, description: a.description || "", tags: a.tags || [], ...(a.category_id && { categoryId: String(a.category_id) }) };
    const res = await yt.videos.insert({ part: ["snippet", "status"], requestBody: { snippet, status }, media: { body: fs.createReadStream(file) } });
    const id = res.data.id, out = { channel: ch.title, video_id: id, url: watch(id), privacy: res.data.status?.privacyStatus, publish_at: res.data.status?.publishAt || null };
    if (thumb) {
      try { await yt.thumbnails.set({ videoId: id, media: { body: fs.createReadStream(thumb) } }); out.thumbnail = "set"; }
      catch (e) { out.thumbnail = `not set: ${e.message}`; }
    }
    if (a.playlist_id) {
      try { await yt.playlistItems.insert({ part: ["snippet"], requestBody: { snippet: { playlistId: a.playlist_id, resourceId: { kind: "youtube#video", videoId: id } } } }); out.playlist = "added"; }
      catch (e) { out.playlist = `not added: ${e.message}`; }
    }
    return out;
  }

  if (name === "youtube_update_video") {
    const p = a.privacy || (a.publish_at ? "scheduled" : null);
    const newStatus = p ? uploadStatus(p, a.publish_at, a.post_now) : null;   // check before calling Google
    const cur =(await yt.videos.list({ part: ["snippet", "status"], id: [a.video_id] })).data.items?.[0];
    if (!cur) throw new Error(`Video ${a.video_id} was not found on ${ch.title}.`);
    // videos.update deletes any writable field left out of a part it receives, so send everything that is there now,
    // minus the read-only fields, and change only what was asked.
    const { publishedAt, channelId, thumbnails, channelTitle, liveBroadcastContent, localized, ...snippet } = cur.snippet;
    const { uploadStatus: _u, failureReason, rejectionReason, madeForKids, ...status } = cur.status;
    if (a.title !== undefined) snippet.title = a.title;
    if (a.description !== undefined) snippet.description = a.description;
    if (a.tags !== undefined) snippet.tags = a.tags;
    if (a.category_id !== undefined) snippet.categoryId = String(a.category_id);
    if (a.made_for_kids !== undefined) status.selfDeclaredMadeForKids = a.made_for_kids;
    if (newStatus) Object.assign(status, { publishAt: undefined }, newStatus);
    const res = await yt.videos.update({ part: ["snippet", "status"], requestBody: { id: a.video_id, snippet, status } });
    return { channel: ch.title, video_id: a.video_id, url: watch(a.video_id), title: res.data.snippet?.title, privacy: res.data.status?.privacyStatus, publish_at: res.data.status?.publishAt || null };
  }

  if (name === "youtube_set_thumbnail") {
    await yt.thumbnails.set({ videoId: a.video_id, media: { body: fs.createReadStream(localFile(a.image_path, "Thumbnail")) } });
    return { channel: ch.title, video_id: a.video_id, thumbnail: "set" };
  }

  if (name === "youtube_list_videos") {
    const uploads = (await yt.channels.list({ part: ["contentDetails"], id: [ch.channelId] })).data.items?.[0]?.contentDetails?.relatedPlaylists?.uploads;
    if (!uploads) return `No uploads found on ${ch.title}.`;
    const ids = (await yt.playlistItems.list({ part: ["contentDetails"], playlistId: uploads, maxResults: Math.min(Math.max(a.max_results || 10, 1), 50) })).data.items?.map(i => i.contentDetails.videoId) || [];
    if (!ids.length) return `No uploads found on ${ch.title}.`;
    const vids = (await yt.videos.list({ part: ["snippet", "status"], id: ids })).data.items || [];
    return vids.map(v => ({ video_id: v.id, title: v.snippet.title, privacy: v.status.privacyStatus, publish_at: v.status.publishAt || null, published: v.snippet.publishedAt, url: watch(v.id) }));
  }

  if (name === "youtube_get_video") {
    const v = (await yt.videos.list({ part: ["snippet", "status", "statistics", "contentDetails"], id: [a.video_id] })).data.items?.[0];
    if (!v) throw new Error(`Video ${a.video_id} was not found on ${ch.title}.`);
    return { video_id: v.id, url: watch(v.id), title: v.snippet.title, description: v.snippet.description, tags: v.snippet.tags || [], category_id: v.snippet.categoryId,
      privacy: v.status.privacyStatus, publish_at: v.status.publishAt || null, made_for_kids: v.status.madeForKids, duration: v.contentDetails.duration, stats: v.statistics };
  }

  if (name === "youtube_list_categories") {
    const items = (await yt.videoCategories.list({ part: ["snippet"], regionCode: (a.region || "US").toUpperCase() })).data.items || [];
    return items.filter(c => c.snippet.assignable).map(c => ({ id: c.id, name: c.snippet.title }));
  }

  if (name === "youtube_analytics") {
    const res = await ya.reports.query({
      ids: "channel==MINE", startDate: a.start_date, endDate: a.end_date,
      metrics: a.metrics || "views,estimatedMinutesWatched,averageViewDuration,subscribersGained",
      ...(a.dimensions && { dimensions: a.dimensions }), ...(a.video_id && { filters: `video==${a.video_id}` }),
      ...(a.sort && { sort: a.sort }), ...(a.max_results && { maxResults: a.max_results }),
    });
    return { channel: ch.title, columns: (res.data.columnHeaders || []).map(h => h.name), rows: res.data.rows || [] };
  }
  throw new Error(`Unknown tool: ${name}`);
}

const server = new Server({ name: "youtube", version: "1.0.0" }, { capabilities: { tools: {} } });
server.setRequestHandler(ListToolsRequestSchema, async () => ({ tools: TOOLS }));
server.setRequestHandler(CallToolRequestSchema, async (req) => {
  try { return text(await handle(req.params.name, req.params.arguments || {})); }
  catch (err) {
    const msg = err?.message || String(err);
    if (msg.includes("invalid_grant")) return text(`This channel's sign-in expired or was removed in Google. Add the channel again with /hi5-connector.`, true);
    if (/quota/i.test(msg)) return text(`YouTube's daily limit for this Google project is used up. Try again tomorrow. (${msg})`, true);
    return text(msg, true);
  }
});
await server.connect(new StdioServerTransport());
