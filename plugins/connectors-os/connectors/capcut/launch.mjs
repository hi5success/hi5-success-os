// Starts the CapCut connector for Claude Code. The plugin points its MCP entry here, so nothing in Claude's own
// config file is ever edited. Uses only Node built-ins: the real server lives in the member's install folder.
import fs from 'node:fs';
import path from 'node:path';
import { spawn } from 'node:child_process';
import { pathToFileURL } from 'node:url';

const ROOT = process.env.HI5_CONNECTOR_HOME
  || path.join(process.env.USERPROFILE || process.env.HOME || '', '.hi5-connector');
const DIR = path.join(ROOT, 'capcut');
const SERVER = path.join(DIR, 'mcp-server', 'dist', 'index.js');
const fail = (msg) => { process.stderr.write(`Hi5 CapCut connector: ${msg}\n`); process.exit(1); };

if (!fs.existsSync(SERVER)) fail('not installed on this computer yet. In Claude, run /hi5-connector and pick CapCut.');

let settings = {};
try { settings = JSON.parse(fs.readFileSync(path.join(DIR, 'settings.json'), 'utf8')); } catch { /* defaults below */ }
const port = settings.port || 9001;

// Start the bridge if it is not already answering, hidden, logging to a file. It keeps running after Claude closes.
async function bridgeUp() {
  try { await fetch(`http://127.0.0.1:${port}/`, { signal: AbortSignal.timeout(1500) }); return true; } catch { return false; }
}
if (!(await bridgeUp())) {
  const py = path.join(DIR, 'bridge', 'venv', 'Scripts', 'python.exe');
  if (!fs.existsSync(py)) fail('the bridge is missing its Python setup. Run /hi5-connector again to repair it.');
  const log = fs.openSync(path.join(DIR, 'bridge.log'), 'a');
  spawn(py, ['capcut_server.py'], { cwd: path.join(DIR, 'bridge'), detached: true, windowsHide: true, stdio: ['ignore', log, log] }).unref();
}

if (settings.moveFrom?.length) process.env.CAPCUT_MOVE_FROM = settings.moveFrom.join(';');
process.env.CAPCUT_API_URL ||= `http://localhost:${port}`;
await import(pathToFileURL(SERVER).href);
