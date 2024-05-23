function optional_alias() {
    which $2 &>/dev/null && alias $1=$2
}

# Setup 'copy' alias
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    alias copy="wl-copy"
  else
    alias copy="xclip -i"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias copy="pbcopy"
else
  echo "Couldn't setup 'copy' alias. Architecture '$OSTYPE' not supported"
fi

optional_alias cat bat
optional_alias ls eza

alias ll='ls -lh'
alias mkdir='mkdir -pv'
alias pong='ping google.com'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# --preserve-root option only available in linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
fi

alias wget='wget -c'
alias ssh="TERM=xterm-256color ssh"
alias bar="watch progress -w"
alias rm="printf 'vuoi sfondare tutto di nuovo?\n'"
alias cdtemp='cd $(mktemp -d)'
alias lg="lazygit"
alias s="source ~/.zshrc"

# Git aliases

alias gst="git status -s"

# Git log
glog() {
  git log --graph --oneline --color=always \
    | fzf --ansi --reverse \
        --preview "echo {} \
                  | grep -o '[a-f0-9]\{7\}' \
                  | xargs git show --color=always" \
        --bind=alt-j:preview-down,alt-k:preview-up \
    | grep -o '[a-f0-9]\{7\}'
}

# Git diff
gdiff() {
  git status --porcelain \
      | grep 'M' \
      | cut -c 4- \
      | gum choose \
      | xargs git diff $@
}

# Git branch new
gbn() {
  gum input --prompt 'New branch name: ' | xargs git checkout -b
}

# Git branch delete
gbd() {
  other_branches=$(git branch | grep -v "^\*")

  [[ -z $other_branches ]] \
      && echo "No branch to delete" \
      && return 1

  echo $other_branches \
      | gum choose --no-limit \
      | xargs git branch -d
}

# Git branch checkout
gbc() {
  other_branches=$(git branch | grep -v "^\*")

  [[ -z $other_branches ]] \
      && echo "No branch to checkout" \
      && return 1

  echo $other_branches \
      | gum choose \
      | xargs git checkout
}

# Git add
gadd() {
  git status --porcelain \
      | cut -c 4- \
      | gum choose --no-limit \
      | xargs git add $@
}
