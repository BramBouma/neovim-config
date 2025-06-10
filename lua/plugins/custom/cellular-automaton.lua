return {
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton make_it_rain", "CellularAutomaton game_of_life" },
        keys = {
            {"<leader>rr", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain"},
            {"<leader>rg", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life"}
        },
    },
    {
        require("which-key").add({
            { "<leader>r", group = "Random", icon = { icon = "󰃤 ", color = "blue" } },

        })
    },
}
