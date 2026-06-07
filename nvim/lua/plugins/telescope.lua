vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
}

-- telescope-fzf-native is a C extension; compile it on first install.
local fzf_dir = vim.fn.stdpath 'data' .. '/site/pack/core/opt/telescope-fzf-native.nvim'
if vim.fn.filereadable(fzf_dir .. '/build/libfzf.so') == 0 then
  vim.notify('Building telescope-fzf-native…', vim.log.levels.INFO)
  vim.fn.system { 'make', '-C', fzf_dir }
end

local telescope = require 'telescope'

telescope.setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
local map = vim.keymap.set

map('n', '<leader><space>', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>/', builtin.live_grep, { desc = 'Grep' })
map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
map('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecent files' })
map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
map('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
map('n', '<leader>fc', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[F]ind [C]onfig files' })
map('n', '<leader>f/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in current buffer' })
