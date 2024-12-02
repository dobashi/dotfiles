#!/bin/bash

isLinux() {
  [ $(uname) = "Linux" ]
}
isMac() {
  [ $(uname) = "Darwin" ]
}
isCygwin(){
  if isLinux || isMac; then
   false 
  else
    [ $(uname -o) = "Cygwin" ]
  fi
}
gitCompletion(){
  source ~/.git-prompt.sh
  source ~/.git-completion.bash
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\033[01;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

}

export EDITOR=vim
export GIT_EDITOR=$EDITOR

alias vi='vim'
alias mv='mv -i'
alias ls='exa -F --icons --group-directories-first --time-style long-iso'
#alias ls='ls -F'
alias ll='ls -l'
alias llh='ls -lh'
alias la='ls -a -a'
alias lla='ls -la -a'
alias df='df -h | grep -v /dev/loop'

ERL_AFLAGS="-kernel shell_history enabled"

PATH=$PATH:$HOME/bin

# Linux only
if isLinux; then
  alias open='xdg-open'
  alias rm='trash-put'
  gitCompletion
fi

# macOS
if isMac; then
  alias rm='trash' # -F'
  alias top='top -o cpu'
  alias locate='mdfind -name'
  #alias updatedb='cd /usr/libexec; sudo /usr/libexec/locate.updatedb'
  alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
  alias term='/System/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal'
  alias vim='/opt/homebrew/bin/vim'
#  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.zsh
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUPSTREAM=auto
  setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f:%F{cyan}%1~%F{red}$(__git_ps1 "(%s)")%f\$ '
#  setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
#\$ '
fi

# Cygwin
if isCygwin; then
  alias open='explorer'
  gitCompletion
fi

#git
alias g='git'
alias gac='git add .;git commit'
alias gsu='git submodule update'

# gradle
alias gradlea='./gradlew assemble'
alias gradleb='./gradlew build'
alias gradlec='./gradlew clean' 
alias gradlei='./gradlew --warning-mode all publishToMaveLocal'

# npm
export PATH=$PATH:./node_modules/.bin/:./assets/node_modules/.bin/
alias npmb='time npm run build'
alias npmd='time npm run deploy'

# cd
alias cd..2='cd ../..'
alias cd..3='cd ../../../'
alias cd..4='cd ../../../..'

# history
alias his='history'
alias his1='history 1000'
alias hisg='history 900 | grep'
