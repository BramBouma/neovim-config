return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		indent = {
			priority = 1,
			enabled = true,
			char = "|",
		},
		scope = {
			enabled = true,
			underline = true,
		},
	},
}
