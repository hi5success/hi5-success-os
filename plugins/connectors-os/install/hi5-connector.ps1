<#
  Hi5 Connector installer. The /hi5-connector skill calls this script; the skill never installs anything itself.
    -Action check     read only: prints JSON with what is installed, versions, and what is missing
    -Action install   installs or updates one connector (run again any time to update or repair)
    -Action add-account -AccountName smith-realty -LocationId abc123
                      GHL social: opens a Windows box for the token (never typed into the chat), tests it, saves it encrypted
    -Action import-accounts
                      GHL social: encrypts the sub-accounts from an older plain ~/.hi5-ghl-social/accounts.json
  Windows PowerShell 5.1 compatible. Writes only inside %USERPROFILE%\.hi5-connector (or -InstallRoot). Not AppData: the Microsoft Store build of
  Claude silently redirects new AppData folders into its private storage, which a Claude reset would wipe.
  It never edits Claude's config files: the plugin itself tells Claude Code how to start each connector.
#>
param(
  [ValidateSet('check', 'install', 'add-account', 'import-accounts')] [string]$Action = 'check',
  [ValidateSet('capcut', 'ghl-social')] [string]$Connector = 'capcut',
  [switch]$InstallMissing,          # let winget install Python, Node.js and FFmpeg (only after the member said yes)
  [string]$AccountName,
  [string]$LocationId,
  [string[]]$MediaFolder,           # extra folders GHL social may upload from
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
  $py = Get-Python
  $ghl = Get-ConnectorStatus 'ghl-social' 'ghl-social\server\node_modules'
  try { $ghl['accounts'] = @((Get-GhlAccounts).Keys) } catch { $ghl['accounts'] = 'saved sub-accounts could not be unlocked; add them again' }   # names only, never tokens
  $cap = Get-ConnectorStatus 'capcut' 'capcut\mcp-server\dist\index.js'
  $cap['bridge_running'] = Test-BridgeUp
  [ordered]@{
    windows       = ($env:OS -eq 'Windows_NT')
    capcut        = $cap
    ghl_social    = $ghl
    python        = if ($py) { $py.version } else { $null }
    node_major    = Get-NodeMajor
    ffmpeg        = Test-Ffmpeg
    winget        = [bool](Get-Command winget -ErrorAction SilentlyContinue)
    capcut_app    = Test-Path (Join-Path $env:LOCALAPPDATA 'CapCut\Apps')
    capcut_opened = Test-Path (Get-CapCutDrafts)
    install_root  = $InstallRoot
  }
}

function Get-ConnectorStatus($name, $mustExist) {
  $plugin = Read-Json (Join-Path $PluginRoot "connectors\$name\connector.json")
  $stamp = Read-Json $Stamp
  $installed = if ($stamp -and $stamp.$name) { $stamp.$name.version } else { $null }
  $state = 'not installed'
  $news = @()
  if ($installed) {
    if ((Compare-Version $plugin.version $installed) -gt 0) {
      $state = 'update available'
      $news = @($plugin.changelog | Where-Object { (Compare-Version $_.version $installed) -gt 0 } | ForEach-Object { "$($_.version): $($_.note)" })
    } else { $state = 'up to date' }
    if (-not (Test-Path (Join-Path $InstallRoot $mustExist))) { $state = 'broken'; $news = @('The program files are missing. Install again to repair.') }
  }
  [ordered]@{ state = $state; installed = $installed; available = $plugin.version; whats_new = $news }
}

function Save-Stamp($name, $version, $dir) {
  $all = Read-Json $Stamp
  $h = [ordered]@{}
  if ($all) { $all.PSObject.Properties | ForEach-Object { $h[$_.Name] = $_.Value } }
  $h[$name] = [ordered]@{ version = $version; installed_at = (Get-Date).ToString('s'); install_dir = $dir }
  Write-Json $h $Stamp
}

