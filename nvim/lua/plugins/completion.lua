vim.pack.add {
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  -- Pin to the 1.x release line so blink ships a prebuilt fuzzy binary
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1' },
}

require('blink.cmp').setup {
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = { auto_show = false },
  },

  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },

  -- Prefer the Rust matcher; fall back to Lua with a warning if unavailable
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}
