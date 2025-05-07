local M = {}
local util = require("tokyonight.util")

-- pallette
local blue = "#193296"
local red_pale = "#d16969"
local true_red = "#e84525"
local red = "#ff7b72"
local med_grey = "#808080"
local dark_grey = "#484f58"
local darker_grey = "#222D3D"
local light_blue = "#58a6ff"
local green = "#58af66"
local orange = "#d29922"

local bg = "#0d1117"
local bg_dark = "#0b0f14"
local bg_dark1 = "#08090c"
local bg_highlight = darker_grey
local bg_visual = "#264f78"
local fg = "#e6edf3"
local fg_dark = dark_grey

local border = bg_dark1

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
	colors.fg_gutter = fg_dark

	--SECTION: ui
	colors.border = border or colors.none
	colors.hint = light_blue
end

M.on_highlights = function(highlights)
	--SECTION: indent blankline
	highlights.IblIndent = { fg = fg_dark }
	highlights.IblScope = { fg = util.blend(fg, 0.4, fg_dark) }

	--SECTION: status line
	highlights.MiniStatuslineModeNormal = { bg = blue, fg = fg }

	highlights.MiniStatuslineDevinfo = { bg = dark_grey, fg = fg }
	highlights.MiniStatuslineFileinfo = { bg = dark_grey, fg = fg }
	highlights.MiniStatuslineFilename = { bg = util.blend(dark_grey, 0.4, bg), fg = fg }

	--SECTION: ui
	-- highlights.LineNr = { fg = fg_dark }
	-- highlights.LineNrAbove = { fg = fg_dark }
	-- highlights.LineNrBelow = { fg = fg_dark }
	highlights.CursorLineNr = { fg = fg }
	highlights.TreesitterContext = { fg = bg_dark1 }
	highlights.IlluminatedWordRead = { bg = darker_grey, underline = true }
	highlights.IlluminatedWordWrite = { bg = darker_grey, underline = true }
	highlights.IlluminatedWordText = { bg = darker_grey, underline = true }

	--SECTION: git
	highlights.GitGutterAdd = { fg = util.blend(green, 0.6, fg_dark) }
	highlights.GitSignsAdd = { fg = util.blend(green, 0.6, fg_dark) }
	highlights.GitGutterAddLineNr = { fg = util.blend(green, 0.6, fg_dark) }

	highlights.GitGutterChange = { fg = util.blend(orange, 0.6, fg_dark) }
	highlights.GitSignsChange = { fg = util.blend(orange, 0.6, fg_dark) }
	highlights.GitGutterChangeLineNr = { fg = util.blend(orange, 0.6, fg_dark) }

	highlights.GitGutterDelete = { fg = util.blend(true_red, 0.6, fg_dark) }
	highlights.GitSignsDelete = { fg = util.blend(true_red, 0.6, fg_dark) }
	highlights.GitGutterDeleteLineNr = { fg = util.blend(true_red, 0.6, fg_dark) }

	--SECTION: language
	highlights.Keyword = { fg = red, italic = true }
	highlights.Conditional = { fg = red, italic = true }
	highlights.Operator = { fg = red }

	highlights["@operator"] = { link = "Operator" }
	highlights["@keyword"] = { link = "Keyword" }
	highlights["@keyword.function"] = { link = "Keyword" }
end

return M
