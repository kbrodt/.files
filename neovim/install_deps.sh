#!/bin/bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installubuntu() {
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
}

installarch() {
    sudo pacman -S base-devel cmake unzip ninja tree-sitter
}

installdeps() {
    (uname -a | grep -q Ubuntu) && installubuntu
    (uname -a | grep -q -E "(arch|artix)") && installarch
}

installdeps
