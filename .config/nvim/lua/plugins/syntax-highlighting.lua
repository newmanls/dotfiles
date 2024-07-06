return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
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
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context"
        }
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "│"
            })
        end
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
