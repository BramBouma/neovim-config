local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.snacks.indent then
	return {}
end

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		indent = { priority = 1000, char = "|" },
		scope = {
			priority = 1001,
			enabled = true,
			-- border = "both",
			underline = true,
		},
		chunk = {
			enabled = false,
			char = {
				corner_top = "┌",
				corner_bottom = "└",
				-- corner_top = "╭",
				-- corner_bottom = "╰",
				horizontal = "─",
				vertical = "│",
				arrow = ">",
			},
		},
	},
}
