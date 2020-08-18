#!/bin/bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installubuntu() {
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
}

installdeps() {
    (uname -a | grep -q Ubuntu) && installubuntu
}

installdeps
