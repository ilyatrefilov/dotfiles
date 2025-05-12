
-- options
--

vim.g.have_nerd_font = true

-- [[ setting options ]]
-- see `:help vim.opt`
--  for more options, you can see `:help option-list`

-- make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- remove cursor on insert
vim.o.guicursor = ''

-- don't show the mode, since it's already in status line
vim.opt.showmode = false

-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching unless \c or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- color column
vim.opt.colorcolumn = '120'

-- [[ basic keymaps ]]
--  see `:help vim.keymap.set()`

vim.opt.hlsearch = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
