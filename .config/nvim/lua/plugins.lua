return {
    {
        "jghauser/mkdir.nvim",
        event = "VeryLazy"
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = true,
        cmd = "Oil",
        keys = {
            { "-", "<Cmd>Oil<CR>" }
        },
        config = true
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        "mattn/emmet-vim",
        lazy = true,
        ft = { "html", "htmldjango", "svelte" }
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        keys = {
            { "<leader>sc", ":Silicon<CR>", mode = "v" }
        },
        opts = {
            font = "Iosevka Nerd Font=24",
            theme = "OneHalfDark",
            output = function()
                local save_dir = "~/Pictures/Screenshots/"
                return save_dir .. os.date("!%Y%m%d_%H%M%S") .. "_code.png"
            end,
        }
    }
}
