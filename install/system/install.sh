#!/bin/bash
set -ex
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
PROJECT_INSTALL_DIR=$DIR/../project
USER_INSTALL_DIR=$DIR/../user

mkdir -p /opt/azmeta/lib
mkdir -p /opt/azmeta/libexec
mkdir -p /opt/azmeta/share/azmeta
cp $DIR/init-codespace.sh /opt/azmeta/libexec
cp $PROJECT_INSTALL_DIR/attach.sh /opt/azmeta/libexec
cp $USER_INSTALL_DIR/virtualenv-wrapper-init.sh /opt/azmeta/lib
cp -r $PROJECT_INSTALL_DIR/workspace /opt/azmeta/share/azmeta