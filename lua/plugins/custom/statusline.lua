local style_toggle = "round"

if style_toggle == "round" then
	Style = require("theme.statusline.round_style")
elseif style_toggle == "slant" then
	Style = require("theme.statusline.slant_style")
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Define custom colors
		local colors = require("theme.colors").colors

		-- Build a minimal theme table
		local theme = {
			normal = {
				a = { fg = colors.white, bg = colors.lightest },
				b = { fg = colors.white, bg = colors.light },
				c = { fg = colors.white, bg = colors.my_bg },
				-- c = { fg = colors.white, bg = "none" },
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

		require("lualine").setup({
			options = {
				-- theme = "gruvbox_dark",
				-- theme = "iceberg_dark",
				theme = theme,
				component_separators = Style.component_seperators,
				section_separators = Style.section_separators,
			},

			sections = Style.sections,
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
