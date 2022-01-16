# About

This repository contains a shell script for downloading the full file index of Cinedigm -- formerly known as [New Video](https://en.wikipedia.org/wiki/New_Video).

The URL used for downloads is: https://newvideo.com/wp-content/uploads/

# Usage

Run:

```bash
$ ./downloader.sh
```

It'll automatically download the files in to the current directory.

# Current archive status

`last-run.txt` contains the date of the last successful download run, as well as the size of the archive it produced.