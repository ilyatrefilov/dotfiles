return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzf-native.nvim", 
      {run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}
    )

    -- Lua line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

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

    -- Colorscheme section
    use("folke/tokyonight.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")

    -- Misc
    use({
            "phaazon/hop.nvim",
            config = function()
                    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
            end
    })
    use("kylechui/nvim-surround")
    use("lukas-reineke/indent-blankline.nvim")
    use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
    })

    use("yamatsum/nvim-cursorline")

end)

