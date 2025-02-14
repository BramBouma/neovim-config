-- Start dashboard.
return {
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
            local dashboard = require 'alpha.themes.dashboard'

            local header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

            ]]
            dashboard.section.header.val = vim.split(header, '\n')
            dashboard.section.header.opts.hl = 'AlphaHeader'

            local function dashboard_button(sc, txt, keybind)
                local button = dashboard.button(sc, txt, keybind)
                button.opts.hl_shortcut = 'AlphaShortcut'
                button.opts.hl = 'AlphaButtons'
                return button
            end
            dashboard.section.buttons.val = {
                dashboard_button('f', '  Find file', '<cmd>Telescope find_files<cr>'),
                dashboard_button('t', '󱏒  View Neo-Tree', "<cmd>Neotree position=float<CR>"),
                dashboard_button('g', '  Grep', '<cmd>Telescope live_grep<cr>'),
                dashboard_button('r', '  Recent files', '<cmd>Telescope oldfiles<cr>'),
                dashboard_button('q', '  Quit', '<cmd>qa<cr>'),
                { type = 'padding', val = 2 },
            }
            dashboard.section.buttons.opts.hl = 'AlphaButtons'
            dashboard.opts.layout[1].val = #dashboard.section.buttons.val

            -- dashboard.section.footer.val = "It's not a bug, it's a feature. 👻"
            dashboard.section.footer.val = "put down the config bro 👻"
            dashboard.section.footer.opts.hl = 'AlphaFooter'

            require('alpha').setup(dashboard.opts)
        end,
    },
}
