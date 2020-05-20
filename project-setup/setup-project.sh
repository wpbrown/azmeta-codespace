#!/bin/bash
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
source "$DIR/../.devcontainer/virtualenv-wrapper-init.sh"

mkproject -r "$DIR/project-requirements.txt" myproject
ipython kernel install --user --name=$(basename $VIRTUAL_ENV)