#!/bin/bash

# Keys
# -с - COPY, NOTE: Default is MOVE
# 

script_name=$0
SOURCE=$1
DESTINATION=$2

IMAGES_TO_PROCESS=();


# FUNCTIONS

# Define a timestamp function
timestamp() {
  date +"%T"
}

# This function search in SOURCE directory image files with extentions (NOTE: case insensitive) jpg, jpeg, png, gif, bmp, svg. 
get_image_files(){
  echo $(timestamp) "FUNCTION: get_image_files"
  # extentions
  local JPG='*.[jJ][pP][gG]'
  local PNG='*.[pP][nN][gG]'
  local GIF='*.[gG][iI][fF]'
  local JPEG='*.[jJ][pP][eE][gG]'
  local BMP='*.[bB][mM][pP]'
  local SVG='*.[sS][vV][gG]'
  # extentions array
  local EXT_ARRAY=()

  # find . -maxdepth 1 -type f -name "*.txt"
  local FILES=()
  for ext in '*.[jJ][pP][gG]' '*.[pP][nN][gG]' '*.[gG][iI][fF]' '*.[jJ][pP][eE][gG]' '*.[bB][mM][pP]' '*.[sS][vV][gG]'
  do 
    FILES=($SOURCE$ext)

   for file in "${FILES[@]}"
    do
     IMAGES_TO_PROCESS+=($file)
    done
  
  done
}


# CODE
printf "Script: $script_name runned with params \nSource: $SOURCE \nDestination: $DESTINATION \n"
get_image_files    
    for file in "${IMAGES_TO_PROCESS[@]}"
    do
      echo "Moving file "$file
      mv $file $DESTINATION
    done
