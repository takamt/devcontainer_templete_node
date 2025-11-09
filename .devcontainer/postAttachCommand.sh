#!/bin/bash


# switch terminal to $SHELL
echo "Checking if $SHELL is installed..."
SHELL_PATH=$(command -v $SHELL)
if [ -n "$SHELL_PATH" ]; then
    echo "$SHELL is installed. Switching to $SHELL..."
    exec "$SHELL"
    # as switching shells, the rest of this script will not be executed
else
    echo "$SHELL is not installed. Staying with the default shell."
fi