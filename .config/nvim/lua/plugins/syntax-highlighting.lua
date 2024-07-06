return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-context" },
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            ignore_install = { "latex" },
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true,
            },
        },
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "│"
            })
        end,
        event = "VeryLazy",
    },
    {
        'echasnovski/mini.icons',
        version = false,
        opts = {},
        event = "VeryLazy",
    },
    {
        "brenoprata10/nvim-highlight-colors",
        opts = {}
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        opts = {
            style = "warmer"
        }
    }
}
