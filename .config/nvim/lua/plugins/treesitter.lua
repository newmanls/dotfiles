return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = { "bash", "lua", "python", "javascript" },
        auto_install = true,
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
}
