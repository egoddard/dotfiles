return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.right = opts.right or {}
    table.insert(opts.right, {
      ft = "copilot-chat",
      title = "Copilot Chat",
      size = { width = 0.3, height = 1.0 },
    })
  end,
}
