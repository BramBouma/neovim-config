-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- import configuration and settings
require("config.configs")

-- import autocommands (only one that came with kickstart)
require("config.autocmds")

-- initialize and install lazy as the plugin manager
require("config.lazy-bootstrap")

-- script using lazy to install plugins
require("config.lazy-plugins")

-- set various keymaps
require("config.keymap")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
