-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yarden/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yarden/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yarden/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yarden/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yarden/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n”\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\16~/Downloads\6/\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["ccls.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\vconfig\nsetup\tccls\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/ccls.nvim",
    url = "https://github.com/ranjithshegde/ccls.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19user.formatter\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\n9\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\a%x\25gitblame_date_format\6g\bvim\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nP\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\18user.gitsigns\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n!\0\1\3\0\2\0\0049\1\0\0009\2\1\0&\1\2\1L\1\2\0\tname\ticon§\3\1\0\f\1\t\bZ-\0\0\0009\0\0\0B\0\1\0024\1\0\0003\2\1\0006\3\2\0\18\5\0\0B\3\2\4H\6\23€9\b\3\a\b\b\0\0X\b\15€9\b\3\a\b\b\1\0X\b\f€9\b\3\a\b\b\2\0X\b\t€9\b\3\a\b\b\3\0X\b\6€9\b\3\a\b\b\4\0X\b\3€9\b\3\a\t\b\5\0X\b\5€6\b\4\0009\b\5\b\18\n\1\0\18\v\a\0B\b\3\1F\6\3\3R\6ç\1276\3\6\0\18\5\1\0B\3\2\2\v\3\0\0X\3\3€'\3\a\0002\0\0€L\3\2\0\21\3\1\0\t\3\6\0X\3\5€\18\3\2\0\21\5\1\0008\5\5\0012\0\0€D\3\2\0\21\3\1\0\t\3\a\0X\3\r€\18\3\2\0\21\5\1\0\23\5\6\0058\5\5\1B\3\2\2'\4\b\0\18\5\2\0\21\a\1\0008\a\a\1B\5\2\2&\3\5\0032\0\0€L\3\2\0\21\3\1\0)\4\3\0\3\4\3\0X\3\19€\18\3\2\0\21\5\1\0\23\5\a\0058\5\5\1B\3\2\2'\4\b\0\18\5\2\0\21\a\1\0\23\a\6\a8\a\a\1B\5\2\2'\6\b\0\18\a\2\0\21\t\1\0008\t\t\1B\a\2\2&\3\a\0032\0\0€L\3\2\0K\0\1\0\0À\n î‚± \5\tnext\vinsert\ntable\tkind\npairs\0\rget_data\n\f\20\22\24.\2\4Ö\6\1\0\t\0*\0E6\0\0\0'\2\1\0B\0\2\0023\1\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\17\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0=\6\t\0055\6\n\0004\a\0\0=\a\v\0064\a\0\0=\a\f\6=\6\r\0054\6\0\0=\6\14\0055\6\15\0=\6\16\5=\5\18\0045\5\20\0005\6\19\0=\6\21\0054\6\3\0005\a\23\0>\1\1\a9\b\22\0=\b\24\a>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\0045\5#\0004\6\0\0=\6\21\0054\6\0\0=\6\25\0055\6$\0=\6\27\0055\6%\0=\6\29\0054\6\0\0=\6\31\0054\6\0\0=\6!\5=\5&\0044\5\0\0=\5'\0044\5\0\0=\5\f\0044\5\0\0=\5(\0044\5\0\0=\5)\4B\2\2\0012\0\0€K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_b\tcond\1\0\0\17is_available\14lualine_a\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\frefresh\1\0\3\ftabline\3è\a\vwinbar\3è\a\15statusline\3è\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\25always_divide_middle\2\17globalstatus\1\ntheme\fgruvbox\18icons_enabled\2\nsetup\flualine\0\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neotest = {
    config = { "\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessageõ\1\1\0\b\0\16\1\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\14\0004\4\3\0006\5\v\0'\a\r\0B\5\2\0?\5\0\0=\4\15\3B\1\2\1K\0\1\0\radapters\1\0\0\15neotest-go\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\3€€À™\4\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ruser.cmp\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ruser.dap\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\nþ\2\0\0\5\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0005\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\fautocmd\vevents\1\3\0\0\15CursorHold\16CursorHoldI\fpattern\1\2\0\0\6*\1\0\1\fenabled\1\16status_text\1\0\3\fenabled\1\ttext\tðŸ’¡\21text_unavailable\5\17virtual_text\1\0\3\fenabled\1\fhl_mode\freplace\ttext\tðŸ’¡\nfloat\rwin_opts\1\0\2\fenabled\1\ttext\tðŸ’¡\tsign\1\0\2\fenabled\2\rpriority\3\n\vignore\1\0\0\nsetup\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\ruser.lsp\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nê\3\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nicons\1\0\5\14highlight\1\26depth_limit_indicator\a..\16depth_limit\3\3\14separator\n î‚± \16safe_output\2\1\0\26\vString\tï”« \fPackage\tî˜¤ \rConstant\tï£¾ \rVariable\tïš¦ \tFile\tïœ˜ \rFunction\tïž” \14Interface\bï©—\vModule\tî˜¤ \14Namespace\tï – \fBoolean\tâ—© \nArray\tï™© \18TypeParameter\tïžƒ \bKey\tï Š \rOperator\tïš” \tNull\tï³  \nEvent\tïƒ§ \vStruct\tï – \vObject\tï™¨ \15EnumMember\tï… \tEnum\bï©—\16Constructor\tï¥ \nField\tîœ– \rProperty\tîž› \vMethod\tïš¦ \nClass\tï – \vNumber\tï¢Ÿ \nsetup\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n\1\0\0\4\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0'\2\4\0B\0\2\0029\0\5\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\bvim\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20user.treesitter\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n€\6\0\0\5\0\31\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\3=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\19exact_patterns\rpatterns\tyaml\1\2\0\0\23block_mapping_pair\15typescript\1\2\0\0\21export_statement\tjson\1\2\0\0\tpair\velixir\1\t\0\0\23anonymous_function\14arguments\nblock\rdo_block\tlist\bmap\ntuple\19quoted_content\rmarkdown\1\2\0\0\fsection\tvhdl\1\4\0\0\22process_statement\22architecture_body\23entity_declaration\nscala\1\2\0\0\22object_definition\14terraform\1\4\0\0\nblock\16object_elem\14attribute\trust\1\2\0\0\14impl_item\fhaskell\1\2\0\0\badt\btex\1\5\0\0\fchapter\fsection\15subsection\18subsubsection\fdefault\1\0\0\1\f\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\14interface\vstruct\tenum\1\0\6\15trim_scope\nouter\14max_lines\3\0\venable\2\vzindex\3\20\tmode\ftopline\22min_window_height\3\0\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["runconfig.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/runconfig.nvim",
    url = "/home/yarden/projects/runconfig.nvim"
  },
  ["startup.nvim"] = {
    config = { "\27LJ\2\nN\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\17user.startup\nsetup\fstartup\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/startup.nvim",
    url = "https://github.com/startup-nvim/startup.nvim"
  },
  ["stickybuf.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/stickybuf.nvim",
    url = "https://github.com/stevearc/stickybuf.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n‡\1\0\0\3\0\6\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\5\0B\0\2\1K\0\1\0\bfzf\vaerial\fproject\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nN\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\17user.trouble\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14providers\1\0\0\1\4\0\0\blsp\15treesitter\nregex\14configure\15illuminate\frequire\0" },
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/yarden/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ruser.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14providers\1\0\0\1\4\0\0\blsp\15treesitter\nregex\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20user.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\16~/Downloads\6/\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\nþ\2\0\0\5\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0005\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\fautocmd\vevents\1\3\0\0\15CursorHold\16CursorHoldI\fpattern\1\2\0\0\6*\1\0\1\fenabled\1\16status_text\1\0\3\fenabled\1\ttext\tðŸ’¡\21text_unavailable\5\17virtual_text\1\0\3\fenabled\1\fhl_mode\freplace\ttext\tðŸ’¡\nfloat\rwin_opts\1\0\2\fenabled\1\ttext\tðŸ’¡\tsign\1\0\2\fenabled\2\rpriority\3\n\vignore\1\0\0\nsetup\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n€\6\0\0\5\0\31\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\3=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\19exact_patterns\rpatterns\tyaml\1\2\0\0\23block_mapping_pair\15typescript\1\2\0\0\21export_statement\tjson\1\2\0\0\tpair\velixir\1\t\0\0\23anonymous_function\14arguments\nblock\rdo_block\tlist\bmap\ntuple\19quoted_content\rmarkdown\1\2\0\0\fsection\tvhdl\1\4\0\0\22process_statement\22architecture_body\23entity_declaration\nscala\1\2\0\0\22object_definition\14terraform\1\4\0\0\nblock\16object_elem\14attribute\trust\1\2\0\0\14impl_item\fhaskell\1\2\0\0\badt\btex\1\5\0\0\fchapter\fsection\15subsection\18subsubsection\fdefault\1\0\0\1\f\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\14interface\vstruct\tenum\1\0\6\15trim_scope\nouter\14max_lines\3\0\venable\2\vzindex\3\20\tmode\ftopline\22min_window_height\3\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ruser.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19user.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessageõ\1\1\0\b\0\16\1\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\14\0004\4\3\0006\5\v\0'\a\r\0B\5\2\0?\5\0\0=\4\15\3B\1\2\1K\0\1\0\radapters\1\0\0\15neotest-go\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\3€€À™\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: ccls.nvim
time([[Config for ccls.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\vconfig\nsetup\tccls\frequire\0", "config", "ccls.nvim")
time([[Config for ccls.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\17user.trouble\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\nê\3\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nicons\1\0\5\14highlight\1\26depth_limit_indicator\a..\16depth_limit\3\3\14separator\n î‚± \16safe_output\2\1\0\26\vString\tï”« \fPackage\tî˜¤ \rConstant\tï£¾ \rVariable\tïš¦ \tFile\tïœ˜ \rFunction\tïž” \14Interface\bï©—\vModule\tî˜¤ \14Namespace\tï – \fBoolean\tâ—© \nArray\tï™© \18TypeParameter\tïžƒ \bKey\tï Š \rOperator\tïš” \tNull\tï³  \nEvent\tïƒ§ \vStruct\tï – \vObject\tï™¨ \15EnumMember\tï… \tEnum\bï©—\16Constructor\tï¥ \nField\tîœ– \rProperty\tîž› \vMethod\tïš¦ \nClass\tï – \vNumber\tï¢Ÿ \nsetup\15nvim-navic\frequire\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\a%x\25gitblame_date_format\6g\bvim\0", "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\ruser.lsp\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\18user.gitsigns\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: startup.nvim
time([[Config for startup.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0A\0\0\1K\0\1\0\17user.startup\nsetup\fstartup\frequire\0", "config", "startup.nvim")
time([[Config for startup.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n\1\0\0\4\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0'\2\4\0B\0\2\0029\0\5\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\bvim\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\3\0\6\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\5\0B\0\2\1K\0\1\0\bfzf\vaerial\fproject\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n!\0\1\3\0\2\0\0049\1\0\0009\2\1\0&\1\2\1L\1\2\0\tname\ticon§\3\1\0\f\1\t\bZ-\0\0\0009\0\0\0B\0\1\0024\1\0\0003\2\1\0006\3\2\0\18\5\0\0B\3\2\4H\6\23€9\b\3\a\b\b\0\0X\b\15€9\b\3\a\b\b\1\0X\b\f€9\b\3\a\b\b\2\0X\b\t€9\b\3\a\b\b\3\0X\b\6€9\b\3\a\b\b\4\0X\b\3€9\b\3\a\t\b\5\0X\b\5€6\b\4\0009\b\5\b\18\n\1\0\18\v\a\0B\b\3\1F\6\3\3R\6ç\1276\3\6\0\18\5\1\0B\3\2\2\v\3\0\0X\3\3€'\3\a\0002\0\0€L\3\2\0\21\3\1\0\t\3\6\0X\3\5€\18\3\2\0\21\5\1\0008\5\5\0012\0\0€D\3\2\0\21\3\1\0\t\3\a\0X\3\r€\18\3\2\0\21\5\1\0\23\5\6\0058\5\5\1B\3\2\2'\4\b\0\18\5\2\0\21\a\1\0008\a\a\1B\5\2\2&\3\5\0032\0\0€L\3\2\0\21\3\1\0)\4\3\0\3\4\3\0X\3\19€\18\3\2\0\21\5\1\0\23\5\a\0058\5\5\1B\3\2\2'\4\b\0\18\5\2\0\21\a\1\0\23\a\6\a8\a\a\1B\5\2\2'\6\b\0\18\a\2\0\21\t\1\0008\t\t\1B\a\2\2&\3\a\0032\0\0€L\3\2\0K\0\1\0\0À\n î‚± \5\tnext\vinsert\ntable\tkind\npairs\0\rget_data\n\f\20\22\24.\2\4Ö\6\1\0\t\0*\0E6\0\0\0'\2\1\0B\0\2\0023\1\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\17\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0=\6\t\0055\6\n\0004\a\0\0=\a\v\0064\a\0\0=\a\f\6=\6\r\0054\6\0\0=\6\14\0055\6\15\0=\6\16\5=\5\18\0045\5\20\0005\6\19\0=\6\21\0054\6\3\0005\a\23\0>\1\1\a9\b\22\0=\b\24\a>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\0045\5#\0004\6\0\0=\6\21\0054\6\0\0=\6\25\0055\6$\0=\6\27\0055\6%\0=\6\29\0054\6\0\0=\6\31\0054\6\0\0=\6!\5=\5&\0044\5\0\0=\5'\0044\5\0\0=\5\f\0044\5\0\0=\5(\0044\5\0\0=\5)\4B\2\2\0012\0\0€K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_b\tcond\1\0\0\17is_available\14lualine_a\1\0\0\1\2\0\0\rfilename\foptions\1\0\0\frefresh\1\0\3\ftabline\3è\a\vwinbar\3è\a\15statusline\3è\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\25always_divide_middle\2\17globalstatus\1\ntheme\fgruvbox\18icons_enabled\2\nsetup\flualine\0\15nvim-navic\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
