#!/bin/bash

# Keys
# -m - move, NOTE: Default is COPY
# 

script_name=$0

SOURCE=$PWD
DESTINATION=$HOME
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
  local EXT_ARRAY=($JPG $PNG $GIF $JPEG $BMP $SVG)
  # find . -maxdepth 1 -type f -name "*.txt"
  local FILES=()
  for ext in $EXT_ARRAY; do 
    FILES=($DESTINATION/$ext)
  done
  IMAGES_TO_PROCESS=$FILES;
}


# CODE
printf "Script: $script_name runned with params \nSource: $SOURCE \nDestination: $DESTINATION \n"
get_image_files
  for f in "${IMAGES_TO_PROCESS[@]}"; do
  echo $(timestamp) $f
    # anything else you like with these files
  done 

