local wezterm = require("wezterm")

local tab_config = {}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

-- config text title
tab_config.config_title = function(title, tab, hover)
	if tab.is_active then
		tab_config.push("#FF69B4", "  ")
		tab_config.push("#FF69B4", title .. " ")
		tab_config.push("#2E8B57", " < ")
	elseif hover then
		tab_config.push("#2E8B57", " 󰌪 ")
		tab_config.push("#2E8B57", title .. " ")
		-- tab_config.push("#2E8B57", " ~ ")
	else
		tab_config.push("#7B68EE", " 󰌽 ")
		tab_config.push("#7B68EE", title .. " ")
	end
end

tab_config.push = function(fg, text)
	table.insert(tab_config.cells, { Foreground = { Color = fg } })
	table.insert(tab_config.cells, { Text = text })
end

tab_config.setup = function()
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		tab_config.cells = {}

		local titleText = tab_title(tab)
		tab_config.config_title(titleText, tab, hover)

		return tab_config.cells
	end)
end

return tab_config
