local plugin_toggles = require("utils.plugin_toggles")

local add = function(keys, func, desc, mode, icon)
	mode = mode or { "n" }
	if icon then
		require("which-key").add({
			{ keys, func, desc = desc, mode = mode, icon = icon },
		})
	else
		require("which-key").add({
			{ keys, func, desc = desc, mode = mode },
		})
	end
end

local wk = require("which-key")

--[[
SECTION: KEYMAPS FROM KICKSTART
--]]

-- clear highlights on search when pressing <Esc> in normal mode
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "˙", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "¬", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "∆", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "˚", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-M-h>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-M-l>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-M-j>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-M-k>", "<C-w>-", { desc = "Decrease window height" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--[[
SECTION: KEYMAPS FROM CHATGPT
--]]

-- shortcut for quickref <leader>hq
vim.keymap.set("n", "<leader>hq", ":help quickref<CR>", { desc = "Help: Quick Reference" })

--[[
SECTION: MY KEYMAPS
--]]

wk.add({
	{ "<leader>e", group = "[E]dit", icon = { icon = " ", color = "blue" } },
})

if plugin_toggles.codecompanion or plugin_toggles.copilot then
	wk.add({
		{ "<leader>a", group = "[A]I", icon = { icon = "󰚩 ", color = "blue" } },
	})
end

--[[
SECTION: TEMP
--]]
vim.keymap.set("n", "<leader>hd", "<cmd>colorscheme github_dark_default<CR>", { desc = "swap to github dark" })
vim.keymap.set("n", "<leader>hn", "<cmd>colorscheme tokyonight<CR>", { desc = "swap to tokyonight" })
vim.keymap.set("n", "<leader>hs", "<cmd>Telescope colorscheme<CR>", { desc = "search colorschemes" })
vim.keymap.set("n", "<leader>hk", "<cmd>colorscheme kanagawa-dragon<CR>", { desc = "swap to kanagawa" })

-- show highlight group under cursor
local show_hlgroup = function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end
vim.keymap.set("n", "<leader>hh", show_hlgroup, { desc = "show hi group" })

vim.keymap.set("n", "<leader>qd", function()
	vim.diagnostic.setqflist({
		open = true,
		title = "Diagnostics",
		severity = { min = vim.diagnostic.severity.HINT },
	})
end, { desc = "populate quickfix with diagnostics" })

-- Swap colon functionality with semicolon
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })

-- map to get to neotree current view
vim.keymap.set("n", "<leader>ht", "<cmd>Neotree position=current<CR>", { desc = "open neomap in netrw view" })

-- map to get to Lazy / Mason menus
vim.keymap.set("n", "<leader>hl", "<cmd>Lazy<CR>", { desc = "[L]azy" })
vim.keymap.set("n", "<leader>hm", "<cmd>Mason<CR>", { desc = "[M]ason" })

-- map ctrl+a to select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all in visual mode from normal mode" })
vim.keymap.set("v", "<C-a>", "vggVG", { desc = "Select all in visual mode from visual mode" })

-- new line below but remain in normal mode at same loc
add("<leader>el", "mzo<Esc>`z", "New line below", { "n" }, { icon = "↓ ", color = "blue" })

-- new line above but remain in normal mode at same loc
add("<leader>ea", "mzO<Esc>`z", "New line above", { "n" }, { icon = "↑ ", color = "blue" })

-- duplicate line below
add("<leader>ed", "yyp", "Duplicate line below", { "n" }, { icon = "󰆏 ", color = "blue" })

--[[
SECTION: KEYMAPS FROM THE PRIMEAGEN (https://www.youtube.com/watch?v=w7i4amO_zaE)
--]]

-- move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- appends line below to current line while keeping cursor in place
vim.keymap.set("n", "J", "mzJ`z")
-- page up and down while keeping cursor in the same place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- paste over text while keeping register perserved (not copying deleted selection)
-- vim.keymap.set("x", "<leader>p", "\"_dP")
-- delete into void register (delete without copying)
-- vim.keymap.set({ "n", "v" }, "<leader>dv", "\"_d")
-- find and replace the word under the cursor in the whole file
-- vim.keymap.set("n", "<leader>f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[F]ind and replace'}, icon = { icon = " ", color = "blue"} )
add(
	"<leader>f",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	"[F]ind and replace",
	{ "n" },
	{ icon = " ", color = "blue" }
)
-- require("which-key").add({
-- 	{"<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], mode=""}
-- })
