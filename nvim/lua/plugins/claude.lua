vim.pack.add {
  { src = 'https://github.com/coder/claudecode.nvim' },
}

require('claudecode').setup {
  -- We don't install snacks.nvim, so use the built-in terminal split
  terminal = {
    provider = 'native',
    split_side = 'right',
    split_width_percentage = 0.35,
  },
}

local map = vim.keymap.set
map('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Claude: toggle' })
map('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Claude: focus' })
map('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = 'Claude: resume' })
map('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Claude: add current buffer' })
map('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Claude: send selection' })
map('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', { desc = 'Claude: add file (oil/tree)' })
map('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Claude: accept diff' })
map('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Claude: deny diff' })
