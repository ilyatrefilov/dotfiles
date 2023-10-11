return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzy-native.nvim",
        requires = { { "nvim-telescope/telescope.nvim" } },
    })
    use("nvim-telescope/telescope-file-browser.nvim")
    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
        requires = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
        },
    })

    -- Lua line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
    -- Icons
    use("kyazdani42/nvim-web-devicons")


    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
           { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })


    use({
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({
                width = 50,
            })
        end
    })
    use("ray-x/lsp_signature.nvim")
    use("j-hui/fidget.nvim")
    use("simrat39/rust-tools.nvim")
    use({"codota/tabnine-nvim", run = "./dl_binaries.sh"})


    -- Git worktree
    use("ThePrimeagen/git-worktree.nvim")

    -- Harpoon
    use("ThePrimeagen/harpoon")
    --
    -- Venn
    use("jbyuki/venn.nvim")

    -- RFC Explorer
    use("mhinz/vim-rfc")

    -- Undotree
    use("mbbill/undotree")

    -- Auto brackets
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })

    -- Git
    use("TimUntersberger/neogit")
    use("sindrets/diffview.nvim")
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    })
    use("tpope/vim-fugitive")

    -- Colorscheme section
    use("folke/tokyonight.nvim")
    use("ellisonleao/gruvbox.nvim")
    use("luisiacc/gruvbox-baby")
    use 'navarasu/onedark.nvim'
    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")
    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    })

    -- Misc
    use({
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
        end
    })
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    })
    -- use("lukas-reineke/indent-blankline.nvim")
    use({
        "echasnovski/mini.nvim", 
        branch = "stable"
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    })
    use("yamatsum/nvim-cursorline")
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup()
        end
    })
    use("iamcco/markdown-preview.nvim")
end)
