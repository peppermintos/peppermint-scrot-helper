#!/bin/bash


shot_dir="$HOME/Desktop";

shot_file=$(zenity --title="Screen Capture" --forms title="Filename to save" \
    --text="NOTE: By default the file is stored in /home/USERNAME/Desktop" \
    --add-entry="Save as" \
    --separator=":");

shot_type=$(zenity --title="Screen capture" --list --text "Choose your screenshot type:" --radiolist \
    --column "Select" --column "Options" \
    TRUE "Fullscreen" \
    FALSE "Mouse Selection" \
    FALSE "Active Window" \
    --separator=":");

if [[ ! $shot_file == "~/"* ]]; then
    cd "$shot_dir";
else
    shot_file=$HOME/${shot_file:2};
fi

if [ ! $shot_file = "" ]; then
    case $shot_type in
        "Fullscreen") 
            scrot -d 3 "$shot_file"
            ;;
        "Mouse Selection")
            scrot -s "$shot_file"
            ;;
        "Active Window")
            scrot -d 3 -u "$shot_file"
            ;;
        *)
            scrot $shot_file
    esac
fi
