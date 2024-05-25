local get_main_branch = function()
  local handle = io.popen "git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'"
  if not handle then
    return ''
  end

  local result = handle:read '*a'
  handle:close()

  if not result or result == '' then
    return ''
  end

  return result:gsub('\n', '')
end

--:DiffviewClose          Close the active Diffview.

--                                               *:DiffviewToggleFiles*
--:DiffviewToggleFiles    Toggles the file panel.

return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPre',
    keys = {
      { '<leader>gdd', '<cmd>DiffviewOpen<CR>', desc = 'DiffView - Open' },
      { '<leader>gdc', '<cmd>DiffviewClose<CR>', desc = 'DiffView - Close' },
      { '<leader>gdf', '<cmd>DiffviewToggleFiles<CR>', desc = 'DiffView - Toggle File panel' },
      {
        '<leader>gdm',
        function()
          local branch = get_main_branch()
          if branch == '' then
            print 'Could not get main branch'
            return
          end
          vim.cmd('DiffviewOpen ' .. branch)
        end,
        desc = 'DiffView main branch',
      },
    },
  },
}
