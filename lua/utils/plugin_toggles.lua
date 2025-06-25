-- central config to enable/disable plugins

return {
	cmp = true,
	colorscheme = true,
	conform = true,
	gitsigns = true,
	lspconfig = true,
	mini = true,
	telescope = true,
	todo_comments = true,
	treesitter = true,
	which_key = true,

	-- Kickstart Extras
	autopairs = true,
	indent_line = false,
	lint = true,
	neo_tree = true,
	debug = false,

	-- Custom Plugins
	alpha = false, -- Dashboard
	snacks = {
		indent = true,
	},
	bufferline = false, -- Assuming you have this file
	cellular_automaton = true, -- Example: Disabled
	codecompanion = false, -- AI companion
	colorizer = false, -- Color highlighter
	context = true, -- Code context
	copilot = false, -- Github Copilot
	iconpicker = true, -- Icon picker
	illuminate = true, -- Word highlighting
	lazygit = true, -- Lazygit integration
	markdown_preview = true, -- Markdown preview
	mini_diff = true, -- Inline diff
	multicursor = true, -- Multi-cursor support
	neominimap = false, -- Example: Disabled Minimap (as it's commented out in your file)
	obsidian = false, -- Obsidian integration
	peek = true, -- Markdown preview in floating window
	render_markdown = true, -- Markdown rendering enhancements
	trouble = true, -- Diagnostics list
	typr = true, -- Typing practice
	lualine = false,
}
