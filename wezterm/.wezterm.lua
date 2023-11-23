local wezterm = require 'wezterm'

local config = {}

-- if wezterm.config_builder then
--   config = wezterm.config_builder()
--
-- -- and finally, return the configuration to wezterm
-- return config
-- end

-- config.color_scheme = 'Atom'
config.color_scheme = 'catppuccin-mocha'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
-- use_fancy_tab_bar = true
-- config.font = wezterm.font 'JetBrains Mono'
-- config.font = wezterm.font 'Source Code Pro'
config.font = wezterm.font 'Iosevka Light'
-- Avoid dense cursor on symbol.
config.colors = {
    cursor_fg = '#000000'
}
config.font_size = 20.0
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8
config.tab_bar_at_bottom = true
return config

