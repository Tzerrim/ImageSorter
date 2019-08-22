#!/bin/bash

script_name=$0

SOURCE=$PWD
DESTINATION=$HOME
IMAGES_TO_PROCESS=


# FUNCTIONS

count_image_files(){


for ext in jpg png gif jpeg; do 
  files=( *."$ext" )
  printf 'number of %s files: %d\n' "$ext" "${#files[@]}"

(  # now we can loop over all the files having the current extension
  for f in "${files[@]}"; do
  echo f
    # anything else you like with these files
  done 
)
done
}

# CODE
 

printf "Script: $script_name runned with params \nSource: $SOURCE \nDestination: $DESTINATION \n"
count_image_files




