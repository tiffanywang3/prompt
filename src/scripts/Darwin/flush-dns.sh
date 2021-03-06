#!/usr/bin/env bash

if [ ! -z "${AM_PROMPT_DEBUG:-}" ]; then
    echo 'flush-dns'
fi

flush-dns() {
	dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}

flushdns() {
	flush-dns
}
