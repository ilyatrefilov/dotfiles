return {

  {
    'sindrets/diffview.nvim',
    init = function()
      vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { desc = 'Open DiffView' })
    end,
  },
  {
    'tpope/vim-fugitive',
  },
}
