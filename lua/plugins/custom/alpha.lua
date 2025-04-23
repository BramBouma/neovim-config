-- Start dashboard.
return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			-- SECTION:══════════════════════════════════════
			-- PARAMETER BLOCK
			-- ══════════════════════════════════════════════

			local PADDING_TOP = 3
			local PADDING_BTWN = 2

			local BUTTONS = {
				{ sc = "f", txt = "  Find file", cmd = "<cmd>Telescope find_files<cr>" },
				{ sc = "t", txt = "󱏒  View Neo-Tree", cmd = "<cmd>Neotree position=float<CR>" },
				{ sc = "s", txt = "  Search by Grep", cmd = "<cmd>Telescope live_grep<cr>" },
				{ sc = "g", txt = "󰊢  LazyGit", cmd = "<cmd>LazyGit<cr>" },
				{ sc = "l", txt = "  Lazy", cmd = "<cmd>Lazy<cr>" },
				{ sc = "m", txt = "󰒋  Mason", cmd = "<cmd>Mason<cr>" },
				{ sc = "r", txt = "  Recent files", cmd = "<cmd>Telescope oldfiles<cr>" },
				{ sc = "p", txt = "󰌌  Practice typing", cmd = "<cmd>Typr<cr>" },
				{ sc = "q", txt = "  Quit", cmd = "<cmd>qa<cr>" },
			}

			-- SECTION:══════════════════════════════════════
			-- HEADER BLOCK
			-- ══════════════════════════════════════════════

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

			-- SECTION:══════════════════════════════════════
			-- BUTTONS BLOCK
			-- ══════════════════════════════════════════════

			local function dashboard_button(sc, txt, keybind)
				local button = dashboard.button(sc, txt, keybind)
				button.opts.hl_shortcut = "AlphaShortcut"
				button.opts.hl = "AlphaButtons"
				return button
			end

			local buttons = {}
			for _, b in ipairs(BUTTONS) do
				table.insert(buttons, dashboard_button(b.sc, b.txt, b.cmd))
			end

			-- add footer padding inside buttons
			table.insert(buttons, { type = "padding", val = 2 })

			dashboard.section.buttons.val = buttons
			dashboard.section.buttons.opts.hl = "AlphaButtons"

			-- SECTION:══════════════════════════════════════
			-- FOOTER BLOCK
			-- ══════════════════════════════════════════════

			-- plugin count and startup time
			local stats = require("lazy").stats()
			local plugin_ct = stats and stats.count or 0
			local raw_time = stats.startuptime or 0
			local ms = (type(raw_time) == "string") and (tonumber(raw_time:match("(%d+%.?%d*)")) or 0) or raw_time
			local sec = ms / 1000

			-- clock
			local clock = os.date("%Y-%m-%d %H:%M")

			-- AI status
			local plugin_toggles = require("utils.plugin_toggles")
			local ai_enabled = plugin_toggles.copilot or plugin_toggles.codecompanion
			local ai_status = ai_enabled and "AI: Enabled ✅" or "AI: Disabled ❌"

			dashboard.section.footer.val =
				string.format("  %d plugins loaded in %.2f s   %s     %s", plugin_ct, sec, ai_status, clock)
			dashboard.section.footer.opts.hl = "AlphaFooter"

			-- SECTION:══════════════════════════════════════
			-- LAYOUT & HIGHLIGHTS
			-- ══════════════════════════════════════════════

			dashboard.opts.layout[1].val = PADDING_TOP
			dashboard.opts.layout[3].val = PADDING_BTWN

			-- SECTION:══════════════════════════════════════
			-- SETUP
			-- ══════════════════════════════════════════════

			require("alpha").setup(dashboard.opts)
		end,
	},
}
