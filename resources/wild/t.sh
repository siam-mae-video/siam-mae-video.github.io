#!/bin/bash

for file in *.mp4; do
  # get the base name of the file (without the .mp4 extension)
  base="${file%%.*}"
  
  # convert the file to .webm using ffmpeg
  ffmpeg -i "$file" -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "$base.webm"
done
