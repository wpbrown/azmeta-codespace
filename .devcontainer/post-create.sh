#!/bin/bash
set -ex

mkdir -p $HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH

sed -i 's/\\u@\\h/\\u/' $HOME/.bashrc

pip3 install --user --upgrade pipx
pipx install virtualenv
pipx inject virtualenv virtualenvwrapper

echo >> $HOME/.bashrc
echo 'export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/pipx/venvs/virtualenv/bin/python' >> $HOME/.bashrc
echo 'export PROJECT_HOME=$HOME/workspace' >> $HOME/.bashrc
echo 'source $HOME/.local/pipx/venvs/virtualenv/bin/virtualenvwrapper.sh' >> $HOME/.bashrc

pipx install azure-cli