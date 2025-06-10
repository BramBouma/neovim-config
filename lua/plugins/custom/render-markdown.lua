return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		-- dependencies = {
		--     'nvim-treesitter/nvim-treesitter',
		--     'echasnovski/mini.nvim'
		-- },

		-- dependencies = {
		--     'nvim-treesitter/nvim-treesitter',
		--     'echasnovski/mini.icons',
		-- },

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		---@module 'render-markdown'
		---@type render.md.UserConfig
		-- opts = {},

		config = function()
			require("render-markdown").setup({
				-- put config opts here

				-- headings
				heading = {},

				-- paragraphs
				paragraph = {},

				-- code blocks
				code = {},

				-- dashed lines
				dash = {},

				-- list bullets
				bullet = {},

				-- checkboxes
				checkbox = {},

				-- block quotes
				quote = {},

				-- tables
				pipe_table = {},

				-- callouts
				callout = {},

				-- links
				link = {},

				-- signs
				sign = {},

				-- indents
				indent = {},
			})

			require("which-key").add({
				{ "<leader>m", group = "[M]arkdown", icon = { icon = " ", color = "blue" } },
				{ "<leader>mt", "<cmd>RenderMarkdown buf_toggle<cr>", icon = { icon = " ", color = "blue" } },
				-- { "<leader>b", group = "[B]uffers", icon = { icon = "󰝒 ", color = "blue"} },
			})
		end,
	},
}
