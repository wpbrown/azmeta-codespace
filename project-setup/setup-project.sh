#!/bin/bash
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
PROJECT_NAME="${1:-myproject}"

source "$DIR/../.devcontainer/virtualenv-wrapper-init.sh"
mkproject -r "$DIR/project-requirements.txt" "$PROJECT_NAME"
ipython kernel install --user --name=$(basename $VIRTUAL_ENV)
mkdir .vscode
cp "$DIR/workspace-settings.json" .vscode/settings.json