-- [[ Configure and install plugins ]]
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- SECTION: core plugins from kickstart.nvim
	require("plugins.kickstart.core.which-key"),
	require("plugins.kickstart.core.gitsigns"),
	require("plugins.kickstart.core.telescope"),
	require("plugins.kickstart.core.lspconfig"),
	require("plugins.kickstart.core.conform"),
	require("plugins.kickstart.core.cmp"),
	require("plugins.kickstart.core.colorscheme"),
	require("plugins.kickstart.core.todo-comments"),
	require("plugins.kickstart.core.mini"),
	require("plugins.kickstart.core.treesitter"),

	-- SECTION: extra plugins from kickstart.nvim
	require("plugins.kickstart.extras.indent_line"),
	require("plugins.kickstart.extras.lint"),
	require("plugins.kickstart.extras.autopairs"),
	require("plugins.kickstart.extras.neo-tree"),

	-- SECTION: my custom plugins
	{ import = "plugins.custom" },

	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
