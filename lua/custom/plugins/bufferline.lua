local diagnostic_icons = require('custom.utils.icons').diagnostic
print(diagnostic_icons)

return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  version = "*",
  dependencies = {
        'nvim-tree/nvim-web-devicons',
        'echasnovski/mini.bufremove',
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
          local indicator = (diag.error and diagnostic_icons.Error or "")
              .. (diag.warning and diagnostic_icons.Warning or "")
              .. (diag.info and diagnostic_icons.Info or "")
              .. (diag.hint and diagnostic_icons.Hint or "")
          return vim.trim(indicator)
      end
    },
  },
  require('which-key').add({
    { "<leader>b", group = "[B]uffers" },
    { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
    { "<leader>bd",
    function()
        require('mini.bufremove').delete(0, true)
    end,
    desc = "Delete current buffer" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<leader>bo", "<cmd>BufferLinePick<cr>", desc = "Select a buffer to open" },
    { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
  }),
 }
