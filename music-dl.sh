#!/bin/bash

folder="$1"
URL="$2"

if [[ "$3" == "--playlist" ]]; then
	yt-dlp --extract-audio --yes-playlist --audio-format wav --output "./$folder/%(title)s" $URL
else 
	yt-dlp --extract-audio --audio-format wav --output "./$folder/%(title)s" $URL
fi

