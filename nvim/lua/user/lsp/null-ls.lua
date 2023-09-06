local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.golangci_lint.with({
			extra_args = { "-mod=readonly" },
		}),
		diagnostics.staticcheck,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.cmake_lint,
		null_ls.builtins.diagnostics.cppcheck.with({
			extra_args = { "--project=build/compile_commands.json", "-cppcheck-build-dir=.cppcheck" },
		}),
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.diagnostics.revive.with({
			args = { "-formatter", "json", "-config", "revive.toml", "./..." },
		}),
		null_ls.builtins.diagnostics.tidy,
		null_ls.builtins.diagnostics.todo_comments,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.formatting.asmfmt,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylelint,
		-- formatting.asmfmt,
		formatting.gofmt,
		formatting.goimports,
		-- diagnostics.flake8
		-- null_ls.builtins.diagnostics.pmd.with({
		-- 	extra_args = {
		-- 		"--rulesets",
		-- 		"category/java/bestpractices.xml,category/jsp/bestpractices.xml", -- or path to self-written ruleset
		-- 	},
		-- }),
	},
})
