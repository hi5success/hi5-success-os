// Pure helpers for the YouTube connector (tested by test.js without Google).
import path from "path";

// Exact match only: saved name, @handle, or channel ID. No fallback channel, no fuzzy title match.
export function findChannel(channels, name, help = "") {
  const list = channels.map(c => `${c.name} (${c.title}${c.handle ? ", " + c.handle : ""})`).join("; ");
  if (!channels.length) throw new Error(`No YouTube channels are saved yet. ${help}`.trim());
  if (!name || !String(name).trim()) throw new Error(`Which channel? Ask the member, then pass it as "channel". Saved: ${list}`);
  const q = String(name).trim().toLowerCase(), h = "@" + q.replace(/^@/, "");
  const key = q.replace(/\s+/g, "-");   // the installer saves names this way ("Team Listings" -> "team-listings")
  const hit = channels.filter(c => c.name.toLowerCase() === key || c.channelId === String(name).trim() || (c.handle && c.handle.toLowerCase() === h));
  if (hit.length === 1) return hit[0];
  throw new Error(`No saved channel is called "${name}". Ask the member which one. Saved: ${list}`);
}

// Privacy is always explicit. scheduled = private until publish_at. public needs post_now.
export function uploadStatus(privacy, publishAt, postNow, now = Date.now()) {
  if (!privacy) throw new Error("privacy is required (scheduled, private, unlisted, or public). Ask the member; there is no default.");
  if (privacy === "scheduled") {
    const t = Date.parse(publishAt || "");
    if (!publishAt || Number.isNaN(t)) throw new Error("A scheduled video needs publish_at, e.g. 2026-11-14T09:00:00-06:00.");
    if (!/(Z|[+-]\d\d:\d\d)$/.test(publishAt)) throw new Error("publish_at needs a time zone, e.g. -06:00 or Z.");
    if (t <= now + 60_000) throw new Error("publish_at must be in the future.");
    return { privacyStatus: "private", publishAt: new Date(t).toISOString() };
  }
  if (publishAt) throw new Error("publish_at is only for privacy scheduled.");
  if (privacy === "public" && postNow !== true) throw new Error("Public means live right now. Only do this when the member clearly said to post now (set post_now). Otherwise use scheduled.");
  if (!["private", "unlisted", "public"].includes(privacy)) throw new Error(`Unknown privacy "${privacy}".`);
  return { privacyStatus: privacy };
}

export function mediaInside(file, roots) {
  const f = path.resolve(file).toLowerCase() + path.sep;
  return roots.some(r => f.startsWith(path.resolve(r).toLowerCase() + path.sep));
}
