-- fetch the dap plugin
local dap = require('dap')
-- Setup DapUI
local dapui = require('dapui')
-- set it up see more configs in their repo
dapui.setup()

local continue = function()
if vim.fn.filereadable('.vscode/launch.json') then
  require('dap.ext.vscode').load_launchjs()
end  
require('dap').continue()
end
-- vim.lsp.buffer_mappings.normal_mode["<leader>dc"] = { continue, "Start/Continue debug" }
-- require('dap.ext.vscode').load_launchjs()
-- require('dap.ext.vscode').load_launchjs(".vscode/launch.json", { "go" })

-- dap fires events, we can listen on them to open UI on certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- Add adapter to delve
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  -- program = "${workspaceFolder}/cmd",
  -- cwd = "${workspaceFolder}",
  showLog = true,
 -- args = { "shop" },
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
  {
    type = "go",
    name = "Debug vscode",
    request = "launch",
    program = '${workspaceFolder}';
    dlvToolPath = os.getenv('GOPATH') .. '/bin/dlv'
  },
  {
    type = "go",
    name = "Debug test vscode", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = '${workspaceFolder}';
    dlvToolPath = os.getenv('GOPATH') .. '/bin/dlv'
  },
  -- works with go.mod packages and sub packages 
  {
    type = "go",
    name = "Debug test (go.mod) vscode",
    request = "launch",
    mode = "test",
    program = '${workspaceFolder}';
    dlvToolPath = os.getenv('GOPATH') .. '/bin/dlv'
  },
  {
    type = "delve",
    name = "Debug shop",
    request = "launch",
    envFile = "${workspaceFolder}/.env",
    program = "${workspaceFolder}/runner.go",
    envFile= "${workspaceFolder}/.env",
  -- program = "${workspaceFolder}/cmd",
  -- cwd = "${workspaceFolder}",
  showLog = true,
  args = { "shop" },
  },
  {
    type = "delve",
    name = "Debug stocks",
    request = "launch",
    envFile = "${workspaceFolder}/.env",
    program = "${workspaceFolder}/runner.go",
    envFile= "${workspaceFolder}/.env",
  -- program = "${workspaceFolder}/cmd",
  -- cwd = "${workspaceFolder}",
    showLog = true,
    args = { "stocks" },
  },
  {
    type = "delve",
    name = "Debug auth",
    request = "launch",
    envFile = "${workspaceFolder}/.env",
    program = "${workspaceFolder}/cmd/server",
  -- program = "${workspaceFolder}/cmd",
  -- cwd = "${workspaceFolder}",
    showLog = true,
  },
  --   {
  --   type = 'go';
  --   name = 'Debug-vscode';
  --   request = 'launch';
  --   program = '${workspaceFolder}';
  --   dlvToolPath = os.getenv('GOPATH') .. '/bin/dlv'
  -- },
}

-- require('dap.ext.vscode').load_launchjs()

dap.set_log_level('TRACE')
dap.adapters.javascript = {
	type = 'executable';
	command = '/usr/bin/node';
}

dap.adapters.go = {
	type = 'executable';
	command = os.getenv('GOPATH') .. '/bin/dlv';
	-- command = 'node';
	-- args = {'debug'};
	args = {os.getenv('HOME') .. '/dev/golang/vscode-go/dist/debugAdapter.js'};
}	


