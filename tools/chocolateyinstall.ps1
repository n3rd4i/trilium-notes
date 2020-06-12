
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/zadam/trilium/releases/download/v0.42.3/trilium-windows-x64-0.42.3.zip'
  checksum      = '67497B40B79819B1AA2795291BAAA4D544F2344C5CE5827F6E138ADE1F21B3D3'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$BinPath = "$toolsDir\$AppFolder"

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$AppName.lnk" `
  -TargetPath "$BinPath\trilium.exe" `
  -WorkingDirectory "$BinPath"
