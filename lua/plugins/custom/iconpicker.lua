-- Icon picker.
return {
    {
        'ziontee113/icon-picker.nvim',
        -- event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'stevearc/dressing.nvim',
        cmd = 'IconPickerNormal',
        opts = { disable_legacy_commands = true },
        -- keys = {
        --     { '<leader>i', '<cmd>IconPickerNormal<cr>', desc = '[I]con picker', icon = "󰇳" },
        -- },
    },
    require('which-key').add({
        { "<leader>hi", "<cmd>IconPickerNormal<cr>", desc = "[I]con picker", icon = { icon = " ", color="blue"}}
    })
}

