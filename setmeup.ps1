function install_fonts()
{
    # download zip so I don't have to have enter git creds
    if ( -not (Test-Path "./fonts.zip"))
    {
        Invoke-WebRequest https://github.com/powerline/fonts/archive/master.zip -OutFile ./fonts.zip
        Expand-Archive -Path "./fonts.zip" -DestinationPath "./"
    }
    else
    {
        Write-Output "Fonts zip file present. Skipping download."
    }

    $fonts_script = $PSScriptRoot + "\fonts-master\install.ps1 -WhatIf"
    Invoke-Expression $fonts_script

    #Remove-Item -Recurse -Force fonts-master
}

install_fonts

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Copy-Item -Path .\profile.ps1 -Destination $profile -Force

Write-Output "Reloading profile"
. $profile