// capcut_move_export: move a finished export (any size) from this computer into a synced folder (Google Drive, Dropbox, OneDrive...).
// Scoped: fixed sources, no system or AppData destinations. The launcher sets CAPCUT_MOVE_FROM to the real Videos,
// Downloads and Desktop folders (they may live in OneDrive) plus CapCut's export folder.
import { z } from "zod";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import fs from 'node:fs';
import fsp from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
const roots = (v: string) => v.split(';').filter(Boolean).map(r => path.resolve(r).toLowerCase() + path.sep);
const inside = (p: string, rs: string[]) => rs.some(r => (p.toLowerCase() + path.sep).startsWith(r));
const HOME = os.homedir();
const FROM = roots(process.env.CAPCUT_MOVE_FROM || `${HOME}\\Videos;${HOME}\\Downloads;${HOME}\\Desktop`);
const SYS = (process.env.SystemDrive || 'C:').toLowerCase() + path.sep;
const BLOCKED = roots(`${HOME}\\AppData`); // holds the Startup folder and app settings
// Destinations: any non-system drive (G:, D:, USB...) or the user's own folder (Dropbox, OneDrive, Box, Documents...).
const allowedDest = (p: string) => process.env.CAPCUT_MOVE_TO ? inside(p, roots(process.env.CAPCUT_MOVE_TO))
    : !inside(p, BLOCKED) && (!(p.toLowerCase() + path.sep).startsWith(SYS) || inside(p, roots(HOME)));
const MoveSchema = z.object({
    file: z.string().min(3).describe('Absolute path of the exported file, e.g. C:\\Users\\you\\Videos\\My Video.mp4'),
    destination_folder: z.string().min(3).describe('Absolute folder to put it in (Google Drive, Dropbox, OneDrive, another drive...), e.g. G:\\My Drive\\Content\\<Project>\\Exports'),
    new_name: z.string().regex(/^[^\\/:*?"<>|]+\.[A-Za-z0-9]{2,5}$/).optional().describe('Rename the file on the way (no folders). Defaults to the current name'),
    overwrite: z.boolean().default(false).describe('Replace a file with the same name in the destination'),
    keep_original: z.boolean().default(false).describe('Keep the file on C: after the copy is verified (default: delete it, i.e. a move)')
}).strict();
export function registerMoveTool(server: McpServer): void {
    server.registerTool('capcut_move_export', {
        title: 'Move export to a folder',
        description: `Move a finished video (any size) on this computer into another folder or drive (Google Drive, Dropbox, OneDrive, external drive...), verify the copy's size, then delete the original.
Use this for CapCut exports instead of sending files. Creates the destination folder if needed.
Source must be inside: ${FROM.join(' | ')}. Destination: any folder on a non-system drive, or inside ${HOME} (not AppData).`,
        inputSchema: MoveSchema,
        annotations: { readOnlyHint: false, destructiveHint: false, idempotentHint: false, openWorldHint: false }
    }, async (params: z.infer<typeof MoveSchema>) => {
        try {
            const src = path.resolve(params.file), dir = path.resolve(params.destination_folder);
            if (!inside(src, FROM)) throw new Error(`File is outside the allowed source folders: ${src}`);
            if (!allowedDest(dir)) throw new Error(`Destination not allowed (system folder or AppData): ${dir}`);
            const size = (await fsp.stat(src)).size;
            const out = path.join(dir, params.new_name || path.basename(src)), tmp = out + '.moving';
            if (fs.existsSync(out) && !params.overwrite) throw new Error(`${path.basename(out)} already exists in ${dir} (set overwrite=true to replace it)`);
            await fsp.mkdir(dir, { recursive: true });
            await fsp.copyFile(src, tmp);
            const copied = (await fsp.stat(tmp)).size;
            if (copied !== size) { await fsp.unlink(tmp); throw new Error(`Copy is ${copied} bytes, expected ${size}; original kept`); }
            await fsp.rm(out, { force: true });
            await fsp.rename(tmp, out);
            if (!params.keep_original) await fsp.unlink(src);
            const result = { output: out, bytes: size, original_deleted: !params.keep_original };
            return { content: [{ type: 'text', text: JSON.stringify(result, null, 2) }], structuredContent: result };
        }
        catch (error) {
            return { content: [{ type: 'text', text: `Error: ${error instanceof Error ? error.message : String(error)}` }], isError: true };
        }
    });
}
