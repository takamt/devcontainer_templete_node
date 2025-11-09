#!/bin/bash

# shell history persistence
echo "Setting up shell history persistence..."
## shell setting file: bash | zsh | fish
SHELL_SETTING_FILE=$( \
    if [ "$SHELL" = "bash" ]; then
        echo ".bashrc"
    elif [ "$SHELL" = "zsh" ]; then
        echo ".zshrc"
    elif [ "$SHELL" = "fish" ]; then
        echo ".config/fish/config.fish"
    else
        echo ".shellrc"
    fi
)
## command history directory: persisted by compose volume
CMD_HIST_DIR="/command_history"
CMD_HIST_FILE="${CMD_HIST_DIR}/.${SHELL}_history"
mkdir -p $CMD_HIST_DIR && touch $CMD_HIST_FILE
EXPORT_HISTFILE_CMD="export HISTFILE=$CMD_HIST_FILE"
eval "$EXPORT_HISTFILE_CMD"
echo "$EXPORT_HISTFILE_CMD" >> /home/$USERNAME/$SHELL_SETTING_FILE
echo "HISTFILE=$HISTFILE" # for checking
echo ""


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