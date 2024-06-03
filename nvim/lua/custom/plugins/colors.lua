return {

  {
    'rebelot/kanagawa.nvim',
    -- opts = {
    --   transparent = true,
    -- },
    init = function()
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   opts = { transparent = true, style = 'deep' },
  --   init = function()
  --     vim.cmd.colorscheme 'onedark'
  --
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
