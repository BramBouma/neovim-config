local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.codecompanion then
	return {}
end

return {
	{
		"olimorris/codecompanion.nvim",
		-- enabled = plugin_toggles.codecompanion,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "markdown", "codecompanion" },
			},
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "gemini",
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
				},
				display = {
					chat = {
						intro_message = "Press ? for options",
						auto_scroll = false,
					},
					action_palette = {
						provider = "telescope",
					},
					diff = {
						provider = "mini_diff",
					},
				},
			})
		end,
	},
	{
		require("which-key").add({
			-- { "<leader>a", group = "[A]I", icon = { icon = "󰚩 ", color = "blue" } },
			{
				"<leader>ap",
				"<cmd>CodeCompanionActions<cr>",
				desc = "action [P]alette",
				icon = { icon = " ", color = "blue" },
				mode = { "n", "v" },
			},
			{
				"<leader>ac",
				"<cmd>CodeCompanionChat Toggle<cr>",
				desc = "toggle [C]hat buffer",
				icon = { icon = " ", color = "blue" },
				mode = { "n", "v" },
			},
			{
				"<leader>aa",
				"<cmd>CodeCompanionChat add<cr>",
				desc = "[A]dd selected chat to the current buffer",
				icon = { icon = " ", color = "blue" },
				mode = { "v" },
			},
		}),
	},
}
