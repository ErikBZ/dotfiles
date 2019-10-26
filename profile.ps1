# Make it look nice
Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Agnoster

# Make tab completion not dumb
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# make it not beep like a dumb
Set-PSReadlineOption -BellStyle Visual
