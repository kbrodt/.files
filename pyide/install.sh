#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

python3 -m pip install --upgrade --user \
    pip jedi black rope flake8 mypy pynvim \
    cpplint clang-format
