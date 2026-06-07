vim.pack.add {
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/theHamsta/nvim-dap-virtual-text' },
}

local dap = require 'dap'
local dapui = require 'dapui'

dapui.setup()
require('nvim-dap-virtual-text').setup {}

-- Open/close the UI automatically around a debug session
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- codelldb adapter (installed via Mason); shared by C/C++ and used by rustaceanvim
local codelldb = vim.fn.stdpath 'data' .. '/mason/bin/codelldb'
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = codelldb,
    args = { '--port', '${port}' },
  },
}

local function lldb_program()
  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
end

for _, ft in ipairs { 'c', 'cpp' } do
  dap.configurations[ft] = {
    {
      name = 'Launch (codelldb)',
      type = 'codelldb',
      request = 'launch',
      program = lldb_program,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
end

local map = vim.keymap.set
map('n', '<F5>', dap.continue, { desc = 'Debug: continue' })
map('n', '<F10>', dap.step_over, { desc = 'Debug: step over' })
map('n', '<F11>', dap.step_into, { desc = 'Debug: step into' })
map('n', '<F12>', dap.step_out, { desc = 'Debug: step out' })
map('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: toggle breakpoint' })
map('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: conditional breakpoint' })
map('n', '<leader>dc', dap.continue, { desc = 'Debug: continue' })
map('n', '<leader>di', dap.step_into, { desc = 'Debug: step into' })
map('n', '<leader>do', dap.step_over, { desc = 'Debug: step over' })
map('n', '<leader>dO', dap.step_out, { desc = 'Debug: step out' })
map('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: toggle REPL' })
map('n', '<leader>du', dapui.toggle, { desc = 'Debug: toggle UI' })
map('n', '<leader>dt', dap.terminate, { desc = 'Debug: terminate' })
