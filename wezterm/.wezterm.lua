local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		--    return 'Catppuccin Dark Macchiato'
		-- return "Tokyo Night"
		--return "Everforest Dark (Hard)"
		return "Night Owl (Gogh)"
	else
		--    return 'Catppuccin Latte'
		-- return "zenbones"
		return "Everforest Light (Medium)"
	end
end

function get_font_name()
	local os_name = ""
	local font_name = "Fira Code"
	if package.config:sub(1, 1) == "\\" then
		os_name = "Windows"
	else
		local f = io.popen("uname -s")
		if f then
			os_name = f:read("*a"):gsub("\n", "")
			f:close()
		end
	end
	if os_name ~= "Darwin" then
		font_name = "FiraCode Nerd Font"
	end

	return font_name
end

local custom_catppuccin_mocha = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom_catppuccin_mocha.background = "#11111b"

local custom_catppuccin_macchiato = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]
custom_catppuccin_macchiato.background = "#151515"

local config = wezterm.config_builder()
config.color_schemes = {
	["Catppuccin Dark Mocha"] = custom_catppuccin_mocha,
	["Catppuccin Dark Macchiato"] = custom_catppuccin_macchiato,
}
color_scheme_dirs = { "~/.config/wezterm/colors" }
--config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Fira Code" })
config.font = wezterm.font(get_font_name())
config.warn_about_missing_glyphs = false
config.font_size = 13
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.audible_bell = "Disabled"

return config
