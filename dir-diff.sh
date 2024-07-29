#!/bin/bash

# Display help if no arguments are provided or if only --help or -h are provided
if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    printf "\nUsage: $0 <dir1> <dir2> [--recursive | -r]\n\n"
    printf "  A simple wrapper for \`diff\` that only checks the differences between two directories.\n"
    printf "  Can be made to recursively check subdirectories with the --recursive or -r flag. MUST be third argument, if at all.\n\n"
    printf "  Requires \`diff\` to be installed in your PATH.\n\n"
    printf "    dir1               First directory\n"
    printf "    dir2               Second directory\n"
    printf "    --recursive, -r    Whether to recursive diff starting from the given directories. Will likely take much longer\n"
    printf "    --help, -h         Show this help message and exit\n"
    exit 0
fi

printf "\n"

# This script requires the following dependencies
dependencies=("diff")

# Check if those dependencies are installed. Exit early if any are not installed
for dep in "${dependencies[@]}"; do
    if command -v "$dep" >/dev/null 2>&1; then
        printf "\033[32m$dep is found\033[0m\n"
    else
        printf "\033[31m$dep is not installed. Please download it and add it to your PATH before running this script\033[0m\n\n"
        exit 1
    fi
done

# Get the folders specified as arguments
directory1=$1
directory2=$2

# Ensure that both directories exist and are directories
if [ ! -d "$directory1" ] || [ ! -d "$directory2" ]; then
    printf "\n\033[31mError: Input directories do not exist or are not directories\033[0m\n"
    exit 1
fi

# Check if --recursive flag is provided as third argument
recursive_flag=""
if [[ "$3" == "--recursive" ]] || [[ "$3" == "-r" ]]; then
    recursive_flag="--recursive"
fi

printf "\n"

diff "$directory1" "$directory2" --brief $recursive_flag

printf "\n\033[32mDone!\033[0m\n\n"
