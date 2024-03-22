return {
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown",
        keys = {
            { "gtt",        "<Cmd>MDTaskToggle<CR>" },
            { "<M-l><M-o>", "<Cmd>MDListItemBelow<CR>", mode = { "n", "i" } },
            { "<M-L><M-O>", "<Cmd>MDListItemAbove<CR>", mode = { "n", "i" } },
            { "<leader>mt", "<Cmd>MDToc<CR>" }
        },
        opts = {}
    },
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        ft = "markdown",
        keys = {
            { "<leader>mp", function() require("peek").open() end }
        },
        opts = {
            app = "browser"
        }
    }
}
