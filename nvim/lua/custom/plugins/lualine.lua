return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local material_gruvbox = require 'lualine.themes.gruvbox-material'
    -- local kanagawa = require 'lualine.themes.kanagawa'
    require('lualine').setup {
      options = { theme = material_gruvbox },
      extensions = { 'oil', 'mason', 'trouble' },
    }
  end,
}
