local util = require("lspconfig/util")
require("nvim-lsp-installer")
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["cmake"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["jdtls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
-- require("lspconfig")["solargraph"].setup({
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- })
require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
local clangdCapabilities = capabilities
clangdCapabilities.offsetEncoding = { "utf-16" }
require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["asm_lsp"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["html"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	capabilities = capabilities,
})
require("lspconfig")["gopls"].setup({
	cmd = { "gopls", "serve" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["grammarly"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["jsonls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["omnisharp"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

require("user.lsp.null-ls")

local notify = require("notify")
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	local lvl = ({
		"ERROR",
		"WARN",
		"INFO",
		"DEBUG",
	})[result.type]
	notify({ result.message }, lvl, {
		title = "LSP | " .. client.name,
		timeout = 10000,
		keep = function()
			return lvl == "ERROR" or lvl == "WARN"
		end,
	})
end

-- local function qf_rename()
-- 	local position_params = vim.lsp.util.make_position_params()
-- 	position_params.oldName = vim.fn.expand("<cword>")
-- 	position_params.newName = vim.fn.input("Rename To> ", position_params.oldName)

-- 	vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
-- 		if not result or not result.changes then
-- 			require("notify")(string.format("could not perform rename"), "error", {
-- 				title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
-- 				timeout = 2500,
-- 			})

-- 			return
-- 		end

-- 		vim.lsp.handlers["textDocument/rename"](err, result, ...)

-- 		local notification, entries = "", {}
-- 		local num_files, num_updates = 0, 0
-- 		for uri, edits in pairs(result.changes) do
-- 			num_files = num_files + 1
-- 			local bufnr = vim.uri_to_bufnr(uri)

-- 			for _, edit in ipairs(edits) do
-- 				local start_line = edit.range.start.line + 1
-- 				local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

-- 				num_updates = num_updates + 1
-- 				table.insert(entries, {
-- 					bufnr = bufnr,
-- 					lnum = start_line,
-- 					col = edit.range.start.character + 1,
-- 					text = line,
-- 				})
-- 			end

-- 			local short_uri = string.sub(vim.uri_to_fname(uri), #vim.fn.getcwd() + 2)
-- 			notification = notification .. string.format("made %d change(s) in %s", #edits, short_uri)
-- 		end

-- 		require("notify")(notification, "info", {
-- 			title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
-- 			timeout = 2500,
-- 		})

-- 		if num_files > 1 then
-- 			require("utils").qf_populate(entries, "r")
-- 		end
-- 		-- print(string.format("updated %d instance(s) in %d file(s)", num_updates, num_files))
-- 	end)
-- end

-- vim.lsp.buf.rename = qf_rename
