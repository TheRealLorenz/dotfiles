# Created by newuser for 5.8
#

# Load modules
autoload -Uz vcs_info
autoload -U colors && colors
autoload -U promptinit; promptinit
autoload -U compinit; compinit

# Styling
zstyle ':completion:*' menu select
prompt spaceship
spaceship_vi_mode_disable

# History cache
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt share_history

# Tab completion
zmodload zsh/complist
_comp_options+=(globdots)

# lfcd
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Keybindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey -s '^o' 'lfcd\n'

# Aliases
alias cat=bat
alias ls=exa
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

# Export PATH environmental variable
export PATH="$PATH:/home/lollo/.local/bin"

# Set syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null 

# Auto suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# echo -e "\n"
# # neofetch --ascii_bold off --ascii_colors 45 38 --bold on --colors 45 7 45 38 7 7
# neofetch

