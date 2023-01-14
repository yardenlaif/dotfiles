local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "hard"
vim.cmd([[highlight Comment term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=#777777]])
