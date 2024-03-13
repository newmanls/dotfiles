return {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    keys = {
        { "-", "<Cmd>Oil<CR>" }
    },
    opts = {
        win_options = {
            colorcolumn = "0"
        }
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
