return {
    {
        "rolv-apneseth/tfm.nvim",
        lazy = false,
        keys = {
            {
                "<leader>e",
                "<Cmd>Tfm<CR>",
                desc = "Terminal File Manager"
            },
        },
        opts = {
            file_manager = "lf",
            replace_netrw = true,
            enable_cmds = true,
            ui = { border = "none" }
        }
    },
    {
        "jghauser/mkdir.nvim",
        event = "VeryLazy"
    },
}
