return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        local fzf_lua = require("fzf-lua")
        fzf_lua.setup()
        fzf_lua.register_ui_select()
    end,
    keys = {
        {
            "<leader>ff",
            "<Cmd>FzfLua files<CR>",
            desc = "List Files"
        },
        {
            "<leader>fb",
            "<Cmd>FzfLua buffers<CR>",
            desc = "List buffers"
        },
        {
            "<leader>fg",
            "<Cmd>FzfLua live_grep<CR>",
            desc = "Search for a pattern"
        },
        {
            "z=",
            "<Cmd>FzfLua spell_suggest<CR>",
            desc = "List spelling suggestions"
        },
    },
}
