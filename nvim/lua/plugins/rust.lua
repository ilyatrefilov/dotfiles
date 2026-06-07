vim.pack.add {
  -- rustaceanvim configures itself; no setup() call. Set vim.g.rustaceanvim
  -- before the plugin attaches to a Rust buffer.
  { src = 'https://github.com/mrcjkb/rustaceanvim' },
  { src = 'https://github.com/cordx56/rustowl' },
  -- Cargo.toml dependency management (versions, updates, features)
  { src = 'https://github.com/saecki/crates.nvim' },
}

require('crates').setup {
  completion = { crates = { enabled = true } },
  lsp = { enabled = true, actions = true, completion = true, hover = true },
}

-- Cargo.toml-only keymaps
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('crates-keymaps', { clear = true }),
  pattern = 'Cargo.toml',
  callback = function(ev)
    local crates = require 'crates'
    local function map(keys, fn, desc)
      vim.keymap.set('n', keys, fn, { buffer = ev.buf, desc = 'Crates: ' .. desc })
    end
    map('K', crates.show_popup, 'Show popup')
    map('<leader>cv', crates.show_versions_popup, 'Show versions')
    map('<leader>cf', crates.show_features_popup, 'Show features')
    map('<leader>cu', crates.update_crate, 'Update crate')
    map('<leader>cU', crates.upgrade_crate, 'Upgrade crate')
    map('<leader>ca', crates.update_all_crates, 'Update all crates')
    map('<leader>cA', crates.upgrade_all_crates, 'Upgrade all crates')
    map('<leader>cd', crates.open_documentation, 'Open docs')
  end,
})

vim.g.rustaceanvim = {
  -- rustaceanvim auto-discovers codelldb installed via Mason for DAP.
  server = {
    on_attach = function(_, bufnr)
      local function map(keys, action, desc)
        vim.keymap.set('n', keys, action, { buffer = bufnr, desc = 'Rust: ' .. desc })
      end
      map('<leader>ra', function()
        vim.cmd.RustLsp 'codeAction'
      end, 'Code action')
      map('<leader>rr', function()
        vim.cmd.RustLsp 'runnables'
      end, 'Runnables')
      map('<leader>rd', function()
        vim.cmd.RustLsp 'debuggables'
      end, 'Debuggables')
      map('K', function()
        vim.cmd.RustLsp { 'hover', 'actions' }
      end, 'Hover actions')
      map('<leader>re', function()
        vim.cmd.RustLsp 'explainError'
      end, 'Explain error')
    end,
  },
}

-- RustOwl: visualize ownership/lifetimes; toggle with <leader>ro
require('rustowl').setup {
  client = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>ro', function()
        require('rustowl').toggle(bufnr)
      end, { buffer = bufnr, desc = 'Toggle RustOwl' })
    end,
  },
}
