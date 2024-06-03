return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<m-h><m-m>', function()
      harpoon:list():add()
    end, { desc = 'Add harpoon mark' })

    vim.keymap.set('n', '<m-h><m-l>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'List harpoon marks' })
  end,
}
