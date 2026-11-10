import { test } from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { toUtc, resolveMediaPath, mergeAccounts, mediaRoots } from './lib.js';

test('mergeAccounts adds the install-screen account and ignores unfilled placeholders', () => {
  const file = { other: { locationId: 'L1', token: 't1' } };
  assert.deepEqual(mergeAccounts(file, { GHL_SUBACCOUNT: 'Smith Realty', GHL_LOCATION_ID: 'L2', GHL_TOKEN: 't2' }),
    { other: { locationId: 'L1', token: 't1' }, 'smith-realty': { locationId: 'L2', token: 't2' } });
  assert.deepEqual(mergeAccounts(file, { GHL_LOCATION_ID: '${user_config.location_id}', GHL_TOKEN: '${user_config.ghl_token}' }), file);
  assert.deepEqual(Object.keys(mergeAccounts({}, { GHL_LOCATION_ID: 'L', GHL_TOKEN: 't' })), ['main']);
});

test('mediaRoots prefers install-screen folders, skips placeholders, defaults to Documents', () => {
  assert.deepEqual(mediaRoots(['C:\\A', 'C:\\B'], {}), ['C:\\A', 'C:\\B']);
  assert.deepEqual(mediaRoots(['${user_config.media_folders}'], { MEDIA_ROOTS: 'C:\\X;C:\\Y' }), ['C:\\X', 'C:\\Y']);
  assert.deepEqual(mediaRoots([], {}), [path.join(os.homedir(), 'Documents')]);
});

test('toUtc converts local wall time across DST', () => {
  assert.equal(toUtc('2026-07-01T09:00', 'America/Chicago'), '2026-07-01T14:00:00.000Z'); // CDT -5
  assert.equal(toUtc('2026-12-01T09:00', 'America/Chicago'), '2026-12-01T15:00:00.000Z'); // CST -6
  assert.equal(toUtc('2026-11-01T01:30', 'America/New_York').slice(0, 13), '2026-11-01T05'); // ambiguous hour, earlier one
  assert.equal(toUtc('2026-07-01T09:00:00-05:00', 'Asia/Tokyo'), '2026-07-01T14:00:00.000Z'); // explicit offset wins
  assert.throws(() => toUtc('next tuesday', 'America/Chicago'));
});

test('resolveMediaPath maps Windows, relative and VM paths, and blocks escapes', () => {
  const base = fs.mkdtempSync(path.join(os.tmpdir(), 'ghl-'));
  const root = path.join(base, 'My Drive');
  fs.mkdirSync(path.join(root, 'Social'), { recursive: true });
  const file = path.join(root, 'Social', 'a.jpg');
  fs.writeFileSync(file, 'x');
  fs.writeFileSync(path.join(base, 'secret.txt'), 'x');
  const real = fs.realpathSync(file);
  assert.equal(resolveMediaPath(file, [root]), real);
  assert.equal(resolveMediaPath('Social/a.jpg', [root]), real);
  assert.equal(resolveMediaPath('/sessions/abc/mnt/My Drive/Social/a.jpg', [root]), real);
  assert.throws(() => resolveMediaPath(path.join(base, 'secret.txt'), [root]));
  assert.throws(() => resolveMediaPath('../secret.txt', [root]));
  assert.throws(() => resolveMediaPath('Social/missing.jpg', [root]));
  fs.rmSync(base, { recursive: true });
});
