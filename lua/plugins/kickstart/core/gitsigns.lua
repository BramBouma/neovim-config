-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--

-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signcolumn = true,
			numhl = true,
			linehl = false,
			word_diff = false,
		},
	},
	-- {
	-- require('which-key').add({
	-- 		{ "<leader>g", group = "[G]it diff", icon = { icon = " ", color = "blue" } },
	-- 		{
	-- 			"<leader>gl",
	-- 			"<cmd>Gitsigns toggle_linehl<cr>",
	-- 			desc = "toggle [L]ine highlight",
	-- 			icon = { icon = " ", color = "blue" },
	-- 			mode = { "n", "v" },
	-- 		},
	-- 		{
	-- 			"<leader>gw",
	-- 			"<cmd>Gitsigns toggle_word_diff<cr>",
	-- 			desc = "toggle [W]ord diff",
	-- 			icon = { icon = " ", color = "blue" },
	-- 			mode = { "n", "v" },
	-- 		},
	-- 		{
	-- 			"<leader>gn",
	-- 			"<cmd>Gitsigns toggle_numhl<cr>",
	-- 			desc = "toggle [N]umber highlight",
	-- 			icon = { icon = " ", color = "blue" },
	-- 			mode = { "n", "v" },
	-- 		},
	-- })
	-- },
}
