local M = {}
local util = require("utils.util")
local fn = vim.fn

local ok, cfg = pcall(function()
	local file = fn.stdpath("config") .. "/lua/theme/color_config.json"
	return vim.fn.json_decode(fn.readfile(file))
end)

local variant = (ok and cfg and cfg.scheme) or "main"
-- local variant = "grey"

-- pallette
local true_blue = "#193296"
-- local red_pale = "#d16969"
local true_red = "#e84525"
local red = "#ff5a4f"
-- local red = "#ff7b72"
local med_grey = "#999999"
local dark_grey = "#484f58"
local darker_grey = "#222D3D"
local light_blue = "#427eff"
local green = "#58af66"
local green1 = "#73a598"
local forest = "#064023"
local blue1 = "#89aebc"
local orange = "#d29922"

local bg_main = "#0d1117"
local bg_alt = "#1d2232"
local bg_grey = "#282c36"

-- local bg = "#19191e"
local bg_main_dark = "#0b0f14"
local bg_alt_dark = "#1b202f"
local bg_grey_dark = util.adjust_lightness(bg_grey, -0.2)

local bg_main_dark1 = "#08090c"
local bg_alt_dark1 = "#181a27"
local bg_grey_dark1 = util.adjust_lightness(bg_grey, -0.4)

local bg_highlight = darker_grey
local bg_visual = "#264f78"
local fg = "#e6edf3"

if variant == "alt" then
	-- BG = bg_alt
	-- BG_DARK = bg_alt_dark
	-- BG_DARK1 = bg_alt_dark1
	BG = bg_grey
	BG_DARK = bg_grey_dark
	BG_DARK1 = bg_grey_dark1
elseif variant == "main" then
	BG = bg_main
	BG_DARK = bg_main_dark
	BG_DARK1 = bg_main_dark1
	-- elseif variant == "grey" then
	-- BG = bg_grey
	-- BG_DARK = bg_grey_dark
	-- BG_DARK1 = bg_grey_dark1
else
	print("No valid colorscheme provided, check color_config.json")
	error("no valid colorscheme provided")
end

local fg_dark = med_grey
local context_border = util.blend(fg_dark, 0.2, BG)

local border = BG_DARK1

local git_add = util.blend(green, 0.7, fg_dark)
local git_change = util.blend(orange, 0.7, fg_dark)
local git_delete = util.blend(true_red, 0.7, fg_dark)

M.on_colors = function(c, transparent)
	--SECTION: backgrounds
	c.bg = BG
	c.bg_dark = transparent and c.none or BG_DARK
	c.bg_dark1 = BG_DARK1
	c.bg_float = transparent and c.none or BG
	c.bg_highlight = bg_highlight
	c.bg_popup = BG
	c.bg_sidebar = transparent and c.none or BG
	c.bg_visual = bg_visual

	--SECTION: foregrounds
	c.fg = fg
	c.fg_float = fg
	c.fg_dark = fg_dark
	c.fg_sidebar = fg
	c.fg_gutter = util.blend(fg_dark, 0.5, BG)
	c.green1 = green1
	c.info = blue1

	--SECTION: ui
	c.border = border or c.none
	c.border_highlight = fg_dark
	c.hint = c.blue

	--SECTION: git
	c.git.add = git_add
	c.git.change = git_change
	c.git.delete = git_delete
end

