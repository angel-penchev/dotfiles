#*code
Remove-Item "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
Remove-Item "$Env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json"
Remove-Item "$Env:USERPROFILE\AppData\Roaming\Code\User\snippets"
cmd /c mklink /j "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json" "$PSScriptRoot\common\vscode\settings.json"
cmd /c mklink /j "$Env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json" "$PSScriptRoot\common\vscode\keybindings.json"
cmd /c mklink /j /d "$Env:USERPROFILE\AppData\Roaming\Code\User\snippets" "$PSScriptRoot\common\vscode\snippets"