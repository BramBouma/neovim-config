local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.indent_line then
	return {}
end

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		-- See `:help ibl`
		main = "ibl",
		opts = {
			indent = { char = "|" },
			scope = {
				show_start = true,
				show_end = true,
			},
		},
	},
}
