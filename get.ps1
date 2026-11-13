# Downloadt de nieuwste versie van EKT Ophalen en installeert die voor de huidige gebruiker.
# Gebruik:  irm https://raw.githubusercontent.com/JanesvO/ekt-ophalen-download/main/get.ps1 | iex
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$zipUrl = "https://github.com/JanesvO/ekt-ophalen-download/releases/latest/download/EKTOphalen.zip"
$workDir = Join-Path $env:TEMP ("ektophalen-" + [guid]::NewGuid().ToString("N").Substring(0, 8))
$zipPath = Join-Path $workDir "EKTOphalen.zip"

New-Item -ItemType Directory -Force -Path $workDir | Out-Null
try {
    Write-Host "EKT Ophalen downloaden..."
    $ProgressPreference = "SilentlyContinue"
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
    Expand-Archive -LiteralPath $zipPath -DestinationPath $workDir -Force
    $installer = Join-Path $workDir "EKTOphalen\install.ps1"
    if (-not (Test-Path -LiteralPath $installer)) { throw "install.ps1 niet gevonden in de download." }
    & powershell.exe -ExecutionPolicy Bypass -NoProfile -File $installer
    if ($LASTEXITCODE -ne 0) { throw "De installatie is mislukt (exitcode $LASTEXITCODE)." }
} finally {
    Remove-Item -LiteralPath $workDir -Recurse -Force -ErrorAction SilentlyContinue
}
