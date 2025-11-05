#!/bin/bash

# Wait for dotfiles installation to finish.
if [ -d "$HOME/dotfiles" ]; then
    bash -c \
        'while [ ! -f ~/.dotfiles-installed ]; do \
            echo \"Waiting for dotfiles installation...\"; \
            sleep 1; \
        done;'
    echo "Dotfiles installation completed!"
else
    echo "No dotfiles directory found. You can use the 'dotfiles' feature."
fi

# Then switch terminal to $SHELL
SHELL_PATH=$(command -v $SHELL)
if [ -n "$SHELL_PATH" ]; then
    echo "$SHELL is installed. Switching to $SHELL..."
    sudo chsh -s "$SHELL_PATH" "$USERNAME"
    exec "$SHELL"
else
    echo "$SHELL is not installed. Staying with the default shell."
fi
