local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "pappasam/coc-jedi" })
	use({ "psf/black" })
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" })
	-- use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			local navic = require("nvim-navic")
			local f = function()
				local d = navic.get_data()
				local display_data = {}
				local get_data_to_display = function(v)
					return v["icon"] .. v["name"]
				end
				for _, v in pairs(d) do
					if
						v["kind"] == 5
						or v["kind"] == 6
						or v["kind"] == 10
						or v["kind"] == 11
						or v["kind"] == 12
						or v["kind"] == 23
					then
						table.insert(display_data, v)
					end
				end
				if next(display_data) == nil then
					return ""
				end
				if #display_data == 1 then
					return get_data_to_display(display_data[#display_data])
				end
				if #display_data == 2 then
					return get_data_to_display(display_data[#display_data - 1])
						.. "  "
						.. get_data_to_display(display_data[#display_data])
				end
				if #display_data >= 3 then
					return get_data_to_display(display_data[#display_data - 2])
						.. "  "
						.. get_data_to_display(display_data[#display_data - 1])
						.. "  "
						.. get_data_to_display(display_data[#display_data])
				end
			end
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "gruvbox",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "filename" },
					lualine_b = { { f, cond = navic.is_available } },
					lualine_c = { "branch", "diff", "diagnostics" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	})
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	use({ "folke/which-key.nvim" })

	-- Colorschemes
	use({ "sainnhe/gruvbox-material" })

	-- Cmp
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.cmp")
		end,
		commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d", -- The following commit breaks commandline completion: "53f49c5145d05a53b997d3f647f97e5ac8e9bd5c"
	}) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Comment Toggle
	use({ "tpope/vim-commentary" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }) -- a bunch of snippets to use

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("nvim-lsp-installer").setup({})
			require("user.lsp")
		end,
	}) -- enable LSP
	use({
		"ranjithshegde/ccls.nvim",
		config = function()
			require("ccls").setup(config)
		end,
	})
	use({
		"mfussenegger/nvim-jdtls",
	})

	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			local navic = require("nvim-navic")
			navic.setup({
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = "練",
					Interface = "練",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = "◩ ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = "ﳠ ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
				highlight = false,
				depth_limit_indicator = "..",
				safe_output = true,
				separator = "  ",
				depth_limit = 3,
			})
		end,
	})
	use({ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- for formatters and linters
	use({
		"RRethy/vim-illuminate",
		config = function()
			-- default configuration
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
			})
		end,
	})
	use({ "williamboman/nvim-lsp-installer" })
	-- LSP Progress
	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			-- Showing defaults
			require("nvim-lightbulb").setup({
				-- LSP client names to ignore
				-- Example: {"sumneko_lua", "null-ls"}
				ignore = {},
				sign = {
					enabled = true,
					-- Priority of the gutter sign
					priority = 10,
				},
				float = {
					enabled = false,
					-- Text to show in the popup float
					text = "💡",
					-- Available keys for window options:
					-- - height     of floating window
					-- - width      of floating window
					-- - wrap_at    character to wrap at for computing height
					-- - max_width  maximal width of floating window
					-- - max_height maximal height of floating window
					-- - pad_left   number of columns to pad contents at left
					-- - pad_right  number of columns to pad contents at right
					-- - pad_top    number of lines to pad contents at top
					-- - pad_bottom number of lines to pad contents at bottom
					-- - offset_x   x-axis offset of the floating window
					-- - offset_y   y-axis offset of the floating window
					-- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
					-- - winblend   transparency of the window (0-100)
					win_opts = {},
				},
				virtual_text = {
					enabled = false,
					-- Text to show at virtual text
					text = "💡",
					-- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
					hl_mode = "replace",
				},
				status_text = {
					enabled = false,
					-- Text to provide when code actions are available
					text = "💡",
					-- Text to provide when no actions are available
					text_unavailable = "",
				},
				autocmd = {
					enabled = false,
					-- see :help autocmd-pattern
					pattern = { "*" },
					-- see :help autocmd-events
					events = { "CursorHold", "CursorHoldI" },
				},
			})
		end,
	})
	-- Code actions
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("project")
			require("telescope").load_extension("aerial")
		end,
	})
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Outline
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})

	-- FZF
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "junegunn/fzf.vim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("user.treesitter")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
						"for",
						"while",
						"if",
						"switch",
						"case",
						"interface",
						"struct",
						"enum",
					},
					-- Patterns for specific filetypes
					-- If a pattern is missing, *open a PR* so everyone can benefit.
					tex = {
						"chapter",
						"section",
						"subsection",
						"subsubsection",
					},
					haskell = {
						"adt",
					},
					rust = {
						"impl_item",
					},
					terraform = {
						"block",
						"object_elem",
						"attribute",
					},
					scala = {
						"object_definition",
					},
					vhdl = {
						"process_statement",
						"architecture_body",
						"entity_declaration",
					},
					markdown = {
						"section",
					},
					elixir = {
						"anonymous_function",
						"arguments",
						"block",
						"do_block",
						"list",
						"map",
						"tuple",
						"quoted_content",
					},
					json = {
						"pair",
					},
					typescript = {
						"export_statement",
					},
					yaml = {
						"block_mapping_pair",
					},
				},
				exact_patterns = {
					-- Example for a specific filetype with Lua patterns
					-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
					-- exactly match "impl_item" only)
					-- rust = true,
				},

				-- [!] The options below are exposed but shouldn't require your attention,
				--     you can safely ignore them.

				zindex = 20, -- The Z-index of the context window
				mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
			})
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup(require("user.gitsigns"))
		end,
	})
	use({
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_date_format = "%x"
		end,
	})
	use({ "tpope/vim-fugitive" })
	-- use({
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"kyazdani42/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup()
	-- 	end,
	-- })

	-- Start page
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup(require("user.startup"))
		end,
	})
	-- Trouble
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup(require("user.trouble"))
		end,
	})

	-- Formatting
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("user.formatter")
		end,
	})

	-- Run Config
	use("~/projects/runconfig.nvim")

	-- Sessions
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})

	-- Tests
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				-- your neotest config here
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	})
	-- Git
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup({})
		end,
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("user.dap")
		end,
	})
	use({ "leoluz/nvim-dap-go", requires = "mfussenegger/nvim-dap" })

	-- Stickybuf
	use({
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup()
		end,
	})

	-- Undotree
	use({ "mbbill/undotree" })

	-- Todo
	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