M.on_highlights = function(H, c)
	--SECTION: indent blankline
	H.IblIndent = { fg = util.blend(fg_dark, 0.5, BG) }
	H.IblScope = { fg = util.blend(fg, 0.5, fg_dark) }

	--SECTION: indent blankline
	H.SnacksIndentScope = { fg = util.blend(fg, 0.5, BG), underline = false }
	H.SnacksIndentScopeUnderLine = { fg = util.blend(fg, 0.5, BG), underline = true, sp = fg }
	H.SnacksIndent = { fg = util.blend(fg_dark, 0.3, BG) }

	--SECTION: status line
	H.MiniStatuslineModeNormal = { bg = true_blue, fg = fg }
	H.MiniStatuslineModeInsert = { bg = forest, fg = fg }
	H.MiniStatuslineModeCommand = { bg = true_red, fg = fg }
	H.MiniStatuslineDevinfo = { bg = dark_grey, fg = fg }
	H.MiniStatuslineFileinfo = { bg = dark_grey, fg = fg }
	H.MiniStatuslineFilename = { bg = util.blend(dark_grey, 0.4, BG), fg = fg }

	--SECTION: ufo / folded visuals
	local folded_bg = util.blend(c.fg_dark, 0.18, c.bg) -- tweak 0.18 to taste
	H.Folded = { bg = folded_bg, fg = c.fg_dark }
	H.UfoFoldedBg = { bg = folded_bg } -- overrides default link to Folded.bg
	H.UfoFoldedFg = { fg = c.fg } -- keep text legible
	H.UfoFoldedEllipsis = { fg = c.fg_dark } -- used if you *don’t* set a custom handler
	H.UfoCursorFoldedLine = { bg = util.adjust_lightness(folded_bg, 0.06) }

	--SECTION: plugin ui

	-- alpha
	H.AlphaHeader = { fg = fg }
	H.AlphaFooter = { fg = fg }
	H.AlphaButtons = { fg = fg }

	-- telescope
	H.TelescopeBorder = { fg = fg_dark, bg = BG }
	H.TelescopePromptBorder = { fg = true_red, bg = BG }
	H.TelescopePromptTitle = H.TelescopePromptBorder

	-- whichkey
	H.Whichkey = { fg = fg }

	-- bufferline
	H.BufferLineIndicatorSelected = { fg = c.fg_gutter }

	-- diff
	H.DiffAdd = { bg = util.blend(git_add, 0.25, BG) }
	H.DiffChange = { bg = util.blend(git_change, 0.25, BG) }
	H.DiffDelete = { bg = util.blend(git_delete, 0.25, BG) }

	--SECTION: ui
	H.CursorLineNr = { fg = fg }
	H.TreesitterContext = { bg = BG }
	H.IlluminatedWordRead = { bg = util.blend("#405168", 0.8, BG), underline = true }
	H.IlluminatedWordWrite = { bg = util.blend("#405168", 0.8, BG), underline = true }
	H.IlluminatedWordText = { bg = util.blend("#405168", 0.8, BG), underline = true }
	H.LspInlayHint = { bg = BG, fg = "#545c7e" }
	H.CursorLine = { bg = util.adjust_lightness(BG, 0.1) }

	--SECTION: language

	-- keywords & operators
	H.Keyword = { fg = red, italic = false }
	H.Conditional = H.Keyword
	H.Operator = H.Keyword
	H.Include = H.Keyword
	H.Repeat = H.Keyword
	H.Special = { fg = util.blend(c.purple, 0.75, fg) }

	--comments
	-- H.Comment = { fg = fg_dark, italic = false }
	H.Comment = { fg = util.blend("#545c7e", 0.5, fg_dark), italic = false }

	-- string & constants
	-- H.String = { fg = util.blend(light_blue, 0.6, fg) }
	H.String = { fg = util.blend(green, 0.6, fg) }
	H.Character = { fg = light_blue }
	H.Constant = { fg = c.orange }
	H["@constant.builtin"] = { fg = c.orange }

	-- numbers & booleans
	H.Number = { fg = c.orange }
	H.Boolean = { fg = c.orange }

	-- functions & methods
	H.Function = { fg = c.blue }
	H.PreProc = H.Function
	H["@function.call"] = { link = "Function" }
	H["@method.call"] = { link = "Function" }

	-- types & constructors
	-- H.Type = { fg = util.blend(c.purple, 0.7, fg), bold = true }
	H.Type = { fg = c.orange }
	H["@constructor"] = { link = "Type" }
	H["@type.builtin"] = { link = "Type" }

	-- variables & parameters
	H.Identifier = { fg = c.fg }
	H["@variable"] = { fg = c.fg }
	H["@variable.parameter"] = { fg = util.blend(c.purple, 0.75, fg) }
	H["@variable.builtin"] = H["@variable.parameter"]

	-- link treesitter groups
	H["@keyword"] = { link = "Keyword" }
	H["@keyword.function"] = { link = "Keyword" }
	H["@operator"] = { link = "Operator" }
	H["@string"] = { link = "String" }
	H["@number"] = { link = "Number" }
	H["@boolean"] = { link = "Boolean" }
	H["@function"] = { link = "Function" }
	H["@method"] = { link = "Function" }
	H["@type"] = { link = "Type" }
	H["@constant"] = { link = "Constant" }
	H["@variable"] = { link = "Identifier" }

	H["@lsp.type.variable"] = H["@variable"]
	H["@module"] = { fg = fg }
end

M.table = {
	table_bg = BG,
	table_context_border = context_border,
}

return M
