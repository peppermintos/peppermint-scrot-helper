#!/bin/bash


shot_dir="$HOME/Pictures/Screenshots";

shot_file=$(zenity --title="Screen Capture" --forms title="Filename to save" \
    --text="NOTE: By default the file is stored in /home/USERNAME/Pictures/Screenshots" \
    --add-entry="Save as" \
    --separator=":");

shot_type=$(zenity --title="Screen capture" --list --text "Choose your screenshot type:" --radiolist \
    --column "Select" --column "Options" \
    TRUE "Fullscreen" \
    FALSE "Mouse Selection" \
    --separator=":");

if [[ ! $shot_file == "~/"* ]]; then
    if [ ! -d $shot_dir ]; then
        mkdir -p "$shot_dir";
    fi

    cd "$shot_dir";
else
    shot_file=$HOME/${shot_file:2};
fi

if [ ! $shot_file = "" ]; then
    case $shot_type in
        "Fullscreen") 
            scrot "$shot_file"
            ;;
        "Mouse Selection")
            scrot -s $shot_file
            ;;
        *)
            scrot $shot_file
    esac
fi
