return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = true },
                char = { multi_line = false },
            }
        }
    },
    {
        "chrishrb/gx.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        submodules = false,
        init = function()
            vim.g.netrw_nogx = true
        end,
        opts = {
            handler_options = {
                search_engine = "duckduckgo"
            }
        },
        keys = {
            {
                "gx",
                "<Cmd>Browse<CR>",
                mode = { "n", "x" },
                desc = "Browse"
            }
        }
    },
    {
        "jghauser/mkdir.nvim",
        event = "VeryLazy"
    },
}
