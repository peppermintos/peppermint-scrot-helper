#!/bin/bash


shot_dir="$HOME/Desktop";

# shot_file=$(zenity --title="Screen Capture" --forms title="Filename to save" \
#     --text="NOTE: The screenshot will be saved to your desktop" \
#     --add-entry="Save as" \
#     --separator=":");

shot_type=$(zenity --title="Screen Capture (to desktop)" --list --text "Choose your screenshot type:" --radiolist \
    --column "Select" --column "Options" \
    TRUE "Fullscreen" \
    FALSE "Active Window" \
    FALSE "Mouse Selection" \
    --separator=":");

# if [ ! -d $shot_dir ]; then
#     mkdir -p "$shot_dir";

# fi

cd "$shot_dir";

case $shot_type in
    "Fullscreen")
        scrot -d 1 "Screenshot_%Y-%m-%d_%H:%M:%S.png"
        ;;
    "Active Window")
        scrot -d 1 -u -b "$Windowshot_%Y-%m-%d_%H:%M:%S.png"
        ;;
    "Mouse Selection")
        scrot -s "Selectionshot_%Y-%m-%d_%H:%M:%S.png"
        ;;
    *)
        scrot -d 1 "Screenshot_%Y-%m-%d_%H:%M:%S.png"
esac
