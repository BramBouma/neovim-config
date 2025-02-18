return {
--     {
--         "iamcco/markdown-preview.nvim",
--         build = "cd app && yarn install",
--         cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--         ft = { "markdown" },
--         init = function()
--             vim.g.mkdp_filetypes = { "markdown" }
--         end,
--         -- build = ":call mkdp#util#install()",
--         -- init = function()
--         --     vim.g.mkdp_filetypes = { "markdown" }
--         -- end,
--         keys = {
--             { "<leader>m", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" }
--         }
--     }
}
