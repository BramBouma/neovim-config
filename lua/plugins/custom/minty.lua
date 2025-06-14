return {
	{
		"nvzone/minty",
		cmd = {
			"Shades",
			"Huefy",
		},
		dependencies = {
			"nvzone/volt",
		},
	},
	{
		require("which-key").add({
			{ "<leader>hc", "<cmd>Shades<cr>", desc = "Minty Shades" },
			{ "<leader>hu", "<cmd>Huefy<cr>", desc = "Minty Huefy" },
		}),
	},
}
