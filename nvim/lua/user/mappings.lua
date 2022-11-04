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
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- One visual line movement
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Format on command
keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- Paste above
keymap("n", "P", "O<ESC>p", opts)

-- Git show changes to file
keymap("n", "<leader>g", "<cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_linehl<CR>", opts)
