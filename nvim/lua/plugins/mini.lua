vim.pack.add {
  { src = 'https://github.com/echasnovski/mini.nvim' },
}

-- Text objects: a)round / i)nside for brackets, quotes, functions, args, ...
require('mini.ai').setup { n_lines = 500 }

-- Auto-close brackets and quotes
require('mini.pairs').setup()

-- Add/delete/replace surroundings (sa, sd, sr)
require('mini.surround').setup()

-- Move lines/selections with Alt+hjkl
require('mini.move').setup()

-- Icons provider; mock nvim-web-devicons so plugins expecting it work too
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

-- Lightweight statusline that picks up the active colorscheme
require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

-- Buffer tabs along the top
require('mini.tabline').setup()

-- Pretty vim.notify replacement (used by the plugin loader and LSP)
require('mini.notify').setup()
vim.notify = require('mini.notify').make_notify()

-- Start screen
require('mini.starter').setup()

-- Animated indent guides; disabled in special/non-code buffers
require('mini.indentscope').setup {
  symbol = '│',
  options = { try_as_border = true },
}
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('mini-indentscope-disable', { clear = true }),
  pattern = {
    'help',
    'starter',
    'oil',
    'lazy',
    'mason',
    'trouble',
    'Trouble',
    'neogit',
    'NeogitStatus',
    'dapui_scopes',
    'dapui_watches',
    'dapui_console',
    'dap-repl',
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
