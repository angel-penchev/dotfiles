#!/bin/bash
#*pacman

#*git
# Configure git
ln -sf "$(pwd)/common/git/.gitconfig" "$HOME/.gitconfig"


#*zsh
# Install oh-my-zsh and powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure zsh
ln -sf "$(pwd)/common/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/common/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
# Change default shell to zsh
chsh -s /bin/zsh


#*nvm
# Remove preinstalled node version
pacman -U --ignore-dependencies node
pacman -U --force node

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
rm "$HOME/package*"

# Configure eslint
ln -sf "$(pwd)/common/eslint/.eslintrc.json" "$HOME/.eslintrc.json"