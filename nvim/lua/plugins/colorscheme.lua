vim.pack.add {
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/sainnhe/gruvbox-material' },
}

require('tokyonight').setup {
  style = 'night',
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
  },
}

-- gruvbox-material tuning (read on demand when that scheme is selected)
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_better_performance = 1

vim.cmd.colorscheme 'tokyonight-night'
