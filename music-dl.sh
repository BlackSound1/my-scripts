#!/bin/bash

if [ $# -eq 0 ]; then
    printf "\nUsage: $0 <folder> <URL> [--playlist]\n\n"
    printf "    folder             Where to save the file(s)\n"
    printf "    URL                Youtube URL\n"
    printf "    --playlist         download playlist\n"
    exit 1
fi

folder="$1"
URL="$2"

playlist_flag=""
if [[ "$3" == "--playlist" ]]; then
    playlist_flag="--yes-playlist"
fi

yt-dlp --extract-audio $playlist_flag --audio-format wav --output "./$folder/%(title)s" $URL --progress --console-title
