# load antigen before all yo!
source ~/antigen/antigen.zsh
antigen init ~/.antigenrc

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# configure spaceship
# export SPACESHIP_RUBY_SHOW=false;
export SPACESHIP_PROMPT_SYMBOL=$;
export SPACESHIP_PREFIX_SHOW=false;
export SPACESHIP_PREFIX_ENV_DEFAULT=' ';

# my aliases & helper functions

# 'cuz aliases
alias c='xclip -selection c'
alias pelis='~/bin/stremio/Stremio.sh '
alias ccat='pygmentize -g'
alias :wq="exit"
alias rollback="git reset HEAD~"

# diff so fancy :D
function gdiff {
  git diff --color $@ | diff-so-fancy
}

# git config switcher
function gconfig {
  if [ -z $1 ] || [ -z $2 ] ; then
    echo "user.name: $(git config --global user.name)"
    echo "user.email: $(git config --global user.email)"
  else
    git config --global user.name $1
    git config --global user.email $2
    echo "user.name: $(git config --global user.name)"
    echo "user.email: $(git config --global user.email)"
  fi
}

# le wifi password
function lewifi {
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  BOLD=$(tput bold)

  LE_PASS="L7YL7OYFL1TR";
  echo $LE_PASS | c;
  echo "${GREEN}Home password: ${RED}${LE_PASS}";
  echo "${BOLD}${GREEN}Copied to clipboard!!!";
}

# review PR files one by one
function pr-review-files() {
  for i in $(git diff master --name-only)
  do
    GIT_PAGER=less git diff master -- $i
  done
}

# review-pr <pr-number>
function pr-review() {
  if [ $# -eq 0 ]
  then
    echo "Missing PR number"
    return 1
  fi

  local cyan='\e[36m'
  local reset='\e[0m'

  echo "${cyan}Update master branch${reset}"
  git fetch || (echo "The directory is not in a git repository" && return 1) || return 1
  git checkout master
  git merge

  echo "${cyan}Get PR branch${reset}"
  git fetch origin pull/$1/head > /dev/null 2>&1
  git checkout FETCH_HEAD > /dev/null 2>&1
  local branch=`git branch -ra --contains FETCH_HEAD --sort=committerdate | grep remotes | sed 's/remotes\/origin\///' | head -n 1 | tr -d '[:space:]'`
  git checkout $branch
  git merge

  echo "${cyan}Merge master into branch${reset}"
  git merge --no-edit master
}

# shrug
function shrug {
  SHRUG="¯\\_(ツ)_/¯"
  echo $SHRUG
  echo $SHRUG | c
}

# NVM
export NVM_DIR="/home/gillchristian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "/home/gillchristian/.gvm/scripts/gvm" ]] && source "/home/gillchristian/.gvm/scripts/gvm"

# golang's GOPATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/dev/go"
# export GOPATH="$HOME/temp-go/go"
export PATH="$PATH:$GOPATH/bin"

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.anyenv/bin:$PATH"

# anyenv
eval "$(anyenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# caddy
export PATH="$HOME/bin/caddy:$PATH"

# dir colors
eval $(dircolors -b $HOME/.dircolors)

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

