local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Everforest Dark (Gogh)"
config.colors = {
    background = "#272e33",
}
config.enable_tab_bar = false
config.font = wezterm.font("Berkeley Mono")
config.font_size = 10.0
config.force_reverse_video_cursor = true

return config
