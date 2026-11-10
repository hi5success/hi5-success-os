#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import { toUtc, resolveMediaPath, mimeOf, mergeAccounts } from './lib.js';

// Kept outside the install folder so extension updates don't wipe extra sub-accounts.
const ACCOUNTS_FILE = process.env.GHL_ACCOUNTS_FILE || path.join(os.homedir(), '.hi5-ghl-social', 'accounts.json');
const API = 'https://services.leadconnectorhq.com';
const MAX_UPLOAD = 25 * 1024 * 1024; // GHL media upload limit

// Hi5 Connector: the launcher decrypts the member's Windows-encrypted sub-accounts and passes them in GHL_ACCOUNTS_JSON,
// so no token sits in a plain file. Without it, fall back to the accounts file (re-read every call).
function loadAccounts() {
  if (process.env.GHL_ACCOUNTS_JSON) return mergeAccounts(JSON.parse(process.env.GHL_ACCOUNTS_JSON));
  return mergeAccounts(fs.existsSync(ACCOUNTS_FILE) ? JSON.parse(fs.readFileSync(ACCOUNTS_FILE, 'utf8')) : {});
}

function getAccount(name) {
  const all = loadAccounts();
  const key = Object.keys(all).find((k) => k.toLowerCase() === String(name).toLowerCase().trim());
  if (!key) throw new Error(`No sub-account named "${name}". Known: ${Object.keys(all).join(', ') || 'none yet (run /hi5-connector and add a GHL sub-account)'}`);
  return { name: key, ...all[key] };
}

async function ghl(acct, method, p, body) {
  const headers = { Authorization: `Bearer ${acct.token}`, Version: '2021-07-28', Accept: 'application/json' };
  if (body && !(body instanceof FormData)) headers['Content-Type'] = 'application/json';
  const res = await fetch(API + p, { method, headers, body: body instanceof FormData ? body : body && JSON.stringify(body) });
  const text = await res.text();
  let data;
  try { data = JSON.parse(text); } catch { data = text; }
  if (!res.ok) {
    const msg = typeof data === 'object' ? [].concat(data.message || data.error || text).join('; ') : text;
    const err = new Error(`GHL ${res.status} on ${method} ${p.split('?')[0].replace(acct.locationId, '{location}')}: ${msg}`);
    err.status = res.status;
    throw err;
  }
  return data;
}

const tzCache = new Map();
async function locationTimezone(acct) {
  if (!tzCache.has(acct.locationId)) {
    let tz = acct.timezone;
    if (!tz) {
      try { tz = (await ghl(acct, 'GET', `/locations/${acct.locationId}`)).location?.timezone; } catch { /* needs locations.readonly */ }
    }
    tzCache.set(acct.locationId, tz || Intl.DateTimeFormat().resolvedOptions().timeZone);
  }
  return tzCache.get(acct.locationId);
}

const userCache = new Map();
// GHL requires a userId on every post.
async function postingUserId(acct) {
  if (acct.userId) return acct.userId;
  if (userCache.has(acct.locationId)) return userCache.get(acct.locationId);
  // Prefer whoever already posts here (a location can have several users), else the first user.
  const r = await ghl(acct, 'POST', `/social-media-posting/${acct.locationId}/posts/list`, {
    type: 'all', skip: '0', limit: '20', fromDate: '2020-01-01T00:00:00.000Z', toDate: new Date(Date.now() + 4e10).toISOString(), includeUsers: 'false',
  });
  let id = r.results?.posts?.find((p) => p.createdBy)?.createdBy;
  if (!id) {
    try { id = (await ghl(acct, 'GET', `/users/?locationId=${acct.locationId}`)).users?.[0]?.id; } catch { /* needs users.readonly */ }
  }
  if (!id) throw new Error('Could not find a GHL user to post as. Add the users.readonly scope to this sub-account\'s token.');
  userCache.set(acct.locationId, id);
  return id;
}

async function uploadMedia(acct, filePath) {
  const real = resolveMediaPath(filePath);
  const { size } = fs.statSync(real);
  if (size > MAX_UPLOAD) throw new Error(`${path.basename(real)} is ${(size / 1048576).toFixed(1)} MB; GHL's upload limit is 25 MB.`);
  const type = mimeOf(real);
  const form = new FormData();
  form.append('file', await fs.openAsBlob(real, { type }), path.basename(real));
  form.append('name', path.basename(real));
  const r = await ghl(acct, 'POST', '/medias/upload-file', form);
  return { url: r.url, type };
}

const ok = (data) => ({ content: [{ type: 'text', text: typeof data === 'string' ? data : JSON.stringify(data, null, 2) }] });
const fail = (e) => ({ isError: true, content: [{ type: 'text', text: e.message }] });
const tool = (fn) => async (args) => { try { return ok(await fn(args)); } catch (e) { return fail(e); } };

const server = new McpServer({ name: 'hi5-ghl-social', version: '1.0.0' });

