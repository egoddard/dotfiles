-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      filtered_items = {
        never_show = {
          '.cache',
          '.git',
          'node_modules',
          '__pycache__',
        },
        always_show = {
          '.config',
          '.envrc',
          '.env',
          '.github',
        },
      },
    },
    window = {
      position = 'right',
      mappings = {
        ['\\'] = 'close_window',
        ['o'] = 'open',
        ['h'] = 'close_node',
      },
    },
  },
}
