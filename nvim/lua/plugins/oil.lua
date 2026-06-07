vim.pack.add {
  { src = 'https://github.com/stevearc/oil.nvim' },
}

require('oil').setup {
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ['<C-h>'] = false, -- keep window navigation
    ['<C-l>'] = false, -- keep window navigation; use <C-r> to refresh oil
    ['q'] = 'actions.close',
  },
}

-- Open parent directory of the current file (oil's signature mapping)
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory (Oil)' })
