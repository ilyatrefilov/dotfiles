return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use({
        "romgrk/fzy-lua-native",
        requires = { { "nvim-telescope/telescope.nvim" } },
    })
    use({
        "nvim-telescope/telescope-fzy-native.nvim",
        requires = { { "nvim-telescope/telescope.nvim" } },
    })
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Lua line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
    -- Icons
    use("kyazdani42/nvim-web-devicons")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use({
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end
    })
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")
    use("ray-x/lsp_signature.nvim")
    use("j-hui/fidget.nvim")
    use("simrat39/rust-tools.nvim")


    -- Git worktree
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

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
    use("RRethy/nvim-base16")

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
    use("lukas-reineke/indent-blankline.nvim")
    use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
    })
    use("yamatsum/nvim-cursorline")

end)

