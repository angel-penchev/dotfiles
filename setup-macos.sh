#*brew
# Requires Xcode
# Install homebrew and all the packages in Brewfile
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file="./macos/Brewfile"


#*git
# Configure git
ln -sf "$(pwd)/common/git/.gitconfig" "$HOME/.gitconfig"


#*zsh
# Install oh-my-zsh and powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure zsh
ln -sf "$(pwd)/common/zsh/.zshrc" "$HOME/.zshrc"

# Change default shell to zsh
chsh -s /bin/zsh


#*vscode
ln -sf "$(pwd)/common/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$(pwd)/common/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "$(pwd)/common/vscode/snippets" "$HOME/Library/Application Support/Code/User"
