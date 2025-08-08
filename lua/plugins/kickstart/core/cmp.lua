return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local copilot_cmp = require("copilot_cmp")

			luasnip.config.setup({})

			copilot_cmp.setup({
				method = "getCompletionsCycling",
				fix_pairs = true,
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- experimental ghost-text and formatting
				experimental = {
					ghost_text = true,
				},
				formatting = {
					-- configure hoe completion items are presented
					-- see ':help cmp-config.formatting'
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",

						-- define how source names are displayed
						-- shows source name before item like '[LSP] func'
						before = function(entry, vim_item)
							-- get the source name
							local source_name = entry.source.name
							-- custom short names for sources
							local source_map = {
								nvim_lsp = "LSP",
								luasnip = "Snippet",
								-- buffer = "Buffer",
								path = "Path",
								cmdline = "CMD",
								codecompanion = "Companion",
								lazydev = "LazyDev",
								copilot = "Copilot",
								supermaven = "Supermaven",
							}
							vim_item.menu = "[" .. (source_map[source_name] or source_name) .. "]"
							-- Optional: Add extra highlighting for Copilot suggestions
							if entry.source.name == "copilot" then
								vim_item.kind = " " .. vim_item.kind -- Add GitHub icon (requires nerd font)
							end
							return vim_item
						end,
					}),
				},

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- If you prefer more traditional completion keymaps,
					-- you can uncomment the following lines

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })
						else
							fallback()
						end
					end, { "i", "s" }),

					-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ['<Tab>'] = cmp.mapping.confirm { select = true },
					-- ['<Tab>'] = cmp.mapping.select_next_item(),
					--['<S-Tab>'] = cmp.mapping.select_prev_item(),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),

					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),

				sources = {
					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					{ name = "nvim_lsp" },
					{ name = "copilot" },
					{ name = "codecompanion" },
					{ name = "supermaven" },
					{ name = "luasnip" },
					{ name = "lazydev", group_index = 0 },
					-- { name = "buffer", keyword_length = 3 },
					{ name = "path" },
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
