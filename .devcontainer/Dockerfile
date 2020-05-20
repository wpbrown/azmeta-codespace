FROM buildpack-deps:focal

RUN set -ex; \
    useradd -m -s /bin/bash codespace; \
    groupadd -g 800 docker; \
    usermod -aG docker,sudo codespace; \
    echo codespace:codespace | chpasswd;

RUN set -ex; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install --yes apt-utils; \
    apt-get install --yes tzdata libicu66 sudo vim python3-pip python3-venv nodejs npm;

USER codespace
