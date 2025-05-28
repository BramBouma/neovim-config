return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signcolumn = true,
			numhl = true,
			linehl = false,
			word_diff = false,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 50,
			},
		},
	},
}
