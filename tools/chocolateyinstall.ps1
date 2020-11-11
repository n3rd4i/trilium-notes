
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/zadam/trilium/releases/download/v0.45.3/trilium-windows-x64-0.45.3.zip'
  checksum      = '25c4c64f6501e5735a4450f5f92a188b69f9c9d7e06c4783a2afa0edfb4a2acc'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$BinPath = "$toolsDir\$AppFolder"

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$AppName.lnk" `
  -TargetPath "$BinPath\trilium.exe" `
  -WorkingDirectory "$BinPath"
