local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Dark Macchiato'
  else
    return 'Catppuccin Latte'
  end
end

local custom_catppuccin_mocha = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom_catppuccin_mocha.background = '#11111b'

local custom_catppuccin_macchiato = wezterm.color.get_builtin_schemes()['Catppuccin Macchiato']
custom_catppuccin_macchiato.background = '#151515'

local config = wezterm.config_builder()
config.color_schemes = {
  ['Catppuccin Dark Mocha'] = custom_catppuccin_mocha,
  ['Catppuccin Dark Macchiato'] = custom_catppuccin_macchiato,
}

config.font = wezterm.font 'Fira Code'
config.font_size = 13
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

return config
