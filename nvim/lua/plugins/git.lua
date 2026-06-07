vim.pack.add {
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' },
  { src = 'https://github.com/akinsho/git-conflict.nvim' },
}

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = require 'gitsigns'
    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- Navigation between hunks
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gs.nav_hunk 'next'
      end
    end, 'Next git hunk')
    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gs.nav_hunk 'prev'
      end
    end, 'Previous git hunk')

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, 'Stage hunk')
    map('n', '<leader>gr', gs.reset_hunk, 'Reset hunk')
    map('v', '<leader>gs', function()
      gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, 'Stage selected hunk')
    map('v', '<leader>gr', function()
      gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, 'Reset selected hunk')
    map('n', '<leader>gS', gs.stage_buffer, 'Stage buffer')
    map('n', '<leader>gR', gs.reset_buffer, 'Reset buffer')
    map('n', '<leader>gp', gs.preview_hunk, 'Preview hunk')
    map('n', '<leader>gb', function()
      gs.blame_line { full = true }
    end, 'Blame line')
    map('n', '<leader>gB', gs.toggle_current_line_blame, 'Toggle line blame')
  end,
}

require('neogit').setup {}

-- Merge-conflict resolution. Default `ct`/`co` mappings would shadow the built-in
-- change operators, so disable them and bind under <leader>gc instead.
require('git-conflict').setup { default_mappings = false }

local map = vim.keymap.set
map('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Open Neogit' })
map('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Open Diffview' })
map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'File history' })
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>', { desc = 'Repo history' })

-- Conflict navigation and resolution
map('n', ']x', '<cmd>GitConflictNextConflict<cr>', { desc = 'Next git conflict' })
map('n', '[x', '<cmd>GitConflictPrevConflict<cr>', { desc = 'Previous git conflict' })
map('n', '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', { desc = 'Conflict: choose ours' })
map('n', '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', { desc = 'Conflict: choose theirs' })
map('n', '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', { desc = 'Conflict: choose both' })
map('n', '<leader>gcn', '<cmd>GitConflictChooseNone<cr>', { desc = 'Conflict: choose none' })
map('n', '<leader>gcl', '<cmd>GitConflictListQf<cr>', { desc = 'Conflict: list (quickfix)' })
