vim.pack.add {
  -- Pin to the stable `master` branch (the default `main` branch is the
  -- in-progress rewrite that no longer ships `nvim-treesitter.configs`).
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  -- Also pin to `master`: its `main` branch uses an incompatible setup API.
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'master' },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
    'go',
    'python',
    'rust',
    'tsx',
    'javascript',
    'typescript',
    'fish',
    'zig',
    'ocaml',
    'query',
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
    },
  },
}

require('treesitter-context').setup {
  enable = true,
  max_lines = 3,
}
