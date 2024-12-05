local cmp = require("cmp")


cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp",               keyword_length = 1 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		{ name = "nvim_lua" },
	}, {
		{ name = "buffer" },
	}),
	experimental = {
		ghost_text = true,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
})

-- cmdline completion
