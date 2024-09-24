local opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("", ";", "<Nop>", opts)
keymap("n", ";", ":", { noremap = true })
keymap("v", ";", ":", { noremap = true })
keymap("x", ";", ":", { noremap = true })

-- Leader
keymap("", "'", "<Nop>", opts)
vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

-- Telescope
keymap("n", "<leader>f", "<Cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader><leader>", "<Cmd>Telescope resume<CR>", opts)
keymap("n", "<leader>a", "<cmd>Telescope treesitter<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
keymap("n", "<leader>i", "<cmd>Telescope lsp_implementations<cr>", opts)
keymap("n", "<leader>r", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts)
keymap("x", "<C-f>", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope aerial<cr>", opts)
keymap('n', '<leader>gi', "<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<cr>", opts)

-- One visual line movement
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Format on command
keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)

-- Paste above
keymap("n", "P", "O<ESC>p", opts)

-- Git
keymap("n", "<C-g>", "<Nop>", opts)
keymap("n", "<C-g>h", "<cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_linehl<CR>", opts)
keymap("n", "<C-g>g", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<C-g>s", "<cmd>Git<CR>", opts)
keymap("n", "<C-g>j", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<C-g>k", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<C-g>d", "<cmd>Gitsigns diffthis<CR>", opts)
keymap("n", "<C-g>u", "<cmd>Gitsigns reset_hunk<CR>", opts)
keymap("n", "<C-g>r", "<cmd>Gitsigns reset_buffer<CR>", opts)
keymap("n", "<C-g>b", "<cmd>Gitsigns stage_buffer<CR>", opts)
keymap("n", "<C-g>a", "<cmd>Gitsigns stage_hunk<CR>", opts)
keymap("n", "<C-g>c", "<cmd>Git commit<CR>", opts)
keymap("n", "<C-g>p", "<cmd>Git push<CR>", opts)

-- Comment in visual mode
keymap("x", "<C-_>", "<Plug>Commentary<CR>", opts)
keymap("n", "<C-_>", "<cmd>Commentary<CR>", opts)
keymap("i", "<C-_>", "<cmd>Commentary<CR>", opts)

-- Diagnostics
vim.keymap.set(
	"n",
	"<C-e>s",
	"<cmd>lua vim.diagnostic.open_float { severity = vim.diagnostic.severity.ERROR }<CR>",
	opts
)
vim.keymap.set(
	"n",
	"<C-e>k",
	"<cmd>lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>",
	opts
)
vim.keymap.set(
	"n",
	"<C-e>j",
	"<cmd>lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>",
	opts
)
vim.keymap.set(
	"n",
	"<C-e>l",
	"<cmd>lua vim.diagnostic.setloclist { severity = vim.diagnostic.severity.ERROR }<CR>",
	opts
)

-- Tests
vim.keymap.set("n", "<C-t>n", "<cmd>TestNearest<CR>")
vim.keymap.set("n", "<C-t>f", "<cmd>TestFile<CR>")
vim.keymap.set("n", "<C-t>s", "<cmd>TestSuite<CR>")
vim.keymap.set("n", "<C-t>l", "<cmd>TestLast<CR>")
vim.keymap.set("n", "<C-t>v", "<cmd>TestVisit<CR>")

-- Copy to clipboard
vim.keymap.set("v", "Y", '"+y"', opts)

-- RunConfig
vim.keymap.set("n", "ed", "<cmd>RunConfig default<CR>")
vim.keymap.set("n", "ee", "<cmd>RerunConfig<CR>")

-- Netrw
keymap("n", "<space>pv", "<cmd>Ex<CR>", opts)

-- Undo
keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- Search in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
