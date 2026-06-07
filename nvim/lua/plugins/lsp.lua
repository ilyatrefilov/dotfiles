vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  -- Ships the lsp/<server>.lua definitions consumed by vim.lsp.enable
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/folke/lazydev.nvim' },
  -- LSP / Mason progress notifications in the corner
  { src = 'https://github.com/j-hui/fidget.nvim' },
}

require('fidget').setup {}

-- Lua development helper (configures lua_ls for editing Neovim config)
require('lazydev').setup {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

require('mason').setup()

-- Servers managed by Mason + native vim.lsp. rust_analyzer is intentionally
-- excluded: rustaceanvim owns it (see plugins/rust.lua).
local servers = { 'clangd', 'cmake', 'gopls', 'pyright', 'ts_ls', 'lua_ls' }

require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_enable = { exclude = { 'rust_analyzer' } },
}

-- CLI tools used by conform (formatters) and nvim-dap (codelldb)
require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
    'prettierd',
    'xmlformatter',
    'codelldb',
  },
}

-- Global defaults merged into every server config (Neovim 0.11+ native API)
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
    },
  },
})

vim.diagnostic.config {
  virtual_text = { source = 'if_many' },
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
}

-- Toggle between inline virtual_text and full virtual_lines (native 0.11)
vim.keymap.set('n', '<leader>tl', function()
  local cfg = vim.diagnostic.config()
  if cfg.virtual_lines then
    vim.diagnostic.config { virtual_lines = false, virtual_text = { source = 'if_many' } }
  else
    vim.diagnostic.config { virtual_lines = { current_line = false }, virtual_text = false }
  end
end, { desc = 'Toggle diagnostic virtual lines' })

-- Buffer-local keymaps once a server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf
    local builtin = require 'telescope.builtin'
    local function map(keys, fn, desc, mode)
      vim.keymap.set(mode or 'n', keys, fn, { buffer = buf, desc = 'LSP: ' .. desc })
    end

    map('gd', builtin.lsp_definitions, 'Goto definition')
    -- `grr` matches Neovim 0.11's native default and avoids a `gr`-prefix delay
    -- with `grn`/`gra` below.
    map('grr', builtin.lsp_references, 'Goto references')
    map('gI', builtin.lsp_implementations, 'Goto implementation')
    map('gy', builtin.lsp_type_definitions, 'Goto type definition')
    map('gD', vim.lsp.buf.declaration, 'Goto declaration')
    map('<leader>ds', builtin.lsp_document_symbols, 'Document symbols')
    map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, 'Workspace symbols')
    map('grn', vim.lsp.buf.rename, 'Rename')
    map('gra', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })
    map('K', vim.lsp.buf.hover, 'Hover documentation')

    -- Toggle inlay hints if the server supports them
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/inlayHint', buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = buf }, { bufnr = buf })
      end, 'Toggle inlay hints')
    end
  end,
})
