return {
    {
        "tadmccorkle/markdown.nvim",
        opts = {},
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
                mode = { "n", "i" },
                desc = "Add new list item in the next line"
            },
            {
                "<M-O>",
                "<Cmd>MDListItemAbove<CR>",
                mode = { "n", "i" },
                desc = "Add new list item in the previous line"
            },
            {
                "<leader>mt",
                "<Cmd>MDToc<CR>",
                desc = "Open table of contents"
            }
        },
    },
    {
        "toppair/peek.nvim",
        opts = {
            app = "browser"
        },
        build = "deno task --quiet build:fast",
        ft = "markdown",
        keys = {
            {
                "<leader>mp",
                function() require("peek").open() end,
                desc = "Open live preview"
            }
        },
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons",
        },
        opts = {
            headings = { "⦿ " },
            bullets = { "•", "◦" },
            checkbox = {
                unchecked = "☐ ",
                checked = "☑ ",
                custom = {
                    todo = {
                        raw = "[-]",
                        rendered = "▣ ",
                        highlight = "@diff.delta"
                    },
                },
            },
            highlights = {
                bullet = "@markup.list",
                checkbox = {
                    unchecked = "@diff.minus",
                    checked = "@diff.plus",
                },
            }
        },
        ft = "markdown",
        keys = {
            {
                "<leader>mr",
                "<Cmd>RenderMarkdownToggle<CR>",
                desc = "Toggle Markdown Rendering"
            },
        },
    }
}
