which starship &>/dev/null \
    && eval "$(starship init zsh)" \
    || echo -e "\
Starship not installed.\n\
Install it via the following link: \
https://starship.rs/guide/#%F0%9F%9A%80-installation"
