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
        "brenoprata10/nvim-highlight-colors",
        opts = {}
    },
}
