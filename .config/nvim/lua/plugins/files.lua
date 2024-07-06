return {
    {
        "rolv-apneseth/tfm.nvim",
        opts = {
            file_manager = "lf",
            replace_netrw = true,
            enable_cmds = true,
            ui = {
                border = "single",
                height = 0.8,
                width = 0.9,
            }
        },
        lazy = false,
        keys = {
            {
                "<leader>fe",
                "<Cmd>Tfm<CR>",
                desc = "Open Terminal File Manager"
            }
        }
    },
    {
        "jghauser/mkdir.nvim",
        event = "VeryLazy"
    },
}
