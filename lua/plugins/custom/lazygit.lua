local plugin_toggle = require("utils.plugin_toggles")

return {
	{
		"kdheepak/lazygit.nvim",
		enabled = plugin_toggle.lazygit,
		lazy = true,
		-- event = { "VeryLazy" },
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope.nvim",
				tag = "0.1.8",
			},
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
	{
		require("which-key").add({
			{ "<leader>hg", "<cmd>LazyGit<cr>", desc = "Lazy[G]it" },
		}),
	},
}
