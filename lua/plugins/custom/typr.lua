return {
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
		config = function()
			require("typr").setup({})
		end,
	},
	require("which-key").add({
		{ "<leader>t", group = "[T]yping", icon = { icon = "󰌌 ", color = "blue" } },
		{ "<leader>tp", "<cmd>Typr<cr>", desc = "[P]ractice", icon = { icon = "󰌌 ", color = "blue" } },
		{ "<leader>ts", "<cmd>TyprStats<cr>", desc = "[S]tats", icon = { icon = "󰉻 ", color = "blue" } },
	}),
}
