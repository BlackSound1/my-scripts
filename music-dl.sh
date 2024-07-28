#!/bin/bash

if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    printf "\nUsage: $0 <folder> <URL> [--playlist]\n\n"
    printf "    folder             Where to save the file(s)\n"
    printf "    URL                Youtube URL\n"
    printf "    --playlist         download playlist\n"
    exit 1
fi

if command -v yt-dlp >/dev/null 2>&1; then
    printf "\n\033[32myt-dlp is found\033[0m\n"
else
    printf "\n\033[31myt-dlp is not installed. Please download it and add it to your PATH before running this script\033[0m\n\n"
    exit 1
fi

if command -v ffmpeg >/dev/null 2>&1; then
    printf "\033[32mffmpeg is found\033[0m\n"
else
    printf "\n\033[31mffmpeg is not installed. Please download it and add it to your PATH before running this script\033[0m\n\n"
    exit 1
fi

if command -v ffprobe >/dev/null 2>&1; then
    printf "\033[32mffprobe is found\033[0m\n\n"
else
    printf "\n\033[31mffprobe is not installed. Please download it and add it to your PATH before running this script\033[0m\n\n"
    exit 1
fi

folder="$1"
URL="$2"

playlist_flag=""
if [[ "$3" == "--playlist" ]]; then
    playlist_flag="--yes-playlist"
fi

yt-dlp --extract-audio $playlist_flag --audio-format wav --output "./$folder/%(title)s" $URL --progress --console-title
