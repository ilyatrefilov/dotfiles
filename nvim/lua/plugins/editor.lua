vim.pack.add {
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/tpope/vim-sleuth' },
}

require('flash').setup {}

local flash = require 'flash'
-- stylua: ignore start
vim.keymap.set({ 'n', 'x', 'o' }, 'm', function() flash.jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'M', function() flash.treesitter() end, { desc = 'Flash Treesitter' })
vim.keymap.set('o', 'r', function() flash.remote() end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function() flash.treesitter_search() end, { desc = 'Treesitter Search' })
vim.keymap.set('c', '<C-s>', function() flash.toggle() end, { desc = 'Toggle Flash Search' })
-- stylua: ignore end
