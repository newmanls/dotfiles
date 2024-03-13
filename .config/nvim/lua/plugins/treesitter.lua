return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "lua", "python" },
            auto_install = true,
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true,
            },
        })
    end
}
