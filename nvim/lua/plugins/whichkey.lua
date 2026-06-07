vim.pack.add {
  { src = 'https://github.com/folke/which-key.nvim' },
}

local wk = require 'which-key'
wk.setup {}

-- Group labels for the leader prefixes used across the config
wk.add {
  { '<leader>a', group = 'AI / Claude' },
  { '<leader>c', group = 'Code / Crates' },
  { '<leader>d', group = 'Debug' },
  { '<leader>f', group = 'Find' },
  { '<leader>g', group = 'Git' },
  { '<leader>gc', group = 'Conflict' },
  { '<leader>r', group = 'Rust' },
  { '<leader>s', group = 'Search / Replace' },
  { '<leader>S', group = 'Session' },
  { '<leader>t', group = 'Toggle' },
  { '<leader>x', group = 'Trouble' },
  { '<leader>w', group = 'Workspace' },
}

vim.keymap.set('n', '<leader>?', function()
  wk.show { global = false }
end, { desc = 'Buffer Local Keymaps (which-key)' })
