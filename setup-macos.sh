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
ln -sf "$(pwd)/common/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$(pwd)/common/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sfF "$(pwd)/common/vscode/snippets" "$HOME/Library/Application Support/Code/User/snippets"


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


#*java
# Configure jenv with maven
jenv enable-plugin export
jenv enable-plugin maven
jenv global 1.8

# Register adoptopenjdk{8, 11, 14}
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-14.jdk/Contents/Home/


#*flutter
# Accept android licenses
flutter doctor --android-licenses


#*spicetify
# Initialize and backup theme
spicetify
spicetify backup apply enable-devtool

# Copy themes and extensions
rm -r "$HOME/spicetify_data/Themes"
rm -r "$HOME/spicetify_data/Extensions"
ln -sfF "$(pwd)/common/spicetify/Themes" "$HOME/spicetify_data/Themes"
ln -sfF "$(pwd)/common/spicetify/Extensions" "$HOME/spicetify_data/Extensions"

# Update spotify theme
spicetify restore
spicetify config extensions dribbblish.js
spicetify config current_theme dribbblish
spicetify config color_scheme red-ocean
spicetify apply
