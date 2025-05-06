local M = {}

-- pallette
local bg = "#0d1117"
local bg_dark = "#0b0f14"
local bg_dark1 = "#08090c"
local bg_highlight = "#222D3D"
local bg_search = "#ff7b72"
local bg_visual = "#264f78"
local fg = "#e7edf3"
-- local border = "#595959"
local border = bg_dark1

local blue = "#193296"
local red = "#d16969"
local med_grey = "#696969"

M.on_colors = function(colors, transparent)
	--SECTION: backgrounds
	colors.bg = bg
	colors.bg_dark = transparent and colors.none or bg_dark
	colors.bg_float = transparent and colors.none or bg
	colors.bg_highlight = bg_highlight
	colors.bg_popup = bg
	colors.bg_search = bg_search
	colors.bg_sidebar = transparent and colors.none or bg
	colors.bg_visual = bg_visual

	--SECTION: foregrounds
	colors.fg = fg
	colors.fg_float = fg

	--SECTION: ui
	colors.border = border or colors.none
	colors.hint = med_grey
end

M.on_highlights = function(highlights)
	highlights.MiniStatuslineModeNormal = { bg = blue, fg = fg }
	highlights.Keyword = { fg = "#e84525", italic = true }

	highlights["@keyword"] = { link = "Keyword" }
end

return M
