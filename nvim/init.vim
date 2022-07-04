" Color theme
set path+=**

set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Plugins
call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

" Auto brackets
Plug 'windwp/nvim-autopairs'

" LSP Progress
Plug 'j-hui/fidget.nvim'

" Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

" Diagrams
Plug 'jbyuki/venn.nvim'

" RFC Explorer
Plug 'mhinz/vim-rfc'

" Outline
Plug 'simrat39/symbols-outline.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

" Nvim tree
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Lang tools
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'darrikonn/vim-gofmt'
Plug 'tomlion/vim-solidity'

" Git 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'

" Misc
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'phaazon/hop.nvim'
Plug 'machakann/vim-highlightedyank'

" Prettier
Plug 'sbdchd/neoformat'

" Colorscheme
Plug 'EdenEast/nightfox.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Line indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" Rooter
Plug 'airblade/vim-rooter'



call plug#end()

lua require("conf")
lua require'nvim-treesitter.configs'.setup{ highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" Colors
colorscheme gruvbox
highlight Normal guibg=none

" Remaps
let mapleader=" "
nnoremap <silent> Q <nop>
nnoremap <silent> <C-f> !tmux new tmux-sessionizer<CR>
nnoremap <leader>bs /<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndoTreeShow<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>



vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z



xnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y
nnoremap <leader>d "_d
vnoremap <leader>d "_d
inoremap jk <Esc>
nnoremap <leader>w :w<CR>
inoremap <Ctrl-C> <Esc>

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup end

