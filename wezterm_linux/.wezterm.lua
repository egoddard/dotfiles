local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		--    return 'Catppuccin Dark Macchiato'
		return "Tokyo Night"
	else
		--    return 'Catppuccin Latte'
		return "zenbones"
	end
end

local custom_catppuccin_mocha = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom_catppuccin_mocha.background = "#11111b"

local custom_catppuccin_macchiato = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]
custom_catppuccin_macchiato.background = "#151515"

-- window is redrawn when config is reloaded
wezterm.on("window-config-reloaded", function(window)
	wezterm.GLOBAL.windows_without_decoration[window:window_id() .. ""] = false
end)

local config = wezterm.config_builder()
config.color_schemes = {
	["Catppuccin Dark Mocha"] = custom_catppuccin_mocha,
	["Catppuccin Dark Macchiato"] = custom_catppuccin_macchiato,
}
config.window_frame = {
	inactive_titlebar_bg = "#353535",
	active_titlebar_bg = "#2b2042",
	inactive_titlebar_fg = "#cccccc",
	active_titlebar_fg = "#ffffff",
	inactive_titlebar_border_bottom = "#2b2042",
	active_titlebar_border_bottom = "#2b2042",
	button_fg = "#cccccc",
	button_bg = "#2b2042",
	button_hover_fg = "#ffffff",
	button_hover_bg = "#3b3052",
}

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.audible_bell = "Disabled"
config.window_decorations = "NONE"

return config
