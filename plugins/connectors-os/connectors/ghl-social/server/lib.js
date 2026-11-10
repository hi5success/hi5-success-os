import path from 'node:path';
import fs from 'node:fs';
import os from 'node:os';

// Converts "2026-10-20T09:00" in an IANA timezone to a UTC ISO string.
// Strings that already carry Z or an offset are taken as-is.
export function toUtc(when, timeZone) {
  if (/(Z|[+-]\d\d:?\d\d)$/i.test(when)) {
    const d = new Date(when);
    if (isNaN(d)) throw new Error(`Can't read the date "${when}".`);
    return d.toISOString();
  }
  const m = when.match(/^(\d{4})-(\d\d)-(\d\d)[T ](\d\d):(\d\d)(?::(\d\d))?$/);
  if (!m) throw new Error(`Use the format YYYY-MM-DDTHH:mm for "${when}".`);
  const [, y, mo, d, h, mi, s] = m.map((v) => Number(v || 0));
  const wall = Date.UTC(y, mo - 1, d, h, mi, s);
  // Shift by the zone's offset, then re-check at the result so DST edges land right.
  let t = wall - offsetMs(wall, timeZone);
  t = wall - offsetMs(t, timeZone);
  return new Date(t).toISOString();
}

function offsetMs(t, timeZone) {
  const parts = Object.fromEntries(
    new Intl.DateTimeFormat('en-US', { timeZone, hourCycle: 'h23', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' })
      .formatToParts(new Date(t)).map((p) => [p.type, p.value]),
  );
  return Date.UTC(parts.year, parts.month - 1, parts.day, parts.hour, parts.minute, parts.second) - Math.floor(t / 1000) * 1000;
}

// A config value the installer left unfilled arrives as the literal "${user_config.x}".
const isSet = (v) => typeof v === 'string' && v.trim() !== '' && !v.startsWith('${');

// Only files under these folders may be uploaded, so a stray instruction can't ship other files off the PC.
// The extension passes the chosen folders as command-line args; MEDIA_ROOTS (";"-separated) is the manual fallback.
export function mediaRoots(args = process.argv.slice(2), env = process.env) {
  const dirs = [...args, ...(env.MEDIA_ROOTS || '').split(';')].filter(isSet);
  return (dirs.length ? dirs : [path.join(os.homedir(), 'Documents')]).map((r) => path.resolve(r));
}

// Sub-accounts from the accounts file plus the one entered on the extension's install screen (which wins on a name clash).
export function mergeAccounts(fileAccounts, env = process.env) {
  const all = { ...fileAccounts };
  if (isSet(env.GHL_LOCATION_ID) && isSet(env.GHL_TOKEN)) {
    const name = (isSet(env.GHL_SUBACCOUNT) ? env.GHL_SUBACCOUNT : 'main').trim().toLowerCase().replace(/\s+/g, '-');
    all[name] = { locationId: env.GHL_LOCATION_ID.trim(), token: env.GHL_TOKEN.trim() };
  }
  return all;
}

const inside = (root, p) => {
  const rel = path.relative(root, p);
  return rel && !rel.startsWith('..') && !path.isAbsolute(rel);
};

// Accepts a Windows path, a path relative to a media root, or a Cowork/VM path such as
// /sessions/x/mnt/My Drive/Posts/a.jpg (mapped by the root's folder name).
export function resolveMediaPath(input, roots = mediaRoots()) {
  const candidates = [];
  if (path.isAbsolute(input) && /^[a-z]:/i.test(input)) candidates.push(path.resolve(input));
  const segs = input.split(/[\\/]+/).filter(Boolean);
  for (const root of roots) {
    const i = segs.lastIndexOf(path.basename(root));
    if (i >= 0) candidates.push(path.join(root, ...segs.slice(i + 1)));
    if (!path.isAbsolute(input) && !input.startsWith('/')) candidates.push(path.join(root, ...segs));
  }
  for (const c of candidates) {
    const real = fs.existsSync(c) ? fs.realpathSync(c) : null;
    if (real && roots.some((r) => inside(fs.existsSync(r) ? fs.realpathSync(r) : r, real))) return real;
  }
  throw new Error(`File not found inside the allowed folders (${roots.join(', ')}): ${input}`);
}

const MIME = {
  '.jpg': 'image/jpeg', '.jpeg': 'image/jpeg', '.png': 'image/png', '.gif': 'image/gif', '.webp': 'image/webp',
  '.heic': 'image/heic', '.mp4': 'video/mp4', '.mov': 'video/quicktime', '.m4v': 'video/x-m4v', '.webm': 'video/webm',
  '.avi': 'video/x-msvideo', '.pdf': 'application/pdf',
};
export const mimeOf = (p) => MIME[path.extname(p).toLowerCase()] || 'application/octet-stream';
