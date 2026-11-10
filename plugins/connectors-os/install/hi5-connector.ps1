<#
  Hi5 Connector installer. The /hi5-connector skill calls this script; the skill never installs anything itself.
    -Action check     read only: prints JSON with what is installed, versions, and what is missing
    -Action install   installs or updates one connector (run again any time to update or repair)
  Windows PowerShell 5.1 compatible. Writes only inside %USERPROFILE%\.hi5-connector (or -InstallRoot). Not AppData: the Microsoft Store build of
  Claude silently redirects new AppData folders into its private storage, which a Claude reset would wipe.
  It never edits Claude's config files: the plugin itself tells Claude Code how to start the connector.
#>
param(
  [ValidateSet('check', 'install')] [string]$Action = 'check',
  [ValidateSet('capcut')] [string]$Connector = 'capcut',
  [switch]$InstallMissing,          # let winget install Python, Node.js and FFmpeg (only after the member said yes)
  [string]$InstallRoot = (Join-Path $env:USERPROFILE '.hi5-connector')
)
$ErrorActionPreference = 'Stop'
$PluginRoot = Split-Path -Parent $PSScriptRoot
$Stamp = Join-Path $InstallRoot 'installed.json'

function Refresh-Path {
  $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [Environment]::GetEnvironmentVariable('Path', 'User')
}
Refresh-Path   # pick up tools installed since Claude started (winget changes PATH for new processes only)
function Get-Python {
  foreach ($v in '3.12', '3.13', '3.11', '3.10') {
    try { $exe = & py "-$v" -c 'import sys;print(sys.executable)' 2>$null; if ($LASTEXITCODE -eq 0 -and $exe) { return @{ version = $v; exe = $exe.Trim() } } } catch {}
  }
  return $null
}
function Get-NodeMajor {
  try { $v = & node --version 2>$null; if ($v -match '^v(\d+)') { return [int]$Matches[1] } } catch {}
  return 0
}
function Test-Ffmpeg { return [bool](Get-Command ffprobe -ErrorAction SilentlyContinue) }
function Get-CapCutDrafts { Join-Path $env:LOCALAPPDATA 'CapCut\User Data\Projects\com.lveditor.draft' }
function Read-Json($path) { if (Test-Path $path) { return Get-Content $path -Raw -Encoding UTF8 | ConvertFrom-Json } return $null }
function Write-Json($obj, $path) {
  $json = $obj | ConvertTo-Json -Depth 6
  [IO.File]::WriteAllText($path, $json, (New-Object Text.UTF8Encoding($false)))
}
function Get-KnownFolder($name) { try { return [Environment]::GetFolderPath($name) } catch { return $null } }
function Get-Downloads {
  try { return (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path } catch { return (Join-Path $env:USERPROFILE 'Downloads') }
}
function Test-BridgeUp {
  try { Invoke-WebRequest -Uri 'http://127.0.0.1:9001/create_draft' -Method Get -TimeoutSec 2 -UseBasicParsing | Out-Null; return $true }
  catch { return [bool]$_.Exception.Response }   # any HTTP answer (even 405) means the bridge is running
}
function Compare-Version($a, $b) { return ([version]$a).CompareTo([version]$b) }

function Get-Status {
  $plugin = Read-Json (Join-Path $PluginRoot 'connectors\capcut\connector.json')
  $stamp = Read-Json $Stamp
  $installed = if ($stamp -and $stamp.capcut) { $stamp.capcut.version } else { $null }
  $py = Get-Python
  $state = 'not installed'
  $news = @()
  if ($installed) {
    if ((Compare-Version $plugin.version $installed) -gt 0) {
      $state = 'update available'
      $news = @($plugin.changelog | Where-Object { (Compare-Version $_.version $installed) -gt 0 } | ForEach-Object { "$($_.version): $($_.note)" })
    } else { $state = 'up to date' }
    if (-not (Test-Path (Join-Path $InstallRoot 'capcut\mcp-server\dist\index.js'))) { $state = 'broken'; $news = @('The program files are missing. Install again to repair.') }
  }
  [ordered]@{
    windows       = ($env:OS -eq 'Windows_NT')
    capcut        = [ordered]@{ state = $state; installed = $installed; available = $plugin.version; whats_new = $news; bridge_running = (Test-BridgeUp) }
    python        = if ($py) { $py.version } else { $null }
    node_major    = Get-NodeMajor
    ffmpeg        = Test-Ffmpeg
    winget        = [bool](Get-Command winget -ErrorAction SilentlyContinue)
    capcut_app    = Test-Path (Join-Path $env:LOCALAPPDATA 'CapCut\Apps')
    capcut_opened = Test-Path (Get-CapCutDrafts)
    install_root  = $InstallRoot
  }
}

function Install-Missing {
  $plan = @()
  if (-not (Get-Python)) { $plan += 'Python.Python.3.12' }
  if ((Get-NodeMajor) -lt 18) { $plan += 'OpenJS.NodeJS.LTS' }
  if (-not (Test-Ffmpeg)) { $plan += 'Gyan.FFmpeg' }
  if (-not $plan) { return }
  if (-not $InstallMissing) { throw "Missing: $($plan -join ', '). Ask the member, then run again with -InstallMissing." }
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { throw "winget is not available on this computer, so $($plan -join ', ') must be installed by hand." }
  foreach ($id in $plan) {
    Write-Host "Installing $id ..."
    & winget install --id $id -e --silent --accept-package-agreements --accept-source-agreements | Out-Host
    Refresh-Path
  }
  if (-not (Get-Python) -or (Get-NodeMajor) -lt 18) { throw 'Python or Node.js still cannot be found. Close and reopen Claude, then run the install again.' }
}

function Copy-Tree($from, $to) {
  # Mirror program files only; keep the member's venv, node_modules, config.json and logs.
  & robocopy $from $to /MIR /NFL /NDL /NJH /NJS /NP /XD venv node_modules dist __pycache__ /XF config.json bridge.log | Out-Null
  if ($LASTEXITCODE -ge 8) { throw "Copying files to $to failed (robocopy code $LASTEXITCODE)." }
  $global:LASTEXITCODE = 0
}

function Stop-OurBridge {
  # Stop whatever CapCut bridge holds port 9001 (a venv python hands off to the base interpreter, so match by port).
  $pids = @(Get-NetTCPConnection -LocalPort 9001 -State Listen -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique)
  Get-CimInstance Win32_Process -Filter "Name='python.exe'" -ErrorAction SilentlyContinue |
    Where-Object { $_.CommandLine -like '*capcut_server.py*' -and ($pids -contains $_.ProcessId -or $pids -contains $_.ParentProcessId) } |
    ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }
  Start-Sleep -Seconds 1
}

