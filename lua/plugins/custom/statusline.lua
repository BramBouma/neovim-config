local util = require("utils.util")
local style_toggle = "round"

if style_toggle == "round" then
	return {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Define custom colors
			local colors = {
				my_bg = "#282c36",
				red = "#451002",
				lightest = "#727e9b",
				light = "#444b5c",
				dark = "#1a1d24",
				grey = "#353a44",
				black = "#383a42",
				white = "#f3f3f3",
				light_green = "#83a598",
				orange = "#fe8019",
				yellow = "#a87325",
				green = "#07562e",
				blue = "#090a57",
				light_blue = "#81a1c1",
			}
			-- Build a minimal theme table
			local theme = {
				normal = {
					a = { fg = colors.white, bg = colors.lightest },
					b = { fg = colors.white, bg = colors.light },
					-- c = { fg = colors.white, bg = colors.dark },
					c = { fg = colors.white, bg = "none" },
					z = { fg = colors.white, bg = colors.lightest },
				},
				insert = { a = { fg = colors.white, bg = colors.green } },
				visual = { a = { fg = colors.white, bg = colors.blue } },
				replace = { a = { fg = colors.white, bg = colors.green } },
				command = { a = { fg = colors.white, bg = colors.red } },
			}

			-- Empty component for padding
			local empty = require("lualine.component"):extend()
			function empty:draw(default_highlight)
				self.status = ""
				self.applied_separator = ""
				self:apply_highlights(default_highlight)
				self:apply_section_separators()
				return self.status
			end

			-- Insert spacer between components
			local function process_sections(sections)
				for name, section in pairs(sections) do
					local left = name:sub(9, 10) < "x"
					local count = (name == "lualine_z") and (#section - 1) or #section
					for pos = 1, count do
						table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
					end
					for _, comp in ipairs(section) do
						if type(comp) ~= "table" then
							comp = { comp }
						end
						comp.separator = left and { right = "" } or { left = "" }
					end
				end
				return sections
			end

			-- Show search count when hlsearch is on
			local function search_result()
				if vim.v.hlsearch == 0 then
					return ""
				end
				local last = vim.fn.getreg("/")
				if last == "" then
					return ""
				end
				local sc = vim.fn.searchcount({ maxcount = 9999 })
				return last .. "(" .. sc.current .. "/" .. sc.total .. ")"
			end

			-- Modified/signifier component
			local function modified()
				if vim.bo.modified then
					return "+"
				elseif not vim.bo.modifiable or vim.bo.readonly then
					return "-"
				end
				return ""
			end

			-- Final lualine setup
			require("lualine").setup({
				options = {
					-- theme = "gruvbox_dark",
					-- theme = "iceberg_dark",
					theme = theme,
					component_separators = "",
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},

				sections = {
					lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = "2" } },
					lualine_b = {
						{ "branch", separator = { right = "" } },
						{ "diff", separator = { right = "" } },
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
							modified,
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
						{ search_result, separator = { left = "" } },
						{ "filetype", separator = { left = "" } },
						{ "lsp_status", separator = { left = "" } },
					},
					lualine_z = {
						{ "%l:%c", separator = { left = "" } },
						{ "%p%%/%L", separator = { right = "", left = "" } },
					},
				},
				-- sections = process_sections({
				-- 	lualine_a = { { "mode", separator = { left = "" }, right_padding = "2" } },
				-- 	lualine_b = {
				-- 		"branch",
				-- 		"diff",
				-- 		{
				-- 			"diagnostics",
				-- 			source = { "nvim" },
				-- 			sections = { "error" },
				-- 			diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
				-- 		},
				-- 		{
				-- 			"diagnostics",
				-- 			source = { "nvim" },
				-- 			sections = { "warn" },
				-- 			diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
				-- 		},
				-- 		{ "filename", file_status = false, path = 1 },
				-- 		{ modified, color = { bg = colors.red } },
				-- 		{
				-- 			"%w",
				-- 			cond = function()
				-- 				return vim.wo.previewwindow
				-- 			end,
				-- 		},
				-- 		{
				-- 			"%r",
				-- 			cond = function()
				-- 				return vim.bo.readonly
				-- 			end,
				-- 		},
				-- 		{
				-- 			"%q",
				-- 			cond = function()
				-- 				return vim.bo.buftype == "quickfix"
				-- 			end,
				-- 		},
				-- 	},
				-- 	lualine_c = {},
				-- 	lualine_x = {},
				-- 	lualine_y = { search_result, "filetype" },
				-- 	lualine_z = { "%l:%c", "%p%%/%L" },
				-- }),
				inactive_sections = {
					lualine_c = { "%f %y %m" },
					lualine_x = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	}
elseif style_toggle == "slant" then
	return {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Define custom colors
			local colors = {
				my_bg = "#282c36",
				red = "#451002",
				lightest = "#727e9b",
				light = "#444b5c",
				dark = "#1a1d24",
				grey = "#353a44",
				black = "#383a42",
				white = "#f3f3f3",
				light_green = "#83a598",
				orange = "#fe8019",
				yellow = "#a87325",
				green = "#07562e",
				blue = "#090a57",
				light_blue = "#81a1c1",
			}
			-- Build a minimal theme table
			local theme = {
				normal = {
					a = { fg = colors.white, bg = colors.lightest },
					b = { fg = colors.white, bg = colors.light },
					-- c = { fg = colors.white, bg = colors.dark },
					c = { fg = colors.white, bg = "none" },
					z = { fg = colors.white, bg = colors.lightest },
				},
				insert = { a = { fg = colors.white, bg = colors.green } },
				visual = { a = { fg = colors.white, bg = colors.blue } },
				replace = { a = { fg = colors.white, bg = colors.green } },
				command = { a = { fg = colors.white, bg = colors.red } },
			}

			-- Empty component for padding
			local empty = require("lualine.component"):extend()
			function empty:draw(default_highlight)
				self.status = ""
				self.applied_separator = ""
				self:apply_highlights(default_highlight)
				self:apply_section_separators()
				return self.status
			end

			-- Insert spacer between components
			local function process_sections(sections)
				for name, section in pairs(sections) do
					local left = name:sub(9, 10) < "x"
					local count = (name == "lualine_z") and (#section - 1) or #section
					for pos = 1, count do
						table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
					end
					for _, comp in ipairs(section) do
						if type(comp) ~= "table" then
							comp = { comp }
						end
						comp.separator = left and { right = "" } or { left = "" }
					end
				end
				return sections
			end

			-- Show search count when hlsearch is on
			local function search_result()
				if vim.v.hlsearch == 0 then
					return ""
				end
				local last = vim.fn.getreg("/")
				if last == "" then
					return ""
				end
				local sc = vim.fn.searchcount({ maxcount = 9999 })
				return last .. "(" .. sc.current .. "/" .. sc.total .. ")"
			end

			-- Modified/signifier component
			local function modified()
				if vim.bo.modified then
					return "+"
				elseif not vim.bo.modifiable or vim.bo.readonly then
					return "-"
				end
				return ""
			end

			-- Final lualine setup
			require("lualine").setup({
				options = {
					-- theme = "gruvbox_dark",
					-- theme = "iceberg_dark",
					theme = theme,
					component_separators = "",
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},

				sections = {
					lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = "2" } },
					lualine_b = {
						{ "branch", separator = { right = "" } },
						{ "diff", separator = { right = "" } },
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
							modified,
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
					lualine_y = { search_result, "filetype", "lsp_status" },
					lualine_z = {
						"%l:%c",
						{ "%p%%/%L", separator = { right = "" } },
					},
				},
				-- sections = process_sections({
				-- 	lualine_a = { { "mode", separator = { left = "" }, right_padding = "2" } },
				-- 	lualine_b = {
				-- 		"branch",
				-- 		"diff",
				-- 		{
				-- 			"diagnostics",
				-- 			source = { "nvim" },
				-- 			sections = { "error" },
				-- 			diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
				-- 		},
				-- 		{
				-- 			"diagnostics",
				-- 			source = { "nvim" },
				-- 			sections = { "warn" },
				-- 			diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
				-- 		},
				-- 		{ "filename", file_status = false, path = 1 },
				-- 		{ modified, color = { bg = colors.red } },
				-- 		{
				-- 			"%w",
				-- 			cond = function()
				-- 				return vim.wo.previewwindow
				-- 			end,
				-- 		},
				-- 		{
				-- 			"%r",
				-- 			cond = function()
				-- 				return vim.bo.readonly
				-- 			end,
				-- 		},
				-- 		{
				-- 			"%q",
				-- 			cond = function()
				-- 				return vim.bo.buftype == "quickfix"
				-- 			end,
				-- 		},
				-- 	},
				-- 	lualine_c = {},
				-- 	lualine_x = {},
				-- 	lualine_y = { search_result, "filetype" },
				-- 	lualine_z = { "%l:%c", "%p%%/%L" },
				-- }),
				inactive_sections = {
					lualine_c = { "%f %y %m" },
					lualine_x = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	}
end
