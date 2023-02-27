function optional_alias() {
    which $2 &>/dev/null && alias $1=$2
}

optional_alias cat bat
optional_alias ls exa

alias ll='ls -l'
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
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias wget='wget -c'
alias ssh="TERM=xterm-256color ssh"
alias bar="watch progress -w"
alias rm="printf 'vuoi sfondare tutto di nuovo?\n'"
alias cdtemp="cd $(mktemp -d)"

function cdf() { cd $(ls -d */ | fzf) }

alias s="source ~/.zshrc"

alias gcm="git commit"
alias gcma="git commit --amend"
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glop="git log --oneline --color=always | fzf --ansi --preview 'git show {+1} --color=always' | cut -d ' ' -f1 | wl-copy"
alias gst="git status"

function gcmf() {
    SUMMARY=$(gum input --placeholder "Summary of this change")
    DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

    gum confirm "Commit changes?" \
        && git commit -m "$SUMMARY" -m "$DESCRIPTION" \
        || echo "Aborted"
}
