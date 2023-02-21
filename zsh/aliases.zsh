function optional_alias() {
    which $2 &>/dev/null && alias $1=$2
}

optional_alias cat bat
optional_alias ls exa

alias ll='ls -l'
#alias lf=lfrun
alias mkdir='mkdir -pv'
alias pong='ping google.com'
alias xclipout='xclip -o -selection clipboard'
alias xclipin='xclip -i -selection clipboard'
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
alias virsh="virsh --connect qemu:///system"
alias ide="tmux split-window -v -p 30"
alias rm="printf 'vuoi sfondare tutto di nuovo?\n'"
alias cdtemp="cd $(mktemp -d)"

function cdp() {
	cd $(ls -d */ | fzf)
}
