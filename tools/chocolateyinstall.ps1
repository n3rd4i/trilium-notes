
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'https://github.com/zadam/trilium/releases/download/v0.34.3/trilium-windows-x64-0.34.3.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'trilium-notes*'
  checksum      = 'B787B80361A7B72729B5170F46D3ED009CFAD3FF661879549BCB67A4935046B0'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$BinPath = "$toolsDir\$AppFolder"

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$AppName.lnk" `
  -TargetPath "$BinPath\trilium.exe" `
  -WorkingDirectory "$BinPath"

## Desktop
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$BinPath\trilium.exe" `
  -WorkingDirectory "$BinPath"