server.registerTool('list_social_accounts', {
  description: 'List GHL sub-accounts and the social accounts connected to each (with the account IDs needed by create_post), plus each sub-account\'s timezone. Call this first.',
  inputSchema: { subaccount: z.string().optional().describe('Sub-account name; omit for all') },
}, tool(async ({ subaccount }) => {
  const names = subaccount ? [getAccount(subaccount).name] : Object.keys(loadAccounts());
  const out = [];
  for (const name of names) {
    const acct = getAccount(name);
    try {
      const r = await ghl(acct, 'GET', `/social-media-posting/${acct.locationId}/accounts`);
      out.push({
        subaccount: name,
        timezone: await locationTimezone(acct),
        accounts: (r.results?.accounts || []).map((a) => ({ id: a.id, name: a.name, platform: a.platform, type: a.type, ...(a.isExpired && { expired: 'reconnect in GHL before posting' }) })),
      });
    } catch (e) { out.push({ subaccount: name, error: e.message }); }
  }
  return out;
}));

server.registerTool('create_post', {
  description: `Schedule (or save as draft) a social post in GHL Social Planner. Local media files are uploaded to the sub-account's GHL Media Library first (max 25 MB each).
- Carousel: pass several media items. Story or reel: set type.
- One call can target several accounts with the same caption; for different captions per platform, make one call per platform.
- platformDetails is passed straight to GHL. Known keys:
  tiktokPostDetails {privacyLevel: PUBLIC_TO_EVERYONE|MUTUAL_FOLLOW_FRIENDS|SELF_ONLY, enableComment, enableDuet, enableStitch, videoDisclosure, promoteYourBrand, promoteOtherBrand}
  youtubePostDetails {title, privacyLevel: public|private|unlisted, type: video|short}
  instagramPostDetails {type: post|reel|story, collaborators}
  facebookPostDetails {type: post|reel|story}
  gmbPostDetails {gmbEventType: STANDARD|EVENT|OFFER, actionType: none|order|book|shop|learn_more|call|sign_up, url, title, offerTitle, couponCode}
  linkedinPostDetails {postAsPdf, pdfTitle}
  pinterestPostDetails {title, link, boardIds}`,
  inputSchema: {
    subaccount: z.string().describe('Sub-account name from list_social_accounts'),
    accountIds: z.array(z.string()).min(1).describe('Social account IDs from list_social_accounts'),
    summary: z.string().describe('Post caption/text'),
    media: z.array(z.object({
      path: z.string().describe('Local file path, e.g. G:\\My Drive\\Social\\photo.jpg or the path Cowork sees'),
      caption: z.string().optional(),
    })).optional(),
    type: z.enum(['post', 'story', 'reel']).default('post'),
    status: z.enum(['scheduled', 'draft']).default('scheduled'),
    scheduleAt: z.string().optional().describe('Local time "YYYY-MM-DDTHH:mm" in the sub-account timezone, or ISO with offset. Required when scheduled.'),
    timezone: z.string().optional().describe('IANA zone like America/Chicago to override the sub-account timezone'),
    followUpComment: z.string().optional().describe('First comment (not on TikTok or Google Business)'),
    platformDetails: z.record(z.string(), z.any()).optional(),
  },
}, tool(async (a) => {
  const acct = getAccount(a.subaccount);
  const tz = a.timezone || await locationTimezone(acct);
  let scheduleDate;
  if (a.scheduleAt) scheduleDate = toUtc(a.scheduleAt, tz);
  if (a.status === 'scheduled') {
    if (!scheduleDate) throw new Error('scheduleAt is required for a scheduled post (or use status "draft").');
    if (new Date(scheduleDate) <= new Date()) throw new Error(`${a.scheduleAt} (${tz}) is in the past.`);
  }
  const media = [];
  for (const m of a.media || []) media.push({ ...(await uploadMedia(acct, m.path)), ...(m.caption && { caption: m.caption }) });
  const body = {
    ...a.platformDetails,
    accountIds: a.accountIds,
    summary: a.summary,
    media,
    type: a.type,
    status: a.status,
    ...(scheduleDate && { scheduleDate }),
    ...(a.followUpComment && { followUpComment: a.followUpComment }),
    userId: await postingUserId(acct),
  };
  const r = await ghl(acct, 'POST', `/social-media-posting/${acct.locationId}/posts`, body);
  const post = r.results?.post || {};
  return { created: true, postId: post._id || post.id, status: post.status || a.status, scheduleDate, timezone: tz, media: media.map((m) => m.url) };
}));

server.registerTool('list_posts', {
  description: 'List posts in a sub-account\'s Social Planner to check what is scheduled.',
  inputSchema: {
    subaccount: z.string(),
    filter: z.enum(['all', 'scheduled', 'draft', 'failed', 'published', 'in_review', 'in_progress']).default('scheduled'),
    fromDate: z.string().optional().describe('ISO date; default now'),
    toDate: z.string().optional().describe('ISO date; default 60 days out'),
    limit: z.number().int().min(1).max(100).default(25),
  },
}, tool(async ({ subaccount, filter, fromDate, toDate, limit }) => {
  const acct = getAccount(subaccount);
  const r = await ghl(acct, 'POST', `/social-media-posting/${acct.locationId}/posts/list`, {
    type: filter, skip: '0', limit: String(limit), includeUsers: 'false',
    fromDate: fromDate ? new Date(fromDate).toISOString() : new Date().toISOString(),
    toDate: toDate ? new Date(toDate).toISOString() : new Date(Date.now() + 60 * 864e5).toISOString(),
  });
  return (r.results?.posts || []).map((p) => ({
    id: p._id, platform: p.platform, type: p.type, status: p.status, scheduleDate: p.scheduleDate,
    summary: (p.summary || '').slice(0, 120), media: (p.media || []).length, ...(p.error && { error: p.error }),
  }));
}));

await server.connect(new StdioServerTransport());
