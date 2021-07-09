
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/zadam/trilium/releases/download/v0.47.5/trilium-windows-x64-0.47.5.zip'
  checksum      = '044f8584cab3272d2ae2442f72ceda9dd9427b2cf2331aa2c693d77ae4e454be'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$BinPath = "$toolsDir\$AppFolder"

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$AppName.lnk" `
  -TargetPath "$BinPath\trilium.exe" `
  -WorkingDirectory "$BinPath"
