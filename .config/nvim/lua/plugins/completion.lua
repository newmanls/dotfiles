return {
    {
        "mattn/emmet-vim",
        lazy = true,
        ft = { "html", "htmldjango", "svelte", "astro" }
    },
    {
        "echasnovski/mini.completion",
        version = false,
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = {}
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        event = "VeryLazy",
        opts = {}
    },
    {
        "dcampos/nvim-snippy",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = {
            enable_auto = true,
            mappings = {
                is = {
                    ["<Tab>"] = "expand_or_advance",
                    ["<S-Tab>"] = "previous",
                },
                nx = {
                    ["<leader>x"] = "cut_text",
                },
            },
        }
    }
}
