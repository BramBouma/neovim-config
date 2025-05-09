local M = {}
local util = require("tokyonight.util")

-- pallette
local true_blue = "#193296"
local red_pale = "#d16969"
local true_red = "#e84525"
local red = "#ff7b72"
local med_grey = "#999999"
local dark_grey = "#484f58"
local darker_grey = "#222D3D"
local light_blue = "#58a6ff"
local green = "#58af66"
local green1 = "#73a598"
local forest = "#064023"
local blue1 = "#89aebc"
local orange = "#d29922"


local bg = "#0d1117"
-- local bg = "#19191e"
local bg_dark = "#0b0f14"
local bg_dark1 = "#08090c"
local bg_highlight = darker_grey
local bg_visual = "#264f78"
local fg = "#e6edf3"
local fg_dark = med_grey

local border = bg_dark1

local git_add = util.blend(green, 0.7, fg_dark)
local git_change = util.blend(orange, 0.7, fg_dark)
local git_delete = util.blend(true_red, 0.7, fg_dark)

M.on_colors = function(colors, transparent)
	--SECTION: backgrounds
	colors.bg = bg
	colors.bg_dark = transparent and colors.none or bg_dark
	colors.bg_float = transparent and colors.none or bg
	colors.bg_highlight = bg_highlight
	colors.bg_popup = bg
	colors.bg_sidebar = transparent and colors.none or bg
	colors.bg_visual = bg_visual

	--SECTION: foregrounds
	colors.fg = fg
	colors.fg_float = fg
	colors.fg_dark = fg_dark
	colors.fg_sidebar = fg
	colors.fg_gutter = util.blend(fg_dark, 0.5, bg)
	colors.green1 = green1
	colors.info = blue1

	--SECTION: ui
	colors.border = border or colors.none
	colors.hint = colors.blue

	--SECTION: git
	colors.git.add = git_add
	colors.git.change = git_change
	colors.git.delete = git_delete

end

M.on_highlights = function(H, c)
	--SECTION: indent blankline
	H.IblIndent = { fg = util.blend(fg_dark, 0.5, bg) }
	H.IblScope = { fg = util.blend(fg, 0.5, fg_dark) }

	--SECTION: status line
	H.MiniStatuslineModeNormal = { bg = true_blue, fg = fg }
	H.MiniStatuslineModeInsert = { bg = forest, fg = fg }
	H.MiniStatuslineModeCommand = { bg = true_red, fg = fg }
	H.MiniStatuslineDevinfo = { bg = dark_grey, fg = fg }
	H.MiniStatuslineFileinfo = { bg = dark_grey, fg = fg }
	H.MiniStatuslineFilename = { bg = util.blend(dark_grey, 0.4, bg), fg = fg }

	--SECTION: plugin ui

	-- alpha
	H.AlphaHeader = { fg = fg }
	H.AlphaFooter = { fg = fg }
	H.AlphaButtons = { fg = fg }

	-- telescope
	H.TelescopeBorder = { fg = fg_dark, bg = bg }
	H.TelescopePromptBorder = { fg = true_red, bg = bg }
	H.TelescopePromptTitle = H.TelescopePromptBorder

	-- whichkey
	H.Whichkey = { fg = fg }

	-- bufferline
	H.BufferLineIndicatorSelected = { fg = c.fg_gutter }

	--SECTION: ui
	H.CursorLineNr = { fg = fg }
	H.TreesitterContext = { bg = util.blend(bg_dark1, 0.95, fg) }
	H.IlluminatedWordRead = { bg = darker_grey, underline = true }
	H.IlluminatedWordWrite = { bg = darker_grey, underline = true }
	H.IlluminatedWordText = { bg = darker_grey, underline = true }

	--SECTION: language

	-- keywords & operators
	H.Keyword = { fg = red, italic = false }
	H.Conditional = H.Keyword
	H.Operator = H.Keyword
	H.Include = H.Keyword
	H.Repeat = H.Keyword

	--comments
	H.Comment = { fg = fg_dark, italic = false }

	-- string & constants
	H.String = {fg = c.green }
	H.Character = {fg = c.green }
	H.Constant = {fg = c.orange }
	H["@constant.builtin"] = {fg = c.orange }

	-- numbers & booleans
	H.Number = { fg = c.orange }
	H.Boolean = { fg = c.orange }

	-- functions & methods
	H.Function = { fg = c.blue }
	H.PreProc = H.Function
	H["@function.call"] = { link = "Function" }
	H["@method.call"] = { link = "Function" }

	-- types & constructors
	H.Type = { fg = util.blend(c.purple, 0.7, fg), bold = true }
	H["@constructor"] = { link = "Type" }
	H["@type.builtin"] = { link = "Type" }

	-- variables & parameters
	H.Identifier = { fg = c.fg }
	H["@variable"] = { fg = c.fg }
	H["@variable.parameter"] = { fg = util.blend(c.purple, 0.6, fg) }
	H["@variable.builtin"] = H["@variable.parameter"]

	-- link treesitter groups
	H["@keyword"]           = { link = "Keyword" }
	H["@keyword.function"]  = { link = "Keyword" }
	H["@operator"]          = { link = "Operator" }
	H["@string"]            = { link = "String" }
	H["@number"]            = { link = "Number" }
	H["@boolean"]           = { link = "Boolean" }
	H["@function"]          = { link = "Function" }
	H["@method"]            = { link = "Function" }
	H["@type"]              = { link = "Type" }
	H["@constant"]          = { link = "Constant" }
	H["@variable"]          = { link = "Identifier" }

	H["@lsp.type.variable"] = H["@variable"]
	H["@module"] = { fg = fg }
end

return M
