return {
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton make_it_rain", "CellularAutomaton game_of_life" },
        keys = {
            {"<leader>ar", "<cmd>CellularAutomaton make_it_rain<cr>"},
            {"<leader>ag", "<cmd>CellularAutomaton game_of_life<cr>"}
        },
    },
    {
        require("which-key").add({
            { "<leader>a", group = "Automaton" },

        })
    },
}
