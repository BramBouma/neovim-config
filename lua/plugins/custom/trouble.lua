local icons = require("utils.icons").diagnostic

-- Pretty list for diagnostics, references, etc.
return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle" },
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			signs = {
				error = icons.Error,
				warning = icons.Warn,
				hint = icons.Hint,
				information = icons.Info,
			},
			auto_close = true, -- auto close when there are no items
			auto_open = false, -- auto open when there are items
			focus = false, -- focus window when opened
			open_no_results = false, -- open the trouble window when there are no results
			win_config = { border = "rounded" },
		},
		keys = {
			-- open workspace diagnostics with focus
			{
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "[W]orspace diagnostics",
			},
			-- open buffer/document diagnostics with focus
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
				desc = "[D]ocument diagnostics",
			},
			-- open quickfix list with focus
			{
				"<leader>xq",
				"<cmd>Trouble quickfix toggle focus=true<cr>",
				desc = "[Q]uickfix list",
			},
			-- open symbol list without focus on the right
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle win.position=right<cr>",
				desc = "[S]ymbols",
			},
			-- open LSP defs/refs/etc. without focus on the right
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle win.position=right<cr>",
				desc = "[L]SP",
			},
			-- open location list without focus on the right
			{
				"<leader>xo",
				"<cmd>Trouble loclist toggle win.position=right<cr>",
				desc = "L[o]cation list",
			},
		},
	},
	require("which-key").add({
		{ "<leader>x", group = "Trouble", icon = { cat = "filetype", name = "trouble", color = "blue" } },
	}),
}
