return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = true },
                char = { multi_line = false },
            }
        }
    },
    {
        "chrishrb/gx.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        submodules = false,
        init = function()
            vim.g.netrw_nogx = true
        end,
        opts = {
            handler_options = {
                search_engine = "duckduckgo"
            }
        },
        keys = {
            {
                "gx",
                "<Cmd>Browse<CR>",
                mode = { "n", "x" },
                desc = "Browse"
            }
        }
    },
    {
        "jghauser/mkdir.nvim",
        event = "VeryLazy"
    },
    {
        "michaelrommel/nvim-silicon",
        keys = {
            {
                "<leader>sc",
                "<Cmd>Silicon<CR>",
                mode = "v",
                desc = "Create image out of the selected lines"
            }
        },
        opts = {
            font = "Iosevka Nerd Font=24",
            theme = "OneHalfDark",
            to_clipboard = true,
            output = function()
                local savedir = "~/Pictures/Screenshots/"
                local timestamp = os.date("!%Y%m%d_%H%M%S")
                return savedir .. timestamp .. "_code.png"
            end,
        }
    }
}
