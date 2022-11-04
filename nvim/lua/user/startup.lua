local function scandir()
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls .')
    for filename in pfile:lines() do
	    i = i + 1
	    t[i] = filename
    end
    pfile:close()
    return t
end

local dirfiles = scandir()
local dirfiles_mapping = {}
local dirfiles_commands = {}

for key, file in pairs(dirfiles) do
	table.insert(dirfiles_mapping, { "[" .. key .. "]" .. " " .. file, "e " .. file, " " })
	dirfiles_commands[tostring(key)] = "<cmd>e " .. file .. "<CR>"
end

local settings = {
	header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
		[[    __  ___                 _                  _____                  __    _          ]],
		[[   /  |/  /___  _________  (_)___  ____ _     / ___/__  ______  _____/ /_  (_)___  ___ ]],
		[[  / /|_/ / __ \/ ___/ __ \/ / __ \/ __ `/     \__ \/ / / / __ \/ ___/ __ \/ / __ \/ _ \]],
		[[ / /  / / /_/ / /  / / / / / / / / /_/ /     ___/ / /_/ / / / (__  ) / / / / / / /  __/]],
		[[/_/  /_/\____/_/  /_/ /_/_/_/ /_/\__, ( )   /____/\__,_/_/ /_/____/_/ /_/_/_/ /_/\___/ ]],
		[[                                /____/|/                                               ]],
	},
	highlight = "Constant",
	default_color = "#F49532",
	oldfiles_amount = 0,
    },
    clock = {
        type = "text",
        content = function()
            local clock = os.date("%H:%M")
            local date = os.date("%A, %d %B %Y")
            return { clock .. "                                                              " .. date }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        highlight = "Constant",
        default_color = "#FFFFFF",
        oldfiles_amount = 0,
    },
    oldfiles = {
	    type = "oldfiles",
	    align = "center",
	    title = "Recents",
	    content = "",
        oldfiles_directory = true,
        oldfiles_amount = 10,
	highlight = "",
    },
    dirfiles = {
        type = "mapping",
        align = "center",
        margin = 0,
	title = "Files",
        content = dirfiles_mapping,
	highlight = "",
    },
    options = {
	after = function()
		require("startup").create_mappings(dirfiles_commands)
	end,
        mapping_keys = true,
        cursor_column = 0.25,
        empty_line_between_mappings = true,
        disable_statuslines = true,
	paddings = { 1, 1, 1, 1 },
    },
    parts = {"clock", "header", "oldfiles", "dirfiles"}, -- all sections in order
}
return settings
