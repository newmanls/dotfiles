return {
    {
        "echasnovski/mini.notify",
        version = false,
        init = function()
            vim.notify = require("mini.notify").make_notify()
        end,
        opts = {
            content = {
                format = function(notif) return notif.msg end,
            }
        },
        event = "VeryLazy",
    },
    {
        "hedyhli/outline.nvim",
        opts = {
            outline_window = {
                position = "left",
                width = 30,
                auto_close = true,
            }
        },
        keys = {
            {
                "<leader>o",
                "<Cmd>Outline<CR>",
                desc = "Toggle outline sidebar"
            }
        }
    }
}
