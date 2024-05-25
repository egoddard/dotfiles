local Utils = require 'utils'

local transparent_background = false
if Utils.is_wsl() or Utils.wants_transparent_background() then
  transparent_background = true
end

local dark_theme = 'catppuccin-macchiato'
local light_theme = 'catppuccin-latte'

local function switch_colorscheme()
  if vim.o.background == 'dark' then
    vim.cmd('colorscheme ' .. dark_theme)
  else
    vim.cmd('colorscheme ' .. light_theme)
  end
end

-- Switch colorscheme based on the background option
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = switch_colorscheme,
})

return {
  {
    -- follows the system theme
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd('colorscheme ' .. dark_theme)
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd('colorscheme ' .. light_theme)
      end,
    },
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'folke/tokyonight.nvim',
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.colorscheme 'catppuccin'

      -- You can configure highlights by doing something like:
      --vim.cmd.hi 'Comment gui=none'
    end,
    --config = {
    --  flavour = 'mocha',
    --},
    opts = {
      transparent_background = transparent_background,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      integrations = {
        diffview = true,
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        mini = {
          enabled = true,
          indentscope_color = 'peach', -- catppuccin color (eg. `lavender`) Default: text
        },
      },
      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.pink },
          -- DiffChange = { fg = colors.base, bg = colors.pink },
        }
      end,
      color_overrides = {
        mocha = {
          base = '#11111b',
        },
        -- https://github.com/catppuccin/nvim/discussions/323#discussioncomment-5287724
        frappe = {
          rosewater = '#ea6962',
          flamingo = '#ea6962',
          red = '#ea6962',
          maroon = '#ea6962',
          pink = '#d3869b',
          mauve = '#d3869b',
          peach = '#e78a4e',
          yellow = '#d8a657',
          green = '#a9b665',
          teal = '#89b482',
          sky = '#89b482',
          sapphire = '#89b482',
          blue = '#7daea3',
          lavender = '#7daea3',
          text = '#ebdbb2',
          subtext1 = '#d5c4a1',
          subtext0 = '#bdae93',
          overlay2 = '#a89984',
          overlay1 = '#928374',
          overlay0 = '#595959',
          surface2 = '#4d4d4d',
          surface1 = '#404040',
          surface0 = '#292929',
          base = '#1d2021',
          mantle = '#191b1c',
          crust = '#141617',
        },
        latte = {
          rosewater = '#c14a4a',
          flamingo = '#c14a4a',
          red = '#c14a4a',
          maroon = '#c14a4a',
          pink = '#945e80',
          mauve = '#945e80',
          peach = '#c35e0a',
          yellow = '#b47109',
          green = '#6c782e',
          teal = '#4c7a5d',
          sky = '#4c7a5d',
          sapphire = '#4c7a5d',
          blue = '#45707a',
          lavender = '#45707a',
          text = '#654735',
          subtext1 = '#73503c',
          subtext0 = '#805942',
          overlay2 = '#8c6249',
          overlay1 = '#8c856d',
          overlay0 = '#a69d81',
          surface2 = '#bfb695',
          surface1 = '#d1c7a3',
          surface0 = '#e3dec3',
          --base = '#f9f5d7',
          mantle = '#f0ebce',
          crust = '#e8e3c8',
        },
        macchiato = {
          rosewater = '#ffc9c9',
          flamingo = '#ff9f9a',
          pink = '#ffa9c9',
          mauve = '#df95cf',
          lavender = '#a990c9',
          red = '#ff6960',
          maroon = '#f98080',
          peach = '#f9905f',
          yellow = '#f9bd69',
          green = '#b0d080',
          teal = '#a0dfa0',
          sky = '#a0d0c0',
          sapphire = '#95b9d0',
          blue = '#89a0e0',
          text = '#e0d0b0',
          subtext1 = '#d5c4a1',
          subtext0 = '#bdae93',
          overlay2 = '#928374',
          overlay1 = '#7c6f64',
          overlay0 = '#665c54',
          surface2 = '#504844',
          surface1 = '#3a3634',
          surface0 = '#252525',
          base = '#151515',
          mantle = '#0e0e0e',
          crust = '#080808',
        },
      },
    },
  },
}
