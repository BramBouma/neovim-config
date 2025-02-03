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
          local icons = {
              error = "  ",  -- nf-fa-times_circle
              warning = "  ", -- nf-fa-exclamation_triangle
              info = "  ",    -- nf-fa-info_circle
              hint = "  "     -- nf-fa-question_circle
          }
          local indicator = (diag.error and icons.error or "")
              .. (diag.warning and icons.warning or "")
              .. (diag.info and icons.info or "")
              .. (diag.hint and icons.hint or "")
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
