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

# History cache
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt share_history

# Tab completion
zmodload zsh/complist
_comp_options+=(globdots)

# Keybindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
# bindkey "^M" magic-enter

# Aliases
alias cat=bat
alias ls=exa
alias ll='ls -l'
alias lf=lfrun
alias mkdir='mkdir -pv'
alias pong='ping google.com'
alias xclipout='xclip -o -selection clipboard'
alias xclipin='xclip -i -selection clipboard'
alias ~='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias wget='wget -c'
alias ssh="TERM=xterm-256color ssh"

# Export PATH environmental variable
export PATH="$PATH:/home/lollo/.local/bin"

# Set syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null 

# Auto suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# echo -e "\n"
# # neofetch --ascii_bold off --ascii_colors 45 38 --bold on --colors 45 7 45 38 7 7
# neofetch

spaceship_vi_mode_disable

#lf to switch dir
lfcd() {
        tmp="$(mktemp)"
        lfrun -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
                dir="$(cat "$tmp")"
                rm -f "$tmp"
                [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
}
bindkey -s '^o' 'lfcd
'
