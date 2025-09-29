-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'tokyonight'
config.font_size = 17
config.enable_tab_bar = false
config.window_background_opacity = 1
config.cursor_blink_rate = 0
-- and finally, return the configuration to wezterm
return config
