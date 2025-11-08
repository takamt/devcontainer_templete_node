#!/bin/bash

# Then switch terminal to $SHELL
SHELL_PATH=$(command -v $SHELL)
if [ -n "$SHELL_PATH" ]; then
    echo "$SHELL is installed. Switching to $SHELL..."
    exec "$SHELL"
else
    echo "$SHELL is not installed. Staying with the default shell."
fi
