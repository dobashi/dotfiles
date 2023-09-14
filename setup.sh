#!/bin/bash

DIR=$(cd $(dirname $0); pwd)
echo script path=$DIR
. $DIR/os.sh

# bashrc
cp ~/.bashrc ~/.bashrc.bak
cat << EOF >> ~/.bashrc

# include dotfiles/bashrc
DOTFILES_DIR=$DIR
if [ -f \$DOTFILES_DIR/bashrc ]; then
   . \$DOTFILES_DIR/bashrc
fi
EOF

# vim
ln -s $DIR/vimrc ~/.vimrc

# git
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/git-prompt.sh ~/.git-prompt.sh
ln -s $DIR/git-completion.bash ~/.git-completion.bash

# Linux
if isLinux; then
  sudo apt update -y \
  && sudo apt upgrade -y \
  && sudo apt install -y git trash-cli \
  && sudo apt clean
fi

# macOS
if isMac; then
  cat ~/.bashrc >> ~/.zshrc
  echo "Homebrew start"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Install git, trash, exa and tools"
  brew install git trash tree vim pstree exa
  echo "Enable key repeat"
  defaults write -g ApplePressAndHoldEnabled -bool false
fi


