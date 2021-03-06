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
        tree-sitter \
    && :
}

installdeps() {
    (uname -a | grep -iq -E "(debian|ubuntu)") && installubuntu
    (uname -a | grep -iq -E "(arch|artix)") && installarch
}

installdeps
