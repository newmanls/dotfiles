return {
    {
        "bullets-vim/bullets.vim",
        init = function()
            vim.g.bullets_checkbox_markers = ' -x'
        end,
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
            heading = {
                icons = { "⦿ " },
            },
            bullet = {
                icons = { "•", "◦" },
                highlight = "@markup.list",
            },
            checkbox = {
                unchecked = {
                    icon = "☐ ",
                    highlight = "@diff.minus",
                },
                checked = {
                    icon = "☑ ",
                    highlight = "@diff.plus",
                },
                custom = {
                    todo = {
                        raw = "[-]",
                        rendered = "▣ ",
                        highlight = "@diff.delta"
                    },
                },
            },
            sign = {
                enabled = false,
            },
        },
        ft = "markdown",
        cmd = "RenderMarkdown",
        keys = {
            {
                "<leader>mr",
                "<Cmd>RenderMarkdown toggle<CR>",
                desc = "Toggle Markdown Rendering"
            },
        },
    }
}
