#!/bin/bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installubuntu() {
    : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        --no-install-recommends \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        unzip \
        curl \
    && apt-get clean \
    && :
}

installarch() {
    : \
    && pacman -Sy \
    && pacman -S \
        base-devel \
        cmake \
        unzip \
        ninja \
        curl \
        libuv \
        libluv \
        libtermkey \
        libvterm \
        luajit \
        lua-lpeg \
        lua-mpack \
        msgpack-c \
        tree-sitter \
        unibilium \
    && :
}

installdeps() {
    (uname -a | grep -iq -E "(debian|ubuntu)") && installubuntu
    (uname -a | grep -iq -E "(arch|artix)") && installarch
}

installdeps
