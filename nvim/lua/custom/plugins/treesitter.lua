return {

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        enable = true,
        throttle = true,
        max_lines = 2,
        patterns = {
          default = {
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },

          rust = {
            'loop_expression',
            'impl_item',
            'block',
          },

          typescript = {
            'class_declaration',
            'abstract_class_declaration',
            'else_clause',
          },
        },
      },
    },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'html',
        'lua',
        'markdown',
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
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      inlay_hints = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
