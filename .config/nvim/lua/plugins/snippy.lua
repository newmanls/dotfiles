return {
    "dcampos/nvim-snippy",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
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
