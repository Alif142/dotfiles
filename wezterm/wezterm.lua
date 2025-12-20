local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font_with_fallback({
    "Meslo LGM Nerd Font",
})
config.font_size = 18
config.show_tabs_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.color_schemes = {
    ['Vague'] = {
        foreground = '#cdcdcd',
        background = '#141415',
        cursor_bg = '#cdcdcd',
        cursor_fg = '#141415',
        cursor_border = '#cdcdcd',
        selection_fg = '#cdcdcd',
        selection_bg = '#252530',
        ansi = {
            '#252530',
            '#d8647e',
            '#7fa563',
            '#f3be7c',
            '#6e94b2',
            '#bb9dbd',
            '#aeaed1',
            '#cdcdcd',
        },
        brights = {
            '#606079',
            '#e08398',
            '#99b782',
            '#f5cb96',
            '#8ba9c1',
            '#c9b1ca',
            '#bebeda',
            '#d7d7d7',
        },
    },
}
config.color_scheme = 'Vague'

config.window_background_opacity = 0.5
config.window_close_confirmation = "NeverPrompt"
return config
