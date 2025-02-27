return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("treesitter-context").setup({
			enable = true, -- Enable this plugin
			-- max_lines = 3, -- How many lines to show at max
			max_lines = 0, -- 0 means no max
			trim_scope = "outer", -- Keeps outermost scope only
		})
	end,
}
