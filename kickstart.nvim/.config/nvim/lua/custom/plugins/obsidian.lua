return {
  --  'epwalsh/obsidian.nvim',
  --  version = '*', -- recommended, use latest release instead of latest commit
  --  lazy = true,
  --  ft = 'markdown',
  --  --event = {
  --  --  "BufReadPre " .. vim.fn.expand(" ~ ") .. "/Documents/Notes/obsidian/**.md",
  --  --  "BufNewFile " .. vim.fn.expand(" ~ ") .. "/Documents/Notes/obsidian/**.md",
  --  --},
  --  dependencies = {
  --    -- Required.
  --    'nvim-lua/plenary.nvim',
  --
  --    -- see below for full list of optional dependencies d👇
  --  },
  --  opts = {
  --    workspaces = {
  --      {
  --        name = 'personal',
  --        path = '~/Documents/Notes/obsidian/personal',
  --      },
  --      {
  --        name = 'work',
  --        path = '~/Documents/Notes/obsidian/work',
  --      },
  --    },
  --    daily_notes = {
  --      -- Optional, if you keep daily notes in a separate directory.
  --      folder = 'dailies',
  --      -- Optional, if you want to change the date format for the ID of daily notes.
  --      date_format = '%Y-%m-%d-%a',
  --      -- Optional, if you want to change the date format of the default alias of daily notes.
  --      alias_format = '%B %-d, %Y',
  --      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
  --      template = nil,
  --    },
  --    -- see below for full list of options 👇
  --  },
}
