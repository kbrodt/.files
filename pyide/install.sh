#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

python3 -m pip install --upgrade --user -r requirements.txt
