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
optional_alias ls exa

alias ll='ls -lh'
alias mkdir='mkdir -pv'
alias pong='ping google.com'
alias ~='cd ~'
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
alias cdtemp="cd $(mktemp -d)"
alias lg="lazygit"

alias s="source ~/.zshrc"

# Git commit
alias gcm="git commit"
alias gcma="git commit --amend"
function gcmf() {
    SUMMARY=$(gum input --placeholder "Summary of this change")
    DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

    gum confirm "Commit changes?" \
        && git commit -m "$SUMMARY" -m "$DESCRIPTION" \
        || echo "Aborted"
}

# Git log
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glop="git log --oneline --color=always | fzf --ansi --preview 'git show {+1} --color=always' | cut -d ' ' -f1 | copy"

# Git status
alias gst="git status"

# Git branch
alias gbd="git branch | grep -v "^\*" | gum choose --no-limit | xargs git branch -d"
alias gbc="git branch | gum choose | xargs git checkout"
