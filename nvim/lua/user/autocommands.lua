-- Autocommand that reloads neovim whenever you save the autocommands.lua file
vim.cmd([[
augroup nvim_config_save
autocmd!
autocmd BufWritePost /home/yarden/.config/nvim/* source <afile>
augroup end
]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua PackerSync
augroup end
]])
