#!/bin/bash

# Display help if no arguments are provided or if only --help or -h are provided
if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    printf "\nUsage: $0 <folder> <URL> [--playlist]\n\n"
    printf "  A simple wrapper for \`yt-dlp\` that only downloads audio from YouTube.\n"
    printf "  Can be made to download a whole playlist with the --playlist flag. MUST be third argument, if at all.\n"
    printf "  If downloading a playlist, supply the URL to the playlist itself, not just a video in the playlist.\n\n"
    printf "  Requires \`yt-dlp\`, \`ffmpeg\` and \`ffprobe\` to be installed in your PATH.\n\n"
    printf "    folder             Where to save the file(s)\n"
    printf "    URL                Youtube URL\n"
    printf "    --playlist         download playlist\n"
    printf "    --help, -h         Show this help message and exit\n"
    exit 0
fi

printf "\n"

# This script requires the following dependencies
dependencies=("yt-dlp" "ffmpeg" "ffprobe")

# Check if those dependencies are installed. Exit early if any are not installed
for dep in "${dependencies[@]}"; do
    if command -v "$dep" >/dev/null 2>&1; then
        printf "\033[32m$dep is found\033[0m\n"
    else
        printf "\033[31m$dep is not installed. Please download it and add it to your PATH before running this script\033[0m\n\n"
        exit 1
    fi
done

printf "\n"

# Get the folder and URL specified as arguments
folder="$1"
URL="$2"

# Check if --playlist flag is provided as third argument
playlist_flag=""
if [[ "$3" == "--playlist" ]]; then
    playlist_flag="--yes-playlist"
fi

# Run script
printf "Downloading audio...\n\n"
yt-dlp --extract-audio $playlist_flag --audio-format wav --output "./$folder/%(title)s" $URL
printf "\n\033[32mDone!\033[0m\n\n"
