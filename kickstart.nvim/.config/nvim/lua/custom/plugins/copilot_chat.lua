return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },

    window = {
      layout = 'float',
      relative = 'cursor',
      width = 1,
      height = 0.4,
      row = 1,
    },

    keys = {
      {
        '<leader>cch',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(actions.help_actions())
        end,
        desc = 'CopilotChat - Help actions',
      },
      -- Show prompts actions with telescope
      {
        '<leader>ccp',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
        end,
        desc = 'CopilotChat - Prompt actions',
      },
      {
        '<leader>ccq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'CopilotChat - Quick chat',
      },
      {
        '<leader>ccb',
        '<cmd>CopilotChatToggle<cr>',
        desc = 'CopilotChat - Chat with current buffer',
      },
      {
        '<leader>cce',
        '<cmd>CopilotChatExplain<cr>',
        desc = 'CopilotChat = Explain Code',
      },
      {
        '<leader>cct',
        '<cmd>CopilotChatTests<cr>',
        desc = 'CopilotChat = Generate tests',
      },
      {
        '<leader>ccr',
        '<cmd>CopilotChatReview<cr>',
        desc = 'CopilotChat = Review code',
      },
    },
  },
}
