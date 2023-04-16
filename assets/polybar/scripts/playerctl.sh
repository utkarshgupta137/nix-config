#!/usr/bin/env bash

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="{{ title }} - {{ artist }} - {{ album }}"

STATUS=$(playerctl metadata --format "$FORMAT" 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
	echo "|    ${STATUS:0:22}"
else
	echo ""
fi
