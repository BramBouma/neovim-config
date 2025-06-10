return {
	"RRethy/vim-illuminate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			delay = 100, -- Delay before highlighting
			under_cursor = true,
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
		})

		-- Uniform styling (enabled by default)
		-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836", underline = true }) -- Neutral gray
		-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836", underline = true }) -- Same as Text
		-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836", underline = true }) -- Same as Text

		-- Differentiated styling (commented out)
		-- Uncomment the section below to enable differentiated styling:
		-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#3c3836', underline = true })  -- Neutral gray
		-- vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = '#2d4f67', underline = true }) -- Light blue
		-- vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = '#665c54', underline = true }) -- Warm brown

		-- Navigation keymaps
		-- vim.keymap.set('n', '<C-n>', function()
		--     require('illuminate').goto_next_reference()
		-- end, { desc = 'go to next occurrence' })
		--
		-- vim.keymap.set('n', '<C-p>', function()
		--     require('illuminate').goto_prev_reference()
		-- end, { desc = 'go to prev occurrence' })
		--
	end,
}
