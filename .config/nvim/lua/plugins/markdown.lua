return {
    {
        "bullets-vim/bullets.vim",
        ft = "markdown",
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
