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
    {
        "sainnhe/gruvbox-material",
        init = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_diagnostic_text_highlight = true
            vim.g.gruvbox_material_better_performance = true
        end
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        opts = {
            style = "warmer"
        }
    }
}
