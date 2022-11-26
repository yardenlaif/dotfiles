-- Surround
function Surround_with(start_surround, end_surround)
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")
	local start_column = vstart[3] - 1
	local start_line = vstart[2]
	local end_column = vend[3] - 1
	local end_line = vend[2]

	-- Skip whitespaces at the start of lines
	if start_column == 0 then
		vim.api.nvim_win_set_cursor(0, { start_line, start_column })
		local char = vim.api.nvim_get_current_line():sub(start_column + 1, start_column + 1)
		while char == " " or char == "\t" do
			start_column = start_column + 1
			char = vim.api.nvim_get_current_line():sub(start_column + 1, start_column + 1)
		end
	end

	vim.api.nvim_win_set_cursor(0, { end_line, end_column })
	vim.api.nvim_put({ end_surround }, "c", true, true)
	vim.api.nvim_win_set_cursor(0, { start_line, start_column })
	vim.api.nvim_put({ start_surround }, "c", false, true)
end

function Surround_with_input()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")
	local start_column = vstart[3] - 1
	local start_line = vstart[2]
	local end_column = vend[3]
	local end_line = vend[2]

	-- Skip whitespaces at the start of lines
	if start_column == 0 then
		vim.api.nvim_win_set_cursor(0, { start_line, start_column })
		local char = vim.api.nvim_get_current_line():sub(start_column + 1, start_column + 1)
		while char == " " or char == "\t" do
			start_column = start_column + 1
			char = vim.api.nvim_get_current_line():sub(start_column + 1, start_column + 1)
		end
	end

	local start_input = ""
	local end_input = ""
	local char = vim.call("getchar")
	while char ~= 27 do
		local asciichar = vim.call("nr2char", char)
		if string.len(start_input) == 0 and asciichar == '<' then
			end_input = "</"
		else
			end_input = end_input .. asciichar
		end
		start_input = start_input .. asciichar
		char = vim.call("getchar")
	end

	Surround_with(start_input, end_input)
end

vim.keymap.set('v', '(', ":lua Surround_with('(', ')')<CR>", opts)
vim.keymap.set('x', ')', ":lua Surround_with('( ', ' )')<CR>", opts)
vim.keymap.set('x', '[', ":lua Surround_with('[', ']')<CR>", opts)
vim.keymap.set('x', ']', ":lua Surround_with('[ ', ' ]')<CR>", opts)
vim.keymap.set('x', '"', ":lua Surround_with('\"', '\"')<CR>", opts)
vim.keymap.set('x', '\'', ":lua Surround_with('\'', '\'')<CR>", opts)
vim.keymap.set('x', '{', ":lua Surround_with('{', '}')<CR>", opts)
vim.keymap.set('x', '}', ":lua Surround_with('{ ', ' }')<CR>", opts)
vim.keymap.set('x', '<', ":lua Surround_with('<', '>')<CR>", opts)
vim.keymap.set('x', '>', ":lua Surround_with('< ', ' >')<CR>", opts)
vim.keymap.set('x', 'S', ":lua Surround_with_input()<CR>", opts)
