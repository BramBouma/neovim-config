local vault_path = vim.fn.expand("~") .. "\\OneDrive\\Desktop\\my_files\\vaults\\"
local plugin_toggles = require("utils.plugin_toggles")

return {
	"epwalsh/obsidian.nvim",
	enabled = plugin_toggles.obsidian,
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		"BufReadPre ", -- .. vault_path,
		"BufNewFile ", -- .. vault_path,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		{
			"vim-telescope/telescope.nvim",
			tag = "0.1.8",
		},
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("obsidian").setup({

			workspaces = {
				{
					name = "short_notes",
					path = vault_path .. "main/notes",
					-- override certain settings
					overrides = {},
				},
				{
					name = "thoughts",
					path = vault_path .. "main/thoughts",
					-- override certain settings
					overrides = {},
				},
			},

			-- if you keep notes in a specific subdirectory of your vault
			-- notes_subdir = "notes",

			daily_notes = {
				folder = "dailies",
				default_tags = { "daily_notes" },
				template = nil,
			},

			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},

			mappings = {
				-- smart action depending on context, either follow link or toggle checkbox
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			-- Optional, customize how note IDs are generated given an optional title.
			---@param title string|?
			---@return string
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			-- wiki_link_func = "use_alias_only",
			-- markdown_link_func = "use_alias_only",
			-- preferred_link_style = "wiki"

			-- 'true' indicates that you don't want obsidian.nvim to manage frontmatter
			-- disable_frontmatter = false,

			templates = {
				folder = "config/templates",
				date_format = "%m-%d-%Y",
				substitutions = {},
			},
			-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
			-- URL it will be ignored but you can customize this behavior here.
			---@param url string
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				-- vim.fn.jobstart({"open", url})  -- Mac OS
				-- vim.fn.jobstart({"xdg-open", url})  -- linux
				-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
				vim.ui.open(url) -- need Neovim 0.10.0+
			end,

			-- set to true to force ':ObsidianOpen' to bring the app to the foreground
			open_app_foreground = false,

			picker = {
				-- set preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'
				name = "telescope.nvim",
				-- configure key mappings for the picker
				note_mappings = {
					-- create a new note from your query
					new = "<C-x>",
					-- Insert a link to the selected note
					instert_link = "<C-l>",
				},
				tag_mappings = {
					-- add tag(s) to current note
					tag_note = "<C-x>",
					-- insert a tag at the current location
					insert_tag = "<C-L>",
				},
			},

			-- sort search results by "path", "modified", "accesse", or "created"
			sort_by = "modified",
			sort_reversed = true,

			-- how certain commands open notes ("current", "vsplit", "hsplit")
			open_notes_in = "current",

			-- Optional, define your own callbacks to further customize behavior.
			callbacks = {
				-- Runs at the end of `require("obsidian").setup()`.
				---@param client obsidian.Client
				post_setup = function(client) end,

				-- Runs anytime you enter the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				enter_note = function(client, note) end,

				-- Runs anytime you leave the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				leave_note = function(client, note) end,

				-- Runs right before writing the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				pre_write_note = function(client, note) end,

				-- Runs anytime the workspace is set/changed.
				---@param client obsidian.Client
				---@param workspace obsidian.Workspace
				post_set_workspace = function(client, workspace) end,
			},

			-- Optional, configure additional syntax highlighting / extmarks.
			-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
			ui = {
				enable = true, -- set to false to disable all additional syntax features
				update_debounce = 200, -- update delay after a text change (in milliseconds)
				max_file_length = 5000, -- disable UI features for files with more than this many lines
				-- Define how various check-boxes are displayed
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					["!"] = { char = "", hl_group = "ObsidianImportant" },

					-- You can also add more custom ones...
				},
				-- Use bullet marks for non-checkbox lists.
				bullets = { char = "•", hl_group = "ObsidianBullet" },
				external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				reference_text = { hl_group = "ObsidianRefText" },
				highlight_text = { hl_group = "ObsidianHighlightText" },
				tags = { hl_group = "ObsidianTag" },
				block_ids = { hl_group = "ObsidianBlockID" },
				hl_groups = {
					-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianImportant = { bold = true, fg = "#d73128" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},
		})

		-- set conceallevel to 1 for Markdown files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt.conceallevel = 1
			end,
		})

		-- which-key mappings for various obsidian funcs
		-- require('which-key').add({
		--   { "<leader>o", group = "[O]bsidian" },
		--   { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
		--   { "<leader>bd",
		--   function()
		--       require('mini.bufremove').delete(0, true)
		--   end,
		--   desc = "Delete current buffer" },
		--   { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
		--   { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		--   { "<leader>bo", "<cmd>BufferLinePick<cr>", desc = "Select a buffer to open" },
		--   { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
		--   { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
		-- })
	end,
}
