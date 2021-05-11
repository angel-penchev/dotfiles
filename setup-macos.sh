#!/bin/bash
#*brew
#!Requires Xcode
# Install homebrew and all the packages in Brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file="./macos/Brewfile"


#*git
# Configure git
ln -sf "$(pwd)/common/git/.gitconfig" "$HOME/.gitconfig"


#*zsh
# Install oh-my-zsh and powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure zsh
#!/bin/zsh
ln -sf "$(pwd)/common/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/common/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
source "$HOME/.zshrc"

# Change default shell to zsh
chsh -s /bin/zsh


#*vscode
# Configure vscode
code
ln -sf "$(pwd)/common/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$(pwd)/common/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sfF "$(pwd)/common/vscode/snippets" "$HOME/Library/Application Support/Code/User"


#*nvm
# Remove preinstalled node version
brew uninstall --ignore-dependencies node
brew uninstall --force node

# Install LTS version of node
mkdir ~/.nvm
nvm install --lts
nvm use --lts

# Update npm
npm install -g npm


#*eslint
# Install eslint
npm i -g eslint
(cd "$HOME" ; npm i eslint-plugin-react @typescript-eslint/eslint-plugin eslint-config-google @typescript-eslint/parser)
chflags hidden "$HOME/node_modules"
rm "$HOME/package*"

# Configure eslint
ln -sf "$(pwd)/common/eslint/.eslintrc.json" "$HOME/.eslintrc.json"


#*java
# Configure jenv with maven
jenv enable-plugin export
jenv enable-plugin maven
jenv global 14

# Register adoptopenjdk{8, 11, 14}
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-14.jdk/Contents/Home/


#*flutter
# Accept Android licenses
jenv local 1.8
flutter doctor --android-licenses