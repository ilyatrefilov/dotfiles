require('tabnine').setup({
  disable_auto_comment=false,
  accept_keymap="<C-y>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 500,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
