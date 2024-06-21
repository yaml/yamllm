FROM ubuntu:22.04

RUN apt update \ 
 && apt install -y \
        curl \
        jq \
        libz-dev \
        make \
        xz-utils \
        git \
 && true

RUN curl -s https://yamlscript.org/install | BIN=1 bash
