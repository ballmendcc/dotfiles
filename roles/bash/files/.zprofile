if [ -n "$ZSH_VERSION" -a -n "$PS1" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
    . "$HOME/.zshrc"
    fi
fi
