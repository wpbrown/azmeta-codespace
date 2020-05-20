#!/bin/bash
set -ex
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
PROJECT_SETUP_DIR=$DIR/../project-setup

# Standard Codespaces style prompt
sed -i 's/\\u@\\h/\\u/' $HOME/.bashrc

# Basic Python environment setup
mkdir -p $HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH
pip3 install --user --upgrade pipx
pipx install virtualenv

# Install virtualenvwrapper
pipx inject virtualenv virtualenvwrapper
echo >> $HOME/.bashrc
cat $DIR/virtualenv-wrapper-init.sh >> $HOME/.bashrc

# Install the latest Azure CLI
pipx install azure-cli

# Install Jupyter Lab
pipx install --include-deps jupyterlab

# Setup the default project environment
$PROJECT_SETUP_DIR/setup-project.sh
