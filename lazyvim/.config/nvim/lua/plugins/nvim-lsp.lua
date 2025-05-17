return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.HINT] = "DiagnosticInfo",
          [vim.diagnostic.severity.INFO] = "DiagnosticHint",
        },
      },
    },
  },
}
