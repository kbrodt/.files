#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

python3 -m pip install --upgrade pip --user
python3 -m pip install --upgrade jedi --user
python3 -m pip install --upgrade black --user
python3 -m pip install --upgrade rope --user
python3 -m pip install --upgrade flake8 --user
python3 -m pip install --upgrade mypy --user
