#!/bin/bash

cd "/home/ubuntu/GitHub/Automated_YouTube_Downloads"



# Prevent multiple instances of the script from being run.
lockfile="$(pwd)/lockfile.tmp"
if [ -f "$lockfile" ]; then
        exit
fi
touch "$lockfile"



# Upgrade yt-dlp
python3 -m pip install -U yt-dlp



# Ensure Required Folders Exist
folder_audio="$(pwd)/audio"
folder_video="$(pwd)/video"

folders=( "$folder_audio" "$folder_video" )
for folder_path in "${folders[@]}"
do
        if [[ ! -d "$folder_path" ]]; then
                mkdir "$folder_path"
                echo "Created $folder_path"
        fi
done



# Ensure Required Files Exist
file_audio_urls="$(pwd)/audio_urls.txt"
file_video_urls="$(pwd)/video_urls.txt"

files=( "$file_audio_urls" "$file_video_urls" )
for file_path in "${files[@]}"
do
        if [[ ! -d "$file_path" ]]; then
                touch "$file_path"
                echo "Created $file_path"
        fi
done



# Download Audio Files
echo "Downloading Audio Files"

while IFS= read -r line; do
        echo -e "\tDownloading $line"
        yt-dlp -q --geo-bypass --output "$folder_audio/%(title)s.%(ext)s" --extract-audio "$line"
done < "$file_audio_urls"

cat "/dev/null" > "$file_audio_urls"



# Download Video Files
echo "Downloading Video Files"

while IFS= read -r line; do
        echo -e "\tDownloading $line"
        yt-dlp -q --geo-bypass --output "$folder_video/%(title)s.%(ext)s" "$line"
done < "$file_video_urls"

cat "/dev/null" > "$file_video_urls"



rm "$lockfile"