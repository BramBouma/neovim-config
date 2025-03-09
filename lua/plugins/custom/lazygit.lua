-- nvim v0.8.0
return {
	"kdheepak/lazygit.nvim",
	-- lazy = true,
	event = { "BufReadPre", "BufNewFile" },
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

		require("which-key").add({
			{ "<leader>hg", "<cmd>LazyGit<cr>", desc = "Lazy[G]it" },
		})
	end,
}
