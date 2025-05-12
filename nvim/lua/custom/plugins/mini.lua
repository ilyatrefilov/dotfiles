return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.pairs').setup()
    require('mini.files').setup()
    require('mini.surround').setup()
    require('mini.move').setup()
    vim.keymap.set('n', '-', function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = 'Open mini.files' })
  end,
}