function Install-Missing([switch]$NodeOnly) {
  $plan = @()
  if (-not $NodeOnly -and -not (Get-Python)) { $plan += 'Python.Python.3.12' }
  if ((Get-NodeMajor) -lt 18) { $plan += 'OpenJS.NodeJS.LTS' }
  if (-not $NodeOnly -and -not (Test-Ffmpeg)) { $plan += 'Gyan.FFmpeg' }
  if (-not $plan) { return }
  if (-not $InstallMissing) { throw "Missing: $($plan -join ', '). Ask the member, then run again with -InstallMissing." }
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { throw "winget is not available on this computer, so $($plan -join ', ') must be installed by hand." }
  foreach ($id in $plan) {
    Write-Host "Installing $id ..."
    & winget install --id $id -e --silent --accept-package-agreements --accept-source-agreements | Out-Host
    Refresh-Path
  }
  if ((-not $NodeOnly -and -not (Get-Python)) -or (Get-NodeMajor) -lt 18) { throw 'Python or Node.js still cannot be found. Close and reopen Claude, then run the install again.' }
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
  Save-Stamp 'capcut' $version $dst

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

#  GHL social

$GhlDir = Join-Path $InstallRoot 'ghl-social'
$GhlStore = Join-Path $GhlDir 'accounts.dat'
Add-Type -AssemblyName System.Security

function Get-GhlAccounts {
  # Decrypts the Windows-protected store (only this Windows user can). Returns a hashtable name -> {locationId, token}.
  $h = [ordered]@{}
  if (Test-Path $GhlStore) {
    $bytes = [Security.Cryptography.ProtectedData]::Unprotect([Convert]::FromBase64String((Get-Content -Raw $GhlStore).Trim()), $null, 'CurrentUser')
    ([Text.Encoding]::UTF8.GetString($bytes) | ConvertFrom-Json).PSObject.Properties | ForEach-Object { $h[$_.Name] = $_.Value }
  }
  return $h
}
function Save-GhlAccounts($h) {
  New-Item -ItemType Directory -Force -Path $GhlDir | Out-Null
  $bytes = [Text.Encoding]::UTF8.GetBytes(($h | ConvertTo-Json -Depth 4 -Compress))
  [IO.File]::WriteAllText($GhlStore, [Convert]::ToBase64String([Security.Cryptography.ProtectedData]::Protect($bytes, $null, 'CurrentUser')))
}
function Get-AccountKey($name) { return ($name.Trim().ToLower() -replace '\s+', '-') }

function Get-MediaRoots {
  # Folders the connector may upload from: the usual Windows folders (wherever OneDrive put them) plus cloud drives.
  $roots = @('MyDocuments', 'MyVideos', 'MyPictures', 'Desktop' | ForEach-Object { Get-KnownFolder $_ }) + (Get-Downloads)
  # Google Drive for desktop mounts a virtual drive (often G:) that Get-Volume does not list, so match the drive name.
  Get-PSDrive -PSProvider FileSystem -ErrorAction SilentlyContinue | Where-Object { $_.Description -eq 'Google Drive' } | ForEach-Object { $roots += $_.Root }
  $dbx = Join-Path $env:LOCALAPPDATA 'Dropbox\info.json'
  if (Test-Path $dbx) { (Read-Json $dbx).PSObject.Properties | ForEach-Object { $roots += $_.Value.path } }
  if ($env:OneDrive) { $roots += $env:OneDrive }
  if ($MediaFolder) { $roots += $MediaFolder }
  return @($roots | Where-Object { $_ -and (Test-Path $_) } | Select-Object -Unique)
}

function Install-Ghl {
  Install-Missing -NodeOnly
  $src = Join-Path $PluginRoot 'connectors\ghl-social'
  New-Item -ItemType Directory -Force -Path $GhlDir | Out-Null
  Copy-Tree (Join-Path $src 'server') (Join-Path $GhlDir 'server')
  Push-Location (Join-Path $GhlDir 'server')
  try {
    & npm ci --omit=dev --ignore-scripts --no-audit --no-fund --loglevel=error | Out-Host
    if ($LASTEXITCODE) { throw 'Installing the connector packages failed. Check the internet connection and run again.' }
  } finally { Pop-Location }
  $roots = Get-MediaRoots
  Write-Json ([ordered]@{ mediaRoots = $roots }) (Join-Path $GhlDir 'settings.json')
  $version = (Read-Json (Join-Path $src 'connector.json')).version
  Save-Stamp 'ghl-social' $version $GhlDir
  [ordered]@{ result = 'installed'; connector = 'ghl-social'; version = $version; media_folders = $roots; accounts = @((Get-GhlAccounts).Keys)
    next = 'Add a sub-account with -Action add-account, then fully quit Claude (tray icon, Quit) and open it again.' }
}

function Read-TokenBox($title) {
  # A small Windows box with a hidden field, so the token never passes through the chat or a log.
  Add-Type -AssemblyName System.Windows.Forms, System.Drawing
  $f = New-Object Windows.Forms.Form -Property @{ Text = $title; Width = 460; Height = 190; StartPosition = 'CenterScreen'; TopMost = $true; FormBorderStyle = 'FixedDialog'; MaximizeBox = $false }
  $l = New-Object Windows.Forms.Label -Property @{ Text = 'Paste your GHL Private Integration Token, then click Save.'; Left = 12; Top = 15; Width = 420 }
  $t = New-Object Windows.Forms.TextBox -Property @{ Left = 12; Top = 45; Width = 420; UseSystemPasswordChar = $true }
  $ok = New-Object Windows.Forms.Button -Property @{ Text = 'Save'; Left = 252; Top = 90; Width = 85; DialogResult = 'OK' }
  $no = New-Object Windows.Forms.Button -Property @{ Text = 'Cancel'; Left = 347; Top = 90; Width = 85; DialogResult = 'Cancel' }
  $f.Controls.AddRange(@($l, $t, $ok, $no)); $f.AcceptButton = $ok; $f.CancelButton = $no
  # Started from Claude in the background, the box can open behind other windows; pull it to the front and focus the field.
  $f.Add_Shown({ $f.Activate(); $f.BringToFront(); $t.Focus() })
  $r = $f.ShowDialog()
  if ($r -ne 'OK' -or -not $t.Text.Trim()) { throw 'No token was entered, so nothing was saved.' }
  return $t.Text.Trim()
}

function Test-GhlToken($locationId, $token) {
  $headers = @{ Authorization = "Bearer $token"; Version = '2021-07-28'; Accept = 'application/json' }
  try { $r = Invoke-RestMethod -Uri "https://services.leadconnectorhq.com/locations/$locationId" -Headers $headers -TimeoutSec 20; return $r.location.name }
  catch {
    $code = if ($_.Exception.Response) { [int]$_.Exception.Response.StatusCode } else { 0 }
    if ($code -eq 401) { throw 'GHL did not accept that token. Copy it again from Settings, Private Integrations, and retry.' }
    if ($code -eq 403) { throw 'The token works but cannot read this Location. Check the Location ID and that the token has the locations.readonly scope.' }
    if ($code -eq 400 -or $code -eq 404) { throw 'GHL could not find that Location ID. Copy it from Settings, Business Profile.' }
    throw "Could not reach GHL to check the token ($($_.Exception.Message))."
  }
}

function Add-GhlAccount {
  if (-not $AccountName -or -not $LocationId) { throw 'Give -AccountName and -LocationId.' }
  if (-not (Test-Path (Join-Path $GhlDir 'server\node_modules'))) { throw 'Install GHL social first (-Action install -Connector ghl-social).' }
  $token = Read-TokenBox "GHL token for $AccountName"
  $business = Test-GhlToken $LocationId.Trim() $token
  $h = Get-GhlAccounts
  $h[(Get-AccountKey $AccountName)] = [ordered]@{ locationId = $LocationId.Trim(); token = $token }
  Save-GhlAccounts $h
  [ordered]@{ result = 'account saved'; account = (Get-AccountKey $AccountName); ghl_business = $business; accounts = @($h.Keys)
    next = 'Fully quit Claude (tray icon, Quit) and open it again so the connector sees the new sub-account.' }
}

function Import-GhlAccounts {
  $plain = Join-Path $env:USERPROFILE '.hi5-ghl-social\accounts.json'
  if (-not (Test-Path $plain)) { throw 'There is no older accounts file to import.' }
  $h = Get-GhlAccounts
  (Read-Json $plain).PSObject.Properties | ForEach-Object { $h[(Get-AccountKey $_.Name)] = [ordered]@{ locationId = $_.Value.locationId; token = $_.Value.token } }
  Save-GhlAccounts $h
  [ordered]@{ result = 'imported'; accounts = @($h.Keys); plain_file = $plain
    next = 'The tokens are now saved encrypted. The old plain file still exists; the member can delete it once posting works.' }
}

try {
  $out = switch ($Action) {
    'check' { Get-Status }
    'install' { if ($Connector -eq 'capcut') { Install-CapCut } else { Install-Ghl } }
    'add-account' { Add-GhlAccount }
    'import-accounts' { Import-GhlAccounts }
  }
  $out | ConvertTo-Json -Depth 5
} catch {
  [ordered]@{ result = 'failed'; reason = $_.Exception.Message } | ConvertTo-Json
  exit 1
}
