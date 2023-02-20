#!/bin/bash
set -exu
set -o pipefail

# Whether to add the path of the installed executables to system PATH
ADD_TO_SYSTEM_PATH=true
# select which shell we are using
USE_ZSH_SHELL=true
USE_BASH_SHELL=false
if [[ ! -d "$HOME/packages/" ]]; then
    mkdir -p "$HOME/packages/"
fi

if [[ ! -d "$HOME/tools/" ]]; then
    mkdir -p "$HOME/tools/"
fi
#######################################################################
#                                Nvim install                         #
#######################################################################
NVIM_DIR=$HOME/tools/nvim
NVIM_SRC_NAME=$HOME/packages/nvim-linux64.tar.gz
NVIM_CONFIG_DIR=$HOME/.config/nvim
NVIM_LINK="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
if [[ ! -f "$NVIM_DIR/bin/nvim" ]]; then
    echo "Installing Nvim"
    echo "Creating nvim directory under tools directory"

    if [[ ! -d "$NVIM_DIR" ]]; then
        mkdir -p "$NVIM_DIR"
    fi

    if [[ ! -f $NVIM_SRC_NAME ]]; then
        echo "Downloading Nvim"
        wget "$NVIM_LINK" -O "$NVIM_SRC_NAME"
    fi
    echo "Extracting neovim"
    tar zxvf "$NVIM_SRC_NAME" --strip-components 1 -C "$NVIM_DIR"

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
        echo "export PATH=\"$NVIM_DIR/bin:\$PATH\"" >> "$HOME/.bash_profile"
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_ZSH_SHELL" = true ]]; then
        echo "export PATH=\"$NVIM_DIR/bin:\$PATH\"" >> "$HOME/.zshrc"
    if 
else
    echo "Nvim is already installed. Skip installing it."
fi

