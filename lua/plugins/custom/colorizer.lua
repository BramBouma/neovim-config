local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.colorizer then
	return {}
end

return {
	{
		"NvChad/nvim-colorizer.lua", -- Highlight hex and rgb colors within Neovim
		-- event = { "BufReadPre", "BufNewFile" },
		event = "VeryLazy",
		-- cmd = "ColorizerToggle",
		opts = {
			filetypes = {
				"lua",
				"python",
				"css",
				"javascript",
				"json",
			},
		},
	},
	{

		require("which-key").add({
			{
				"<leader>hc",
				"<cmd>ColorizerToggle<cr>",
				desc = "Toggle colorizer",
				icon = { icon = " ", color = "blue" },
			},
		}),
	},
}
