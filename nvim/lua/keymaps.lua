local set = vim.keymap.set

-- Clear search highlight on <Esc>
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics ( loclist/qflist are also available via Trouble: <leader>xL / <leader>xQ )
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror' })

-- Terminal / insert escapes
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('i', 'jk', '<Esc>', { desc = 'Quick exit to normal mode' })
set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file', silent = true })

-- Keep cursor centered while navigating
set('n', 'n', 'nzzzv', { noremap = true })
set('n', 'N', 'Nzzzv', { noremap = true })
set('n', '<C-d>', '<C-d>zz', { noremap = true })
set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Close all buffers
set('n', '<leader>qa', '<cmd>1,$bd!<CR>', { desc = 'Close all buffers', noremap = true })

-- Window navigation with CTRL+<hjkl>
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus window left' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus window right' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus window down' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus window up' })

-- Resize splits
set('n', '<M-,>', '<C-w>5<', { desc = 'Shrink window width' })
set('n', '<M-.>', '<C-w>5>', { desc = 'Grow window width' })

-- Tab navigation with arrow keys
set('n', '<left>', 'gT', { desc = 'Previous tab' })
set('n', '<right>', 'gt', { desc = 'Next tab' })
