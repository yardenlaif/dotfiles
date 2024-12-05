local util = require("lspconfig/util")
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
-- require("lspconfig")["grammarly"].setup({
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	capabilities = capabilities,
-- })
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
require("lspconfig")["jedi_language_server"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
vim.g.rustaceanvim = {
	server = {
		-- cmd = function()
		-- 	return { 'ra-multiplex', 'client' }
		-- end,
		default_settings = {
			-- rust-analyzer language server configuration
			['rust-analyzer'] = {
				imports = {
					granularity = {
						group = "module",
						enforce = true,
					},
				},
				checkOnSave = false,
			},
		},
	}
}