function Install-CapCut {
  if ($env:OS -ne 'Windows_NT') { throw 'The CapCut connector is Windows only for now. Mac support is coming.' }
  if (-not (Test-Path (Join-Path $env:LOCALAPPDATA 'CapCut\Apps'))) { throw 'CapCut is not installed. Install CapCut for Windows from capcut.com, open it once, then run this again.' }
  if (-not (Test-Path (Get-CapCutDrafts))) { throw 'CapCut has not been opened yet on this computer. Open CapCut once, close it, then run this again.' }
  Install-Missing

  $src = Join-Path $PluginRoot 'connectors\capcut'
  $dst = Join-Path $InstallRoot 'capcut'
  New-Item -ItemType Directory -Force -Path $dst | Out-Null
  Stop-OurBridge
  Copy-Tree (Join-Path $src 'bridge') (Join-Path $dst 'bridge')
  Copy-Tree (Join-Path $src 'mcp-server') (Join-Path $dst 'mcp-server')

  Write-Host 'Setting up the bridge (Python) ...'
  $bridge = Join-Path $dst 'bridge'
  $venvPy = Join-Path $bridge 'venv\Scripts\python.exe'
  if (-not (Test-Path $venvPy)) { & py "-$((Get-Python).version)" -m venv (Join-Path $bridge 'venv'); if ($LASTEXITCODE) { throw 'Could not create the Python environment.' } }
  & $venvPy -m pip install --disable-pip-version-check -q -r (Join-Path $bridge 'requirements.txt') | Out-Host
  if ($LASTEXITCODE) { throw 'Installing the bridge requirements failed. Check the internet connection and run again.' }
  $cfg = Join-Path $bridge 'config.json'
  if (-not (Test-Path $cfg)) { Copy-Item (Join-Path $bridge 'config.json.example') $cfg }

  Write-Host 'Building the connector (Node.js) ...'
  $mcp = Join-Path $dst 'mcp-server'
  Push-Location $mcp
  try {
    & npm ci --ignore-scripts --no-audit --no-fund --loglevel=error | Out-Host   # --ignore-scripts skips the chmod build step that fails on Windows
    if ($LASTEXITCODE) { throw 'Installing the connector packages failed. Check the internet connection and run again.' }
    & npx --no-install tsc | Out-Host
    if ($LASTEXITCODE) { throw 'Building the connector failed.' }
  } finally { Pop-Location }

  # Folders the move tool may take finished videos from. Desktop and Videos may live in OneDrive.
  $from = @((Get-KnownFolder 'MyVideos'), (Get-Downloads), (Get-KnownFolder 'Desktop')) | Where-Object { $_ } | Select-Object -Unique
  Write-Json ([ordered]@{ port = 9001; moveFrom = @($from) }) (Join-Path $dst 'settings.json')

  $version = (Read-Json (Join-Path $src 'connector.json')).version
  $all = Read-Json $Stamp
  $h = [ordered]@{}
  if ($all) { $all.PSObject.Properties | ForEach-Object { $h[$_.Name] = $_.Value } }
  $h['capcut'] = [ordered]@{ version = $version; installed_at = (Get-Date).ToString('s'); install_dir = $dst }
  Write-Json $h $Stamp

  # Smoke test: start the bridge the same way Claude will and make one draft (it is not saved).
  $log = Join-Path $dst 'bridge.log'
  Start-Process -FilePath $venvPy -ArgumentList 'capcut_server.py' -WorkingDirectory $bridge -WindowStyle Hidden -RedirectStandardError $log -RedirectStandardOutput "$log.out" | Out-Null
  $ok = $false
  foreach ($i in 1..30) {
    Start-Sleep -Seconds 1
    try {
      $r = Invoke-RestMethod -Uri 'http://127.0.0.1:9001/create_draft' -Method Post -ContentType 'application/json' -Body '{"width":1080,"height":1920}' -TimeoutSec 3
      if ($r.success) { $ok = $true; break }
    } catch {}
  }
  if (-not $ok) { throw "The bridge did not start. Details are in $log" }
  [ordered]@{ result = 'installed'; connector = 'capcut'; version = $version; smoke_test = 'passed'; next = 'Fully quit Claude (tray icon, Quit) and open it again, then start a new chat.' }
}

try {
  if ($Action -eq 'check') { Get-Status | ConvertTo-Json -Depth 5 }
  else { Install-CapCut | ConvertTo-Json -Depth 5 }
} catch {
  [ordered]@{ result = 'failed'; reason = $_.Exception.Message } | ConvertTo-Json
  exit 1
}
