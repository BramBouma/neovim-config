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
local green1 = "#93b5a8"
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
--TODO: this is a test

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
	colors.fg_gutter = fg_dark
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

M.on_highlights = function(highlights, colors)
	--SECTION: indent blankline
	highlights.IblIndent = { fg = fg_dark }
	highlights.IblScope = { fg = util.blend(fg, 0.5, fg_dark) }

	--SECTION: status line
	highlights.MiniStatuslineModeNormal = { bg = true_blue, fg = fg }
	highlights.MiniStatuslineModeInsert = { bg = forest, fg = fg }
	highlights.MiniStatuslineDevinfo = { bg = dark_grey, fg = fg }
	highlights.MiniStatuslineFileinfo = { bg = dark_grey, fg = fg }
	highlights.MiniStatuslineFilename = { bg = util.blend(dark_grey, 0.4, bg), fg = fg }

	--SECTION: ui
	highlights.CursorLineNr = { fg = fg }
	highlights.TreesitterContext = { fg = bg_dark1 }
	highlights.IlluminatedWordRead = { bg = darker_grey, underline = true }
	highlights.IlluminatedWordWrite = { bg = darker_grey, underline = true }
	highlights.IlluminatedWordText = { bg = darker_grey, underline = true }

	--SECTION: language
	highlights.Keyword = { fg = red, italic = false }
	highlights.Conditional = highlights.Keyword
	highlights.Operator = highlights.Keyword
	highlights.Include = highlights.Keyword
	highlights.Repeat = highlights.Keyword
	highlights.Comment = { fg = fg_dark, italic = false }
	highlights.PreProc = highlights.Function

	highlights["@operator"] = { link = "Operator" }
	highlights["@keyword"] = { link = "Keyword" }
	highlights["@keyword.function"] = { link = "Keyword" }
	highlights["@variable.parameter"] = { fg = util.blend(colors.purple, 0.7, fg) }
	highlights["@module"] = { fg = fg }
end

return M
