# Load modules
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

# Styling
zstyle ':completion:*' menu select

# History cache
HISTSIZE=10000
SAVEHIST=10000
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
HISTFILE=~/.cache/zsh/history
setopt share_history

# Tab completion
zmodload zsh/complist
_comp_options+=(globdots)

# Export PATH environmental variable
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"

function source_if_exists() {
  [[ -f $1 ]] && source $1
}

source_if_exists "$HOME/.config/zsh/env.zsh"
source_if_exists "$HOME/.config/zsh/brew.zsh"
source_if_exists "$HOME/.config/zsh/starship.zsh"
source_if_exists "$HOME/.config/zsh/cargo.zsh"
source_if_exists "$HOME/.config/zsh/keybindings.zsh"
source_if_exists "$HOME/.config/zsh/aliases.zsh"
source_if_exists "$HOME/.config/zsh/yazi.zsh"
source_if_exists "$HOME/.config/zsh/pnpm.zsh"
source_if_exists "$HOME/.config/zsh/templates.zsh"

# Set syntax highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null 

# Auto suggestion
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null


# bun completions
[ -s "/Users/lollo/.bun/_bun" ] && source "/Users/lollo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
