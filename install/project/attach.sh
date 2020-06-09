#!/bin/bash
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
LIB_DIR=$DIR/../lib
SHARE_DIR=$DIR/../share/azmeta
PROJECT_NAME="${1:-azmeta-project}"

WORKSPACE=$(find $HOME/workspace -mindepth 1 -maxdepth 1 -type d | head -n 1)

source "$LIB_DIR/virtualenv-wrapper-init.sh"
setvirtualenvproject $PROJECT_NAME "$WORKSPACE"
mkdir "$WORKSPACE/.vscode"
cp "$SHARE_DIR/workspace/settings.json" "$WORKSPACE/.vscode"
cp "$SHARE_DIR/workspace/tasks.json" "$WORKSPACE/.vscode"