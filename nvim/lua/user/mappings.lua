local opts = { noremap = true, silent = true }

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
keymap("n", "<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- One visual line movement
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Format on command
keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)

-- Paste above
keymap("n", "P", "O<ESC>p", opts)

-- Git show changes to file
local gs = package.loaded.gitsigns
keymap("n", "<C-g>h", "<cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_linehl<CR>", opts)
keymap("n", "<C-g>s", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<C-g>j", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<C-g>k", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<C-g>a", "<cmd>Gitsigns diffthis<CR>", opts)
keymap("n", "<C-g>r", "<cmd>Gitsigns reset_hunk<CR>", opts)

-- Comment in visual mode
keymap("x", "<C-_>", "<Plug>Commentary<CR>", opts)
keymap("n", "<C-_>", "<cmd>Commentary<CR>", opts)
keymap("i", "<C-_>", "<cmd>Commentary<CR>", opts)

-- Diagnostics
vim.keymap.set('n', '<C-e>s', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-e>k', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-e>j', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<C-e>l', vim.diagnostic.setloclist, opts)
