return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["<CR>"] = nil
      opts.mapping["<C-y>"] = cmp.mapping.confirm({ select = true })
    end,
  },
}
