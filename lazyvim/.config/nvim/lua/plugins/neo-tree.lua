return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
  },
  opts = {
    filesystem = {
      filtered_items = {
        never_show = {
          ".cache",
          ".git",
          "node_modules",
          "__pycache__",
        },
        always_show = {
          ".config",
          ".envrc",
          ".env",
          ".github",
        },
      },
    },
    window = {
      position = "right",
      mappings = {
        ["\\"] = "close_window",
        ["o"] = "open",
        ["h"] = "close_node",
      },
    },
  },
}
