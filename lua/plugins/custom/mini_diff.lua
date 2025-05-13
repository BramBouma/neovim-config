return {
	{
		"echasnovski/mini.diff", -- Inline and better diff over the default
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Disabled by default
				-- source = diff.gen_source.save(),
			})

			local diff_icon = { icon = " ", color = "blue" }
			require("which-key").add({
				{ "<leader>d", group = "[D]iff", icon = diff_icon },
				{ "<leader>dt", "<cmd>lua MiniDiff.toggle()<cr>", desc = "[T]oggle diff", icon = diff_icon },
				{ "<leader>do", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "toggle [O]verlay", icon = diff_icon },
			})
		end,
	},
}
