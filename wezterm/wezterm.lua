local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font_with_fallback({
    "Meslo LGM Nerd Font",
})
config.font_size = 15
config.color_scheme = 'rose-pine'
config.show_tabs_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.colors = {
    background = "black"
}
config.window_background_opacity = 1.0
return config
