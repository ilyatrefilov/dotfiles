vim.pack.add {
  -- depends on plenary.nvim (already added by plugins/telescope.lua)
  { src = 'https://github.com/folke/todo-comments.nvim' },
}

local todo = require 'todo-comments'
todo.setup { signs = true }

local map = vim.keymap.set
map('n', ']t', function()
  todo.jump_next()
end, { desc = 'Next TODO comment' })
map('n', '[t', function()
  todo.jump_prev()
end, { desc = 'Previous TODO comment' })
map('n', '<leader>xt', '<cmd>Trouble todo toggle<cr>', { desc = 'TODO list (Trouble)' })
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]ODOs' })
