-- KEYMAPS FROM KICKSTART
-- clear highlights on search when pressing <Esc> in normal mode
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
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
-- quick save <leader>w
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Save file' })
-- shortcut for quickref <leader>hq
vim.keymap.set('n', '<leader>hq', ':help quickref<CR>', { desc = 'Help: Quick Reference' })
-- open config file <leader>ev
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<CR>', { desc = 'Edit config file' })
-- reload config <leader>sv
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { desc = 'Source config file' })


-- MY KEYMAPS
-- vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'next buffer' })
-- vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = 'previous buffer' })
-- Swap colon functionality with semicolon
vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })
-- map to get to neotree current view
vim.keymap.set("n", "<leader>nt", "<cmd>Neotree position=current<CR>", { desc = "open neomap in netrw view"})
-- map to get to Lazy / Mason menus
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "[L]azy"})
vim.keymap.set("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "[M]ason"})


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
vim.keymap.set("x", "<leader>p", "\"_dP")
-- delete into void register (delete without copying)
vim.keymap.set({ "n", "v" }, "<leader>dv", "\"_d")
-- find and replace the word under the cursor in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

