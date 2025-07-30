local colors = require("theme.colors").colors
local component_funcs = require("theme.statusline.component_funcs")
local M = {}

-- M.component_seperators = { left = "", right = "" }
M.component_seperators = ""

-- M.section_separators = { left = "", right = "" }
M.section_separators = ""

M.sections = {
	lualine_a = {
		{
			"mode",
			separator = { left = "", right = "" },
			right_padding = "2",
		},
	},
	lualine_b = {
		{
			"branch",
			separator = { right = "" },
		},
		{
			"diff",
			separator = { right = "" },
		},
		{
			"filename",
			file_status = false,
			path = 1,
			separator = { right = "" },
		},
		{
			"diagnostics",
			source = { "nvim" },
			sections = { "error" },
			diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
			separator = { right = "" },
		},
		{
			"diagnostics",
			source = { "nvim" },
			sections = { "warn" },
			diagnostics_color = { warn = { bg = colors.yellow, fg = colors.white } },
			separator = { right = "" },
		},
		{
			component_funcs.modified,
			color = { bg = colors.red },
			separator = { right = "" },
		},
		{
			"%w",
			cond = function()
				return vim.wo.previewwindow
			end,
		},
		{
			"%r",
			cond = function()
				return vim.bo.readonly
			end,
		},
		{
			"%q",
			cond = function()
				return vim.bo.buftype == "quickfix"
			end,
		},
	},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {
		{
			component_funcs.search_result,
			separator = { left = "" },
		},
		{
			"filetype",
			separator = { left = "" },
		},
		{
			"lsp_status",
			separator = { left = "" },
		},
	},
	lualine_z = {
		{
			"%l:%c",
			separator = { left = "" },
		},
		{
			"%p%%/%L",
			separator = { right = "", left = "" },
		},
	},
}
return M
