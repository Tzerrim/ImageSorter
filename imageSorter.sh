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
  # putting all extesions to array
  EXT_ARRAY+=($JPG)
  EXT_ARRAY+=($PNG)
  EXT_ARRAY+=($GIF)
  EXT_ARRAY+=($JPEG)
  EXT_ARRAY+=($BMP)
  EXT_ARRAY+=($SVG)

  #printf '%s\n' "${EXT_ARRAY[@]}"

  # Array of file names, where we well pull all files found by extesion
  local FILES=()
  FILES2=()
  # Looping throught extesions
  for ext in ${EXT_ARRAY[@]}
  do 
    # Selecting all files in SOURCE folder with current extesion
    FILES=($SOURCE$ext)
    #echo Files found : ${#FILES[@]}

  #  FILES2="$(find . -name \*.txt -o -name \*.bmp -type f)"
   for file in "${FILES[@]}"
    do
      # Appeding files to a result fila array, which we will procced
     IMAGES_TO_PROCESS+=($file)
    done
  
  done
}


# MAIN CODE
printf "Script: $script_name runned with params \nSource: $SOURCE \nDestination: $DESTINATION \n"
# Taking all files to proceed
get_image_files    
for file in "${IMAGES_TO_PROCESS[@]}"
  do    
    echo  $(timestamp) "Moving file "$file " to " $DESTINATION
    mv $file $DESTINATION
  done
