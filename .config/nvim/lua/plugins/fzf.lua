return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "echasnovski/mini.icons",
    },
    init = function()
        require("fzf-lua").register_ui_select()
    end,
    opts = {},
    lazy = false,
    keys = {
        {
            "<leader>ff",
            "<Cmd>FzfLua files<CR>",
            desc = "Fuzzy list files"
        },
        {
            "<leader>fb",
            "<Cmd>FzfLua buffers<CR>",
            desc = "Fuzzy list buffers"
        },
        {
            "<leader>fg",
            "<Cmd>FzfLua live_grep<CR>",
            desc = "Fuzzy search for a pattern"
        },
    },
}
