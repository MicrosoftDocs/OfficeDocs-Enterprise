param ($FolderName = ".\")

$moduleName = "MSGraphTokenLifetimePolicy.psm1"
$path = join-path $FolderName $moduleName

if(-not (Test-Path $path))
{
    Write-Error "Please set FolderName to the folder containing $moduleName"
}

Write-host ("Importing Module: {0}" -f $path)

Import-Module $path
Import-ActiveDirectoryAuthenticationLibrary