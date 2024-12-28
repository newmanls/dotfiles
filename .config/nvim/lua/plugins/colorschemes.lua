return {
    {
        "sainnhe/gruvbox-material",
        init = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_enable_bold = true
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
