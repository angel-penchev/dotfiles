# brew (requires Xcode)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=./macos/Brewfile

# git
ln -sf $(pwd)/common/git/.gitconfig ~/.gitconfig

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf $(pwd)/common/zsh/.zshrc ~/.zshrc
chsh -s /bin/zsh