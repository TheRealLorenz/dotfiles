# Export PATH environmental variable
export PATH="$PATH:$HOME/.local/bin"

# Load modules
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

# Styling
zstyle ':completion:*' menu select

# Load starship if present
which starship &>/dev/null \
    && eval "$(starship init zsh)" \
    || echo -e "\
Starship not installed.\n\
Install it via the following link: \
https://starship.rs/guide/#%F0%9F%9A%80-installation"

# Load homebrew if present (arm64)
[[ -d "/opt/homebrew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# History cache
HISTSIZE=10000
SAVEHIST=10000
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
HISTFILE=~/.cache/zsh/history
setopt share_history

# Tab completion
zmodload zsh/complist
_comp_options+=(globdots)

source "$HOME/.config/zsh/keybindings.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/lf.zsh"

# Set syntax highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null 

# Auto suggestion
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

