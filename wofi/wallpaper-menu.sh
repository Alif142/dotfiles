#!/bin/bash
#WALLPAPER_DIR="$HOME/dotfiles/wallpaper/"
#I dont know what the fuck I am doing
#menu() {
#    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
#}
#main() {
#    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
#    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
#    swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
#    wal -i "$selected_wallpaper" -n --cols16
#    swaync-client --reload-css
#    cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
#    pywalfox update
#    color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
#    color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
#    cava_config="$HOME/.config/cava/config"
#    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
#    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config
#    pkill -USR2 cava 2>/dev/null
#    source ~/.cache/wal/colors.sh && cp -r $wallpaper ~/wallpapers/pywallpaper.jpg 
#    wal -i "$selected_wallpaper" -n
#    hyprctl reload
#}
#main


# Configuration
WALLPAPER_DIR="$HOME/dotfiles/wallpaper/"
HYPRLOCK_WALLPAPER_PATH="$HOME/.config/hypr/hyprlock/wallpaper.jpg"

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -printf "img:%p\n"
}

main() {
    # Get wallpaper selection
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css \
        --show dmenu --prompt "Select Wallpaper:" -n)
    
    [ -z "$choice" ] && exit 0  # Exit if no selection
    
    selected_wallpaper=${choice#img:}
    
    # Set wallpaper with swww
    swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    
    # Update hyprlock wallpaper
    cp "$selected_wallpaper" "$HYPRLOCK_WALLPAPER_PATH"
    
    # Generate color schemes
    wal -i "$selected_wallpaper" -n 
    
    # Update applications
    swaync-client --reload-css
    cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
    pywalfox update
    
    # Update cava colors
    color1=$(awk -F"'" '/color2=/ {print $2}' ~/.cache/wal/colors.sh)
    color2=$(awk -F"'" '/color3=/ {print $2}' ~/.cache/wal/colors.sh)
    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" ~/.config/cava/config
    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" ~/.config/cava/config
    pkill -USR2 cava 2>/dev/null
    
    # Reload hyprland
    hyprctl reload
}

main

