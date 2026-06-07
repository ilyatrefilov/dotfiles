-- Plugin modules are loaded in order. Each module calls `vim.pack.add` for its
-- own plugins and then configures them. `vim.pack` (Neovim 0.12+) installs any
-- missing plugins synchronously on first start.
local modules = {
  'plugins.colorscheme',
  'plugins.mini',
  'plugins.oil',
  'plugins.telescope',
  'plugins.treesitter',
  'plugins.completion',
  'plugins.lsp',
  'plugins.rust',
  'plugins.dap',
  'plugins.trouble',
  'plugins.todo',
  'plugins.git',
  'plugins.claude',
  'plugins.session',
  'plugins.whichkey',
  'plugins.conform',
  'plugins.editor',
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify('Failed to load ' .. module .. ':\n' .. err, vim.log.levels.ERROR)
  end
end
