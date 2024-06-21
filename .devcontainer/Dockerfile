FROM ubuntu:22.04

RUN apt update \
 && apt install -y \
        curl \
        git \
        jq \
        libz-dev \
        make \
        rlwrap \
        xz-utils \
 && true

RUN curl -s https://yamlscript.org/install | BIN=1 bash

RUN curl -s https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN bash -i -c 'nvm install 21.7.3'
RUN bash -i -c 'npm install -g prettier'
