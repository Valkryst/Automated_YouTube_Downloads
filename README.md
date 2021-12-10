## Installation

To download this script and its dependencies, copy and paste the following commands into your bash terminal. This assumes that you already have [Python3 installed](https://docs.python-guide.org/starting/install3/linux/).

```bash
# Install Dependencies
sudo apt update
sudo apt install ffmpeg wget



# Download Script
sudo wget https://github.com/Valkryst/Automated_YouTube_Downloads/blob/main/download.sh



# Modify the script's permissions to allow it to be run.
sudo chmod +x download.sh
```

With the script downloaded, you must then perform these steps:

* Move the script into its own folder.
  
  * e.g. `~/downloading/youtube`

* Edit the script and make the following change:
  
  * Change `/home/ubuntu/GitHub/Automated_YouTube_Downloads` to point to the folder in which you placed the script.

* Run the script to generate all necessary files and folders.

* Add a [cron](https://en.wikipedia.org/wiki/Cron) job to run the script at a set interval.
  
  * e.g. `0 * * * * /bin/bash ~/downloading/youtube/download.sh > ~/downloading/youtube/download.log`

## Usage

1. Find a video on YouTube, or any of the [sites supported by yt-dlp](https://docs.yt-dlp.org/en/latest/supportedsites.html), and copy the URL. 

2. To download the full video, add the URL to a new line in `video_urls.txt`. 

3. To download just the audio, add the URL to a new line in `audio_urls.txt`.

4. When the script runs, it will download all audio and video files to their respective `audio` and `video` folders.

## Important Notes

Do not edit the `audio_urls.txt` or `video_urls.txt` files if `lockfile.tmp` exists. This file indicates that the script is currently running and it will most likely ignore any new URLs added to the `_urls.txt` files.
