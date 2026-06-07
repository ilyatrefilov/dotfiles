vim.pack.add {
  { src = 'https://github.com/folke/persistence.nvim' },
  { src = 'https://github.com/MagicDuck/grug-far.nvim' },
}

-- Per-directory session persistence
require('persistence').setup {}

local persistence = require 'persistence'
local map = vim.keymap.set
map('n', '<leader>Ss', function()
  persistence.load()
end, { desc = 'Restore session (cwd)' })
map('n', '<leader>Sl', function()
  persistence.load { last = true }
end, { desc = 'Restore last session' })
map('n', '<leader>Sd', function()
  persistence.stop()
end, { desc = "Don't save current session" })

-- Project-wide search and replace
require('grug-far').setup {}

map('n', '<leader>sr', function()
  require('grug-far').open()
end, { desc = 'Search & replace (project)' })
map('n', '<leader>sw', function()
  require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } }
end, { desc = 'Search & replace word' })
map('x', '<leader>sr', function()
  require('grug-far').with_visual_selection()
end, { desc = 'Search & replace selection' })
