return {
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      -- vim.cmd.colorscheme 'kanso'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {},
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
