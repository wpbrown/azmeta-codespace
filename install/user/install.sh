#!/bin/bash
set -ex
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
PROJECT_INSTALL_DIR=$DIR/../project

# Standard Codespaces style prompt
sed -i 's/\\u@\\h/\\u/' $HOME/.bashrc

# Basic Python environment setup
mkdir -p $HOME/.local/bin
mkdir $HOME/workspace
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

# Install plotly support
pipx inject jupyterlab ipywidgets
jupyter labextension install --no-build jupyterlab-plotly@4.8.1
jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager plotlywidget@4.8.1
jupyter lab build
jupyter lab clean

# Setup the default project environment
$PROJECT_INSTALL_DIR/install.sh

# Temporary workaround (issue #2)
mkdir -p $HOME/.cache/black/19.10b0
