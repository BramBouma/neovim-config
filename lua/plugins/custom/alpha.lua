-- Start dashboard.
return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]
			dashboard.section.header.val = vim.split(header, "\n")
			dashboard.section.header.opts.hl = "AlphaHeader"

			local function dashboard_button(sc, txt, keybind)
				local button = dashboard.button(sc, txt, keybind)
				button.opts.hl_shortcut = "AlphaShortcut"
				button.opts.hl = "AlphaButtons"
				return button
			end
			dashboard.section.buttons.val = {
				dashboard_button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
				dashboard_button("t", "󱏒  View Neo-Tree", "<cmd>Neotree position=float<CR>"),
				dashboard_button("s", "  Search by Grep", "<cmd>Telescope live_grep<cr>"),
				dashboard_button("g", "󰊢  LazyGit", "<cmd>LazyGit<cr>"),
				dashboard_button("l", "  Lazy", "<cmd>Lazy<cr>"),
				dashboard_button("m", "󰒋  Mason", "<cmd>Mason<cr>"),
				dashboard_button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
				dashboard_button("p", "󰌌  Practice typing", "<cmd>Typr<cr>"),
				dashboard_button("q", "  Quit", "<cmd>qa<cr>"),
				{ type = "padding", val = 2 },
			}
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = #dashboard.section.buttons.val

			-- dashboard.section.footer.val = "put down the config bro 👻"
			local plugin_toggles = require("utils.plugin_toggles")
			local ai_enabled = plugin_toggles.copilot or plugin_toggles.codecompanion
			dashboard.section.footer.val = ai_enabled and "AI: Enabled ✅" or "AI: Disabled ❌"

			dashboard.section.footer.opts.hl = "AlphaFooter"

			require("alpha").setup(dashboard.opts)
		end,
	},
}
