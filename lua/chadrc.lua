local M = {
	base46 = {
		theme = "ayu_dark",
		transparency = true,
	},
	ui = {
		telescope = { style = "bordered" },
	},
	-- statusline = {
	-- 	-- options: default, vscode, vscode_colored, minimal
	-- 	theme = "default",
	--
	-- 	-- options: default, round, block, arrow (some only work with default and/or minimal theme only)
	-- 	style = "arrow",
	-- },
	tabufline = {
		lazyload = false,
	},
	nvdash = {
		load_on_startup = true,
		header = {

			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
			"                                                      ",
			"                                                      ",
		},
		buttons = {
			{ txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
			{ txt = "  Recent Files", keys = "r", cmd = "Telescope oldfiles" },
			{ txt = "󰈭  Live Grep", keys = "s", cmd = "Telescope live_grep" },
			{ txt = "󰊢  LazyGit", keys = "g", cmd = "LazyGit" },
			{ txt = "  Lazy", keys = "l", cmd = "Lazy" },
			{ txt = "󰒋  Mason", keys = "m", cmd = "Mason" },
			{ txt = "  Quit", keys = "q", cmd = "qa" },

			{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

			{
				txt = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime) .. " ms"
					return "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
				end,
				hl = "NvDashFooter",
				no_gap = true,
			},

			{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
		},
	},
}

return M
