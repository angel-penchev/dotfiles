# git
ln -sf $(pwd)/common/git/.gitconfig ~/.gitconfig

# brew (requires Xcode)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=./macos/Brewfile