#!/bin/bash
# Downsample .flac to 16/44100
# By Ross Solomon
#####################################

source=$1
dest=$2
other_files=$3
if [ -z source ]; then
  echo "Please specify a source directory"
  exit 0
fi

if [ -z dest ]; then
  echo "Please specify a destination directory"
  exit 0
fi

find "$source" -depth -name '*' | while read file ; do
directory=$(dirname "$file")
filename=$(basename "$file")
extension="${filename##*.}"

if [ ! -f "$dest/$directory/$filename" ] && [ ! -d "$directory/$filename" ]; then
	if [ ! -d "$dest/$directory" ]; then
    echo "Creating directory $dest/$directory"
		mkdir -p "$dest/$directory"
	fi

  if [ $extension == "flac" ] || [ $extension == "FLAC" ]; then
    echo "Converting $dest/$directory/$filename"
    sox -G -S "$directory/$filename" -r 44100 -b 16 "$dest/$directory/$filename"
  elif [ ! -z $other_files ]; then
    # Bring over album art, descriptions, and other associated files.
    echo "Copying non-flac file to $dest/$directory/$filename"
    cp "$directory/$filename" "$dest/$directory/$filename"
  fi
fi

done
