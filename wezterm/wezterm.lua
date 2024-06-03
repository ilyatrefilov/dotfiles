local wezterm = require("wezterm")

local config = {}

-- config.color_scheme = "Atom"
-- config.color_scheme = "catppuccin-mocha"
-- config.color_scheme = "Gruvbox dark, hard (base16)"
-- use_fancy_tab_bar = true
-- config.color_scheme = "One Half Black (Gogh)"
config.color_scheme = "Kanagawa (Gogh)"

-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("ProggySmallTT")
config.font = wezterm.font("CommitMonoV143")
-- config.font = wezterm.font("Iosevka")
-- Avoid color mixing of cursor and symbol.
config.cursor_blink_rate = 0
config.colors = {
	cursor_fg = "#000000",
}
-- Remove afterwards
config.enable_wayland = false
config.font_size = 12
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.tab_bar_at_bottom = true
return config
