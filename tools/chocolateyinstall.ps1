
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'https://github.com/zadam/trilium/releases/download/v0.41.5/trilium-windows-x64-0.41.5.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'trilium-notes*'
  checksum      = '0CDF75ABC443751EF6ABFB1154FC00E8403C89A10F37738C01EE29A484848E38'
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
