-- Icon picker.
return {
	{
		"ziontee113/icon-picker.nvim",
		dependencies = "stevearc/dressing.nvim",
		cmd = "IconPickerNormal",
		opts = { disable_legacy_commands = true },
	},

	require("which-key").add({
		{
			"<leader>hi",
			"<cmd>IconPickerNormal<cr>",
			desc = "[I]con picker",
			icon = { icon = "󰱨 ", color = "blue" },
		},
	}),
}
