#*git
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue "${Env:USERPROFILE}\.gitconfig"
cmd /c mklink "${Env:USERPROFILE}\.gitconfig" "$PSScriptRoot\common\git\.gitconfig"

#*wsl
# Enable WSL
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Install WSL version 2
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile WSLUpdate.msi -UseBasicParsing
msiexec.exe /package WSLUpdate.msi /quiet
wsl --set-default-version 2


#*code
Remove-Item -Force -ErrorAction SilentlyContinue "${Env:USERPROFILE}\AppData\Roaming\Code\User\settings.json"
Remove-Item -Force -ErrorAction SilentlyContinue "${Env:USERPROFILE}\AppData\Roaming\Code\User\keybindings.json"
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue "${Env:USERPROFILE}\AppData\Roaming\Code\User\snippets"
cmd /c mklink "${Env:USERPROFILE}\AppData\Roaming\Code\User\settings.json" "$PSScriptRoot\common\vscode\settings.json"
cmd /c mklink "${Env:USERPROFILE}\AppData\Roaming\Code\User\keybindings.json" "$PSScriptRoot\common\vscode\keybindings.json"
cmd /c mklink /j "${Env:USERPROFILE}\AppData\Roaming\Code\User\snippets" "$PSScriptRoot\common\vscode\snippets"
& "$PSScriptRoot\common\vscode\extensions.ps1"

#*csgo
Remove-Item -Force "${Env:ProgramFiles(x86)}\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\tsb.cfg"
cmd /c mklink "${Env:ProgramFiles(x86)}\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\tsb.cfg" "$PSScriptRoot\common\csgo\cfg\tsb.cfg"
