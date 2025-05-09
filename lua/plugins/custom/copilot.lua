local plugin_toggle = require("utils.plugin_toggles")


return {
  {
    "zbirenbaum/copilot.lua",
    enabled = plugin_toggle.copilot,
    event = "InsertEnter",
    opts = {
      -- Panel is used to display Copilot status messages / suggestions panel
      panel = {
        enabled = false,       -- Enable the Copilot panel
        auto_refresh = false, -- Refresh panel automatically (can be noisy)
        keymap = {
          jump_prev = "[[",   -- Keymap to jump to previous suggestion in panel
          jump_next = "]]",   -- Keymap to jump to next suggestion in panel
          accept = "<CR>",   -- Keymap to accept suggestion shown in panel
          refresh = "gr",     -- Keymap to refresh suggestions in panel
          open = "<C-c>" -- Define a keymap to open the panel (e.g., <leader>a c o)
        },
        -- Layout of the panel
        layout = {
          position = "right", -- Can be 'bottom' or 'right'
          ratio = 0.4          -- Proportion of the screen the panel takes
        }
      },
      -- Suggestion controls how suggestions are fetched and displayed *inline*
      -- Note: nvim-cmp integration often takes precedence for inline display
      suggestion = {
        enabled = false,           -- Enable fetching suggestions
        auto_trigger = true,      -- Fetch suggestions automatically as you type
        debounce = 75,          -- Delay in ms before fetching suggestions
        keymap = {
          -- accept = "<C-a>",       -- Accept suggestion (used IF cmp doesn't handle it) - Choose an unused keybind
          accept = "<S-Tab>",       -- Accept suggestion (used IF cmp doesn't handle it) - Choose an unused keybind
          accept_word = false,  -- Map to accept the next word suggestion
          accept_line = "<Tab>",  -- Map to accept the next line suggestion
          next = "<M-]>",      -- Cycle to next suggestion (Alt+]) - Choose unused keybind
          prev = "<M-[>",      -- Cycle to previous suggestion (Alt+[) - Choose unused keybind
          dismiss = "<C-e>",    -- Dismiss suggestions (Ctrl+e) - Choose unused keybind
        },
      },
      -- Filetypes allows enabling/disabling Copilot for specific filetypes
      filetypes = {
        -- ["*"] = true, -- Default: enable for all filetypes
        -- Example: Disable for markdown and yaml
        -- markdown = false,
        -- yaml = false,
        -- Help filetype is disabled by default, uncomment to enable
        -- help = true,
      },
      -- Other options can be explored in copilot.lua documentation
      -- copilot_node_command = nil, -- Default: tries to find node automatically
      -- server_opts_override = {},
    },
    -- Optional: If you want to ensure setup runs AFTER copilot is loaded
    -- config = function(_, opts)
    --  require("copilot").setup(opts)
    -- end,
    -- NOTE: You will need to run :Copilot auth manually after installation!
  }
}
