
local Remap = require("config.keymap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


nnoremap("Q", "<nop>")

-- Sizing 
nnoremap("<leader>+", ":vertical resize +5<CR>")
nnoremap("<leader>-", ":vertical resize -5<CR>")
nnoremap("<leader>rp", ":resize 100<CR>")


vnoremap("J", ":m '>1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")


xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

inoremap("jk", "<Esc>")
nnoremap("<leader>w", ":w<CR>")
inoremap("<C-c>", "<Esc>")

nnoremap("<leader>qa", ":1, $bd!<CR>")


