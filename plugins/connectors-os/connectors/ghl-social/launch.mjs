// Starts the GHL social connector for Claude Code. The plugin points its MCP entry here. Sub-accounts and tokens are
// stored encrypted by Windows for this user only (DPAPI), decrypted here and passed to the server in memory.
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { pathToFileURL } from 'node:url';

const ROOT = process.env.HI5_CONNECTOR_HOME
  || path.join(process.env.USERPROFILE || process.env.HOME || '', '.hi5-connector');
const DIR = path.join(ROOT, 'ghl-social');
const SERVER = path.join(DIR, 'server', 'server.js');
const fail = (msg) => { process.stderr.write(`Hi5 GHL social connector: ${msg}\n`); process.exit(1); };

if (!fs.existsSync(SERVER)) fail('not installed on this computer yet. In Claude, run /hi5-connector and pick GHL social.');

let settings = {};
try { settings = JSON.parse(fs.readFileSync(path.join(DIR, 'settings.json'), 'utf8')); } catch { /* defaults in the server */ }
if (settings.mediaRoots?.length) process.env.MEDIA_ROOTS = settings.mediaRoots.join(';');

const store = path.join(DIR, 'accounts.dat');
if (fs.existsSync(store)) {
  const ps = `Add-Type -AssemblyName System.Security; $b=[Convert]::FromBase64String((Get-Content -Raw -LiteralPath $env:HI5_STORE).Trim());` +
    `[Console]::Out.Write([Text.Encoding]::UTF8.GetString([Security.Cryptography.ProtectedData]::Unprotect($b,$null,'CurrentUser')))`;
  const r = spawnSync('powershell.exe', ['-NoProfile', '-NonInteractive', '-Command', ps], { env: { ...process.env, HI5_STORE: store }, encoding: 'utf8' });
  if (r.status !== 0) fail('could not unlock the saved sub-accounts. Run /hi5-connector and add the sub-account again.');
  process.env.GHL_ACCOUNTS_JSON = r.stdout;
}
await import(pathToFileURL(SERVER).href);
