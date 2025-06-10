# Neovim Config

My work-in-progress Neovim config that started as [kickstart](https://github.com/nvim-lua/kickstart.nvim.git)
- first difference is that I modularized a lot of the kickstart base into seperate files/directories
- kickstart's base plugins are in lua/plugins/kickstart
- custom plugins are in lua/custom/plugins/custom
- all plugins are loaded via lua/config/lazy-plugins.lua
