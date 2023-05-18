#!/bin/sh

if [ "${NVIM_LISTEN_ADDRESS+x}" != "" ] || [ "${NVIM+x}" != "" ]; then
	nvr --remote-wait "$1"
else
	nvim "$1"
fi
