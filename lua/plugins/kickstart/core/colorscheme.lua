return {
	-- SECTION: install tokynight and custom override the entire colorscheme lol
	{
		"folke/tokyonight.nvim",
		lazy = false,
		-- lazy = true,
		event = "VeryLazy",
		priority = 1000,
		config = function()
			local theme = require("theme.tokyonight")
			local transparent = true

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

			local wk = require("which-key")
			wk.add({
				{ "<leader>t", group = "[T]heme", icon = { icon = " ", color = "blue" } },
				{ "<leader>tn", "<cmd>colorscheme tokyonight<CR>", { desc = "set colorscheme to tokyonight" } },
				{ "<leader>ts", "<cmd>Telescope colorscheme<CR>", { desc = "search through colorschemes" } },
			})
			vim.cmd.hi("Search guibg=#ff7b72 guifg=#000000")
			vim.cmd.hi("BufferLineFill guibg=" .. theme.table.table_bg)
		end,
	},
	-- SECTION: extra colorschemes cuz why not
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>tv", "<cmd>colorscheme vscode<CR>", { desc = "set theme to vscode" } },
			})
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("github-theme").setup({
				-- setup
			})

			local wk = require("which-key")
			wk.add({
				{ "<leader>tg", "<cmd>colorscheme github_dark_default<CR>", { desc = "set theme to github dark" } },
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

			local wk = require("which-key")
			wk.add({
				{ "<leader>tk", "<cmd>colorscheme kanagawa-dragon<CR>", { desc = "set theme to kanagawa" } },
			})
		end,
	},
}
-- 'rebelot/kanagawa.nvim',
