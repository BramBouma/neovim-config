-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  -- make false if want hijack netrw to work, however it doesn't seem to work well (doesnt open with current position and weird visual flash)
  -- lazy = false,
  -- close if last window simply doesn't work, not sure why
  -- close_if_last_window = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      hijack_netrw_bahavior = 'open_current',
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
