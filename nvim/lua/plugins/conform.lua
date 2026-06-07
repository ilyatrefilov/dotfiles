vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' },
}

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable autoformat for languages without a fast/standard formatter
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_format = disable_filetypes[vim.bo[bufnr].filetype] and 'never' or 'fallback',
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    xml = { 'xmlformatter' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
  },
}

vim.keymap.set('n', '<leader>cf', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[C]ode [F]ormat buffer' })
