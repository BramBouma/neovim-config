local diagnostic_icons = require("utils.icons").diagnostic
local plugin_toggles = require("utils.plugin_toggles")

if not plugin_toggles.bufferline then
	return {}
end

return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.bufremove",
	},
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local indicator = (diag.error and diagnostic_icons.Error or "")
						.. (diag.warning and diagnostic_icons.Warning or "")
						.. (diag.info and diagnostic_icons.Info or "")
						.. (diag.hint and diagnostic_icons.Hint or "")
					return vim.trim(indicator)
				end,
				show_buffer_close_icons = false,
				show_close_icon = false,

				-- modified_icon = " ",
				offsets = {
					{
						filetype = "neo-tree",
						text = "neo-tree",
						separator = true,
						text_align = "center",
					},
				},
				separator_style = { "", " " },
				indicator = {
					style = "none",
				},
				style_preset = require("bufferline").style_preset.no_italic,
			},
		})
		require("which-key").add({
			{ "<leader>b", group = "[B]uffers", icon = { icon = "󰝒 ", color = "blue" } },
			{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete current buffer",
			},
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
			-- { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			-- { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
			{ "<leader>bg", "<cmd>BufferLinePick<cr>", desc = "Go to buffer with pick" },
		})
	end,
}
