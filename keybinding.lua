-- Keybinding

local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
	config.disable_default_key_bindings = true
	config.keys = {
		-- This will create a new split and run the `top` program inside it
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		{
			key = "y",
			mods = "ALT|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Left",
			}),
		},
		{
			key = "o",
			mods = "ALT|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Right",
			}),
		},
		{
			key = "i",
			mods = "ALT|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Up",
			}),
		},
		{
			key = "u",
			mods = "ALT|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Down",
			}),
		},
		{
			key = "t",
			mods = "ALT",
			action = act.SpawnTab("DefaultDomain"),
		},
		{
			key = "q",
			mods = "ALT",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "w",
			mods = "ALT",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "z",
			mods = "ALT",
			action = act.TogglePaneZoomState,
		},
		{
			key = "q",
			mods = "ALT",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{ key = "a", mods = "ALT", action = act.ActivatePaneByIndex(0) },
		{ key = "s", mods = "ALT", action = act.ActivatePaneByIndex(1) },
		{ key = "v", mods = "ALT", action = act.ActivatePaneByIndex(2) },
		{
			key = "y",
			mods = "ALT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "o",
			mods = "ALT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "u",
			mods = "ALT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "i",
			mods = "ALT",
			action = act.ActivatePaneDirection("Down"),
		},
		-- {
		-- 	key = "f",
		-- 	mods = "ALT",
		-- 	action = wezterm.action.ToggleFullScreen,
		-- },
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	}
	for i = 1, 8 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "ALT",
			action = act.ActivateTab(i - 1),
		})
	end
end

return module
