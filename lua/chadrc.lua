local M = {
	base46 = {
		theme = { "onedark" },
		transparency = true,
	},
	ui = {
		telescope = { style = "bordered" },
	},
	statusline = {
		-- options: default, vscode, vscode_colored, minimal
		theme = "default",

		-- options: default, round, block, arrow (some only work with default and/or minimal theme only)
		style = "arrow",
	},
}

return M
