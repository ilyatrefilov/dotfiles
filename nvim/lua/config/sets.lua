vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true


vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.showmode = false
vim.opt.shortmess:append("c")
vim.opt.updatetime = 50
vim.opt.cmdheight = 1
vim.opt.background = "dark"
vim.g.mapleader = " "
