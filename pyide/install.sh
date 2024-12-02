#!/usr/bin/env sh


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

python3 -m pip install --break-system-packages --upgrade --user \
    pip black rope flake8 mypy pynvim pylint isort \
    cpplint clang-format
