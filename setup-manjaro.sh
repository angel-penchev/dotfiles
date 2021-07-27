#!/bin/bash
#*pacman

#*git
# Configure git
ln -sf "$(pwd)/common/git/.gitconfig" "$HOME/.gitconfig"


#*zsh
# Install oh-my-zsh and powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure zsh
ln -sf "$(pwd)/common/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/common/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
# Change default shell to zsh
chsh -s /bin/zsh


#*vscode
# Configure vscode
ln -sf "$(pwd)/common/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -sf "$(pwd)/common/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
ln -sfF "$(pwd)/common/vscode/snippets" "$HOME/.config/Code/User/snippets"

# Install extensions
sh ./common/vscode/extensions.sh


#*nvm
# Install LTS version of node
mkdir ~/.nvm
nvm install --lts
nvm use --lts

# Update npm
npm install -g npm


#*jenv
# Configure jenv with maven
jenv enable-plugin export
jenv enable-plugin maven
jenv global 1.8

# Register openjdk{8, 11}
jenv add /usr/lib/jvm/java-8-openjdk/jre/
jenv add /usr/lib/jvm/java-11-openjdk/


#*flutter
# Accept android licenses
flutter doctor --android-license


#*spicetify
# Copy themes and extensions
ln -sfF "$(pwd)/common/spicetify/Themes" "$HOME/.config/spicetify/Themes"
ln -sfF "$(pwd)/common/spicetify/Extensions" "$HOME/.config/spicetify/Extensions"

# Initialize and backup theme
spicetify
spicetify backup apply enable-devtool

# Update spotify theme
spicetify restore
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish
spicetify config color_scheme red-ocean
spicetify apply
