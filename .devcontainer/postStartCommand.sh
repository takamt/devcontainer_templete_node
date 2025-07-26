#!/bin/bash

# Wait for dotfiles installation to finish, then switch terminal to zsh
bash -c \
    'while [ ! -f ~/.dotfiles-installed ]; do \
        echo \"Waiting for dotfiles installation...\"; \
        sleep 1; \
    done; \
    echo \"Dotfiles installation completed!\"' \
    && zsh
