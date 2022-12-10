#!/bin/bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installubuntu() {
    : \
    && sudo apt-get update \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
    && sudo apt-get clean \
    && :
}

installarch() {
    : \
    && sudo pacman -Sy \
    && sudo pacman -S \
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
