# Load modules
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

# Styling
zstyle ':completion:*' menu select
prompt spaceship

# History cache
HISTSIZE=10000
SAVEHIST=10000
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
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

# Emacs mode (default)
bindkey -e

# Keybindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey -s '^o' 'lfcd\n'

function optional_alias() {
    which $2 &>/dev/null && alias $1=$2
}

# Aliases
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

# Export PATH environmental variable
export PATH="$PATH:/home/$USER/.local/bin"

# Set syntax highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null 

# Auto suggestion
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# echo -e "\n"
# # neofetch --ascii_bold off --ascii_colors 45 38 --bold on --colors 45 7 45 38 7 7
# neofetch

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm hook
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
