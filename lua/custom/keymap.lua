local add = function(keys, func, desc, mode, icon)
	mode = mode or {'n'}
	if icon then
		require("which-key").add({
			{keys, func, desc = desc, mode = mode, icon = icon}
		})
	else
		require("which-key").add({
			{keys, func, desc = desc, mode = mode}
		})
	end
end

-- KEYMAPS FROM KICKSTART
-- clear highlights on search when pressing <Esc> in normal mode
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<M-h>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-l>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<M-j>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-k>', '<C-w>-', { desc = 'Decrease window height' })


-- KEYMAPS FROM CHATGPT 
-- shortcut for quickref <leader>hq
vim.keymap.set('n', '<leader>hq', ':help quickref<CR>', { desc = 'Help: Quick Reference' })
-- open config file <leader>ev
vim.keymap.set('n', '<leader>hc', ':edit $MYVIMRC<CR>', { desc = 'Edit config file' })


-- MY KEYMAPS
-- Swap colon functionality with semicolon
vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })
-- map to get to neotree current view
vim.keymap.set("n", "<leader>ht", "<cmd>Neotree position=current<CR>", { desc = "open neomap in netrw view"})
-- map to get to Lazy / Mason menus
vim.keymap.set("n", "<leader>hl", "<cmd>Lazy<CR>", { desc = "[L]azy"})
vim.keymap.set("n", "<leader>hm", "<cmd>Mason<CR>", { desc = "[M]ason"})
-- map ctrl+a to select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = 'Select all in visual mode from normal mode' })
vim.keymap.set("v", "<C-a>", "vggVG", { desc = 'Select all in visual mode from visual mode' })

-- FROM THEPRIMEAGEN (https://www.youtube.com/watch?v=w7i4amO_zaE)
-- move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
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
add("<leader>f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "[F]ind and replace", {'n'}, { icon = " ", color = "blue"})
-- require("which-key").add({
-- 	{"<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], mode=""}
-- })

