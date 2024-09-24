require("dap-go").setup()
require("dapui").setup({
	layouts = {
		{
			elements = {
				{
					id = "repl",
					size = 0.5
				},
				{
					id = "scopes",
					size = 0.5
				}
			},
			position = "bottom",
			size = 10
		},
		{
			elements = {
				{
					id = "watches",
					size = 0.3
				}
			},
			position = "left",
			size = 30
		},
		{
			elements = {
				{
					id = "stacks",
					size = 0.3
				},
			},
			position = "left",
			size = 30
		},
		{
			elements = {
				{
					id = "breakpoints",
					size = 0.3
				},
			},
			position = "left",
			size = 30
		},
	},
})
local dap, dapui = require("dap"), require("dapui")
local hydra = require("hydra")
local hydras = {}
local bp_hydra = hydra({
	name = "Breakpoints",
	mode = { "n" },
	heads = {
		{ "c", function()
			local condition = vim.fn.input("Condition: ")
			dap.set_breakpoint(condition)
		end, { desc = "conditional breakpoint", private = "true" } },
		{ "h", function()
			local count = vim.fn.input("Hit count: ")
			dap.set_breakpoint(nil, count)
		end, { desc = "hit count breakpoint", private = "true" } },
		{ "p", function()
			local log = vim.fn.input("Log: ")
			dap.set_breakpoint(nil, nil, log)
		end, { desc = "log point", private = "true" } },
		{ "l", function()
			dapui.float_element("breakpoints")
		end, { desc = "list breakpoints", private = "true" } },
		{ "x", dap.clear_breakpoints, { desc = "clear", private = "true" } },
	},
	config = {
		color = "blue",
		on_exit = function()
			hydras["debug"]:activate()
		end
	},
})
local dapui_hydra = hydra({
	name = "dapui",
	mode = { "n" },
	heads = {
		{ "w", function()
			dapui.toggle(2)
		end, { desc = "open watches", private = "true" } },
		{ "s", function()
			dapui.toggle(3)
		end, { desc = "open stacks", private = "true" } },
		{ "b", function()
			dapui.toggle(4)
		end, { desc = "open breakpoints", private = "true" } },
	},
	config = {
		color = "blue",
		on_exit = function()
			hydras["debug"]:activate()
		end
	},
})
local debug_hydra = hydra({
	name = "Debug",
	mode = { "n" },
	heads = {
		{ "n", dap.step_over,         { desc = "next line", private = "true" } },
		{ "s", dap.step_into,         { desc = "step into", private = "true" } },
		{ "f", dap.step_out,          { desc = "step out", private = "true" } },
		{ "c", dap.continue,          { desc = "continue", private = "true" } },
		{ "<", dap.run_to_cursor,     { desc = "run to cursor", private = "true" } },
		{ ">", dap.focus_frame,       { desc = "focus frame", private = "true" } },
		{ "r", dap.restart,           { desc = "restart", private = "true" } },
		{ "b", dap.toggle_breakpoint, { desc = "breakpoint", private = "true" } },
		{ "<C-d>e", function()
			local expr = vim.fn.input("Expression: ")
			dapui.eval(expr)
		end, { desc = "evaluate expression", private = "true", mode = { "n" } } },
		{ "<C-d>w", function()
			local expr = vim.fn.input("Watch: ")
			dapui.elements.watches.add(expr)
		end, { desc = "watch expression", private = "true", mode = { "n" } } },
		{ "<C-b>", function() hydras["bp"]:activate() end,    { exit = true, desc = "breakpoint menu", private = "true" } },
		{ "<C-v>", function() hydras["dapui"]:activate() end, { exit = true, desc = "ui menu", private = "true" } },
		{ "<esc>", nil,                                       { exit = true, desc = "exit debug mode", private = "true" } },
		{ "q",     dap.terminate,                             { exit = true, desc = "exit debug mode", private = "true" } },
	},
	body = "<space>d",
	config = {
		color = "pink",
	}
})
hydras["dapui"] = dapui_hydra
hydras["bp"] = bp_hydra
hydras["debug"] = debug_hydra

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open(1)
end
dap.listeners.after.event_initialized["hydra_config"] = function()
	debug_hydra:activate()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_terminated["hydra_config"] = function()
	debug_hydra:exit()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["hydra_config"] = function()
	debug_hydra:exit()
end
