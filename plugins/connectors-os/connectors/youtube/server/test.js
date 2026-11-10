// node test.js : checks the no-default-channel and explicit-privacy rules without Google.
import assert from "assert";
import { findChannel, uploadStatus, mediaInside } from "./lib.js";

const chans = [
  { name: "main", title: "Smith Realty", handle: "@smithrealty", channelId: "UCaaaaaaaaaaaaaaaaaaaaaa" },
  { name: "team", title: "Smith Team", handle: "@smithteam", channelId: "UCbbbbbbbbbbbbbbbbbbbbbb" },
  { name: "team-listings", title: "Smith Listings", handle: null, channelId: "UCcccccccccccccccccccccc" },
];
assert.equal(findChannel(chans, "Team Listings").name, "team-listings");
const throws = (fn, re) => assert.throws(fn, re);

// Channel: required even with one saved, exact match only.
throws(() => findChannel([chans[0]], undefined), /Which channel/);
throws(() => findChannel(chans, ""), /Which channel/);
throws(() => findChannel([], "main"), /No YouTube channels/);
assert.equal(findChannel(chans, "Main").name, "main");
assert.equal(findChannel(chans, "@SmithTeam").name, "team");
assert.equal(findChannel(chans, "smithteam").name, "team");
assert.equal(findChannel(chans, "UCaaaaaaaaaaaaaaaaaaaaaa").name, "main");
throws(() => findChannel(chans, "Smith"), /No saved channel/);   // no fuzzy title match

// Privacy: no default, public needs post_now, scheduled needs a future time with a zone.
const now = Date.parse("2026-11-10T12:00:00Z");
throws(() => uploadStatus(undefined), /privacy is required/);
throws(() => uploadStatus("public"), /post now/);
assert.deepEqual(uploadStatus("public", undefined, true), { privacyStatus: "public" });
assert.deepEqual(uploadStatus("unlisted"), { privacyStatus: "unlisted" });
assert.deepEqual(uploadStatus("scheduled", "2026-11-14T09:00:00-06:00", false, now), { privacyStatus: "private", publishAt: "2026-11-14T15:00:00.000Z" });
throws(() => uploadStatus("scheduled", undefined, false, now), /needs publish_at/);
throws(() => uploadStatus("scheduled", "2026-11-14T09:00:00", false, now), /time zone/);
throws(() => uploadStatus("scheduled", "2026-11-01T09:00:00Z", false, now), /future/);
throws(() => uploadStatus("private", "2026-11-14T09:00:00Z"), /only for privacy scheduled/);
throws(() => uploadStatus("draft"), /Unknown privacy/);

assert.ok(mediaInside("C:\\Users\\me\\Videos\\a.mp4", ["C:\\Users\\me\\Videos"]));
assert.ok(!mediaInside("C:\\Users\\me\\VideosX\\a.mp4", ["C:\\Users\\me\\Videos"]));
console.log("youtube lib: all tests passed");
