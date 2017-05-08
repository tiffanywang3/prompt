#!/usr/bin/env bash

if [ ! -z "${AM_PROMPT_DEBUG:-}" ]; then
    echo 'list-directory'
fi

la() {
    ls -la $@
}

ll() {
    ls -lh $@
}

lla() {
    ls -lha $@
}

lp() {
    ls -p $@
}