return {
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown",
        keys = {
            {
                "gtt",
                "<Cmd>MDTaskToggle<CR>",
                desc = "Toggle task on the current cursor line"
            },
            {
                "gt",
                ":MDTaskToggle<CR>",
                silent = true,
                mode = "v",
                desc = "Toggle tasks under selected lines"
            },
            {
                "<M-o>",
                "<Cmd>MDListItemBelow<CR>",
                mode = { "n", "i" }
            },
            {
                "<M-O>",
                "<Cmd>MDListItemAbove<CR>",
                mode = { "n", "i" }
            },
            {
                "<leader>mt",
                "<Cmd>MDToc<CR>"
            }
        },
        opts = {}
    },
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        ft = "markdown",
        keys = {
            {
                "<leader>mp",
                function() require("peek").open() end,
                desc = "Open live preview"
            }
        },
        opts = {
            app = "browser"
        }
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            headings = { "⦿ " },
            bullets = { "•", "◦" },
            checkbox = {
                unchecked = "☐ ",
                checked = "☑ ",
            }
        },
    }
}
