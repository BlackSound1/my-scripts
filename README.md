# My Simple Scripts

This repo contains simple scripts I made for making certain tasks easier/ possible.

Each script may require its own dependencies.

Each script comes with a `--help, -h` flag to inquire about its usage. Running any script without arguments will display
the usage instructions, too.

## Scripts

- `audio-dl`: A simple wrapper for `yt-dlp` that only downloads audio from YouTube videos.
              Can even download whole playlists of audio. *Disclaimer*: legally, don't use this for 
              copyrighted material.
- `dir-diff`: A simple wrapper for `diff` that only checks differences between given directories. Does not check files.
             Can find the differences between directories in a recursive way, too. Great when performing backups or 
             filesystem organization.
