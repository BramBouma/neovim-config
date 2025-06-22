local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.supermaven then
	return {}
end
return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Tab>",
					clear_suggestion = "<C-j>",
					accept_word = "<C-j>",
				},
				ignore_filetypes = {},
				disable_inline_completion = true, -- set to tru to use with nvim-cmp
			})
		end,
	},
}
