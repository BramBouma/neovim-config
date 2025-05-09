local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.indent_line then
	return {}
end

return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
		event = "VeryLazy",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
}
