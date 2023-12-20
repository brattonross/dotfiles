local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {
	background = "#1d1c23",
	foreground = "#eceeec",
}
config.command_palette_font_size = 10.0
config.cursor_blink_rate = 0
config.default_cursor_style = "SteadyBlock"
config.enable_scroll_bar = false
config.enable_tab_bar = false
config.font = wezterm.font("Berkeley Mono")
config.font_size = 10.0
config.force_reverse_video_cursor = true
config.line_height = 1.0
config.max_fps = 100
config.window_background_opacity = 0.95
config.window_padding = {
	left = "0.25cell",
	right = "0.25cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

return config
