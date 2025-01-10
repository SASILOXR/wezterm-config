-- Pull in the wezterm API
local wezterm = require("wezterm")
local keybinding = require("keybinding")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 10.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#1e1e1e",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.use_fancy_tab_bar = false
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#222436",
			fg_color = "#808080",
			intensity = "Bold",
			-- underline = "Double",
			italic = true,
		},
		inactive_tab = {
			bg_color = "#222436",
			fg_color = "#808080",
			-- strikethrough = true,
			-- underline = "Single",
		},
		inactive_tab_hover = {
			bg_color = "#222436",
			fg_color = "#808080",
		},
		new_tab = {
			bg_color = "#222436",
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "#292a44",
			fg_color = "#49507a",
		},
		background = "#222436",
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#252633",
	},
}

-- config.window_background_image = 'C:\\Users\\KOTI\\Pictures\\terminal.png'

-- config.default_prog = {
-- 	-- "C:\\Program Files\\PowerShell\\7\\pwsh.exe",
-- 	-- "C:/msys64/msys2_shell.cmd",
-- 	-- "-defterm",
-- 	-- "-no-start",
-- 	-- "-use_fancy_tab_bar",
-- 	-- "-here",
-- 	-- "-mingw64",
-- }
-- config.launch_menu = {
-- 	{
-- 		label = "fish",
-- 		args = {
-- 			"C:/msys64/msys2_shell.cmd",
-- 			"-defterm",
-- 			"-no-start",
-- 			"-use-full-path",
-- 			"-mingw64",
-- 			"-here",
-- 		},
-- 	},
-- }
-- config.font = wezterm.font("Agave Nerd Font Mono", { weight = "Medium" })
config.font = wezterm.font("ComicShannsMono Nerd Font", { weight = "Medium" })
config.font_size = 11

config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
config.win32_system_backdrop = "Auto"
-- config.animation_fps = 60
config.switch_to_last_active_tab_when_closing_tab = true
config.cursor_thickness = 2
config.default_cursor_style = "SteadyBlock"
-- config.tab_bar_at_bottom = true
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.6,
}
config.window_decorations = "RESIZE"
-- config.window_padding = {
-- 	left = 5,
-- 	right = 2,
-- 	top = 2,
-- 	bottom = 0,
-- }
-- For example, changing the color scheme:
-- config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "Apple Classic"
-- config.color_scheme = "Apprentice (Gogh)"
config.enable_wayland = true

-- and finally, return the configuration to wezterm
keybinding.apply_to_config(config)

-- require("events.right-status").setup()
-- require("events.tab-title").setup()
require("events.format_tab").setup()
require("events.update-status").setup()
-- require("events.new-tab-button").setup()

return config
