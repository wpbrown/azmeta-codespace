FROM buildpack-deps:focal

RUN set -ex; \
    useradd -m -s /bin/bash codespace; \
    groupadd -g 800 docker; \
    usermod -aG docker,sudo codespace; \
    echo codespace:codespace | chpasswd; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install --yes apt-utils lsb-release; \
    apt-get install --yes tzdata libicu66 sudo vim python3-pip python3-venv; \
    curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -; \
    VERSION=node_12.x; \
    DISTRO=$(lsb_release -s -c); \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list; \
    echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list; \
    apt-get update; \
    apt-get install --yes nodejs; \
    apt-get clean --yes;

ENV SHELL=/bin/bash

WORKDIR /tmp

COPY --chown=codespace:codespace install install/

RUN ./install/system/install.sh;

USER codespace

RUN ./install/user/install.sh; \
    rm -rf /tmp/* /home/codespace/.cache/*;

WORKDIR /home/codespace