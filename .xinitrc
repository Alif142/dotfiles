export GTK_THEME=Tokyo-Night
export XDG_CONFIG_HOME=$HOME/.config
[ -f ~/.cache/wallpaper ] && feh --bg-fill "$(cat ~/.cache/wallpaper)" &
slstatus&
clipmenud &
picom&
xrandr --output HDMI-0 --mode 1920x1080 --rate 144
exec dwm
