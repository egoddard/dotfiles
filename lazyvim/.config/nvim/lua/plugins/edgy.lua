return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.bottom = opts.bottom or {}
    table.insert(opts.bottom, {
      ft = "copilot-chat",
      title = "Copilot Chat",
      size = { width = 0.5, height = 0.4 },
    })
  end,
}
