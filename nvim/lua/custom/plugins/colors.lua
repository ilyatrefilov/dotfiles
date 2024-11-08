return {
  {
    'rebelot/kanagawa.nvim',
    opts = {},
    init = function()
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    init = function()
      -- vim.cmd.colorscheme 'nightfox'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_dim_inactive_windows = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = { transparent = true, style = 'deep' },
    init = function()
      -- vim.cmd.colorscheme 'onedark'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}
