local wezterm = require("wezterm")

local status = {}

status.cells = {}

status.push = function(fg, text, attribute)
	table.insert(status.cells, { Foreground = { Color = fg } })
	table.insert(status.cells, { Attribute = { Underline = attribute["Underline"] } })
	table.insert(status.cells, { Text = text })
end

status.config_status = function(hostname, date)
	status.push("#7FFF00", date .. " ", { Underline = "None" })
	status.push("#FF69b4", " " .. "", { Underline = "None" })
	status.push("#FF69B4", " " .. hostname .. " ", { Underline = "None" })
end

status.setup = function()
	wezterm.on("update-status", function(window, pane)
		status.cells = {}
		local date = wezterm.strftime("%b_%d 󰨳  %u %H:%M")
		local hostname = wezterm.hostname()

		status.config_status(hostname, date)

		window:set_right_status(wezterm.format(status.cells))
	end)
end

return status
