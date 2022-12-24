local goDap = require("dap-go")
goDap.setup({})

local dap = require("dap")
-- dap.adapters.delve = {
-- 	type = "server",
-- 	host = "127.0.0.1",
-- 	port = 38697,
-- }

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.adapters.go = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/go/vscode-go/dist/debugAdapter.js" },
}
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
	{
		type = "go",
		name = "e2e",
		request = "launch",
		showLog = false,
		program = "/home/yarden/projects/GoRook/CI/e2e_test/e2e_main.go",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
}
