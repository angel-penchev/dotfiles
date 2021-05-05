#*brew
#!Requires Xcode
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
source "$HOME/.zshrc"

# Change default shell to zsh
chsh -s /bin/zsh


#*vscode
# Configure vscode
ln -sf "$(pwd)/common/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$(pwd)/common/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "$(pwd)/common/vscode/snippets" "$HOME/Library/Application Support/Code/User"


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