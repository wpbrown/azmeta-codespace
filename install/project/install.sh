#!/bin/bash
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
USER_INSTALL_DIR=$DIR/../user
PROJECT_NAME="${1:-azmeta-project}"

source "$USER_INSTALL_DIR/virtualenv-wrapper-init.sh"
mkvirtualenv -r "$DIR/project-requirements.txt" "$PROJECT_NAME"
ipython kernel install --user --name=$(basename $VIRTUAL_ENV)
