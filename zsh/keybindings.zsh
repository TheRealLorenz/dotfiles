# Emacs mode (default)
bindkey -e

# Keybindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey -s '^O' 'yacd\n'
