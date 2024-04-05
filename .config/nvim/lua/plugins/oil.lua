return {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    keys = {
        {
            "-",
            "<Cmd>Oil<CR>",
            desc = "Open Oil file explorer"
        }
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
