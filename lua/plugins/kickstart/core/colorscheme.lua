return {
	-- SECTION: install tokynight and custom override the entire colorscheme lol
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		lazy = true,
		event = "VeryLazy",
		priority = 1000,
		config = function()
			local theme = require("theme.tokyonight")
			local transparent = false

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},

				-- NOTE: override colors based on theme/tokyonight.lua
				on_colors = function(c)
					theme.on_colors(c, transparent)
				end,

				-- NOTE: override highlight groups based on theme/tokyonight.lua
				on_highlights = theme.on_highlights,
			})

			vim.cmd.colorscheme("tokyonight")
			vim.cmd.hi("Search guibg=#ff7b72 guifg=#000000")
		end,
	},

	-- SECTION: install vscode colorscheme as well cuz why not
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function() end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("github-theme").setup({
				-- setup
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("kanagawa").setup({
				-- setup
			})
		end,
	},
}
-- 'rebelot/kanagawa.nvim',
