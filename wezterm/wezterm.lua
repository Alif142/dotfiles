-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme =  '3024 (dark) (terminal.sexy)'
config.font_size = 19
config.enable_tab_bar = false
config.window_background_opacity = 0.6
-- and finally, return the configuration to wezterm
return config
