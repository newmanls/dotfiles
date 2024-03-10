return {
    {
        "hedyhli/markdown-toc.nvim",
        ft = "markdown",
        lazy = true,
        cmd = "Mtoc",
        opts = {
            fences = {
                enabled = true,
                start_text = "TOC",
                end_text = "TOC"
            },
            toc_list = {
                markers = "-",
            }
        }
    },
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        ft = "markdown",
        lazy = true,
        keys = {
            { "<leader>mp", function() require("peek").open() end }
        },
        opts = {
            app = "browser"
        }
    }
}
