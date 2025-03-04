return {
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton make_it_rain", "CellularAutomaton game_of_life" },
        keys = {
            {"<leader>ar", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain"},
            {"<leader>ag", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life"}
        },
    },
    {
        require("which-key").add({
            { "<leader>a", group = "Automaton", icon = { icon = "󰃤 ", color = "blue" } },

        })
    },
}
