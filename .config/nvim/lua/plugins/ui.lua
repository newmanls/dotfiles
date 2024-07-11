return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" },
        init = function()
            require("fzf-lua").register_ui_select()
        end,
        opts = {},
        lazy = false,
        keys = {
            {
                "<leader>ff",
                "<Cmd>FzfLua files<CR>",
                desc = "Fuzzy list files"
            },
            {
                "<leader>fb",
                "<Cmd>FzfLua buffers<CR>",
                desc = "Fuzzy list buffers"
            },
            {
                "<leader>fg",
                "<Cmd>FzfLua live_grep<CR>",
                desc = "Fuzzy search for a pattern"
            },
        },
    },
    {
        "echasnovski/mini.notify",
        version = false,
        init = function()
            vim.notify = require("mini.notify").make_notify()
        end,
        opts = {
            content = {
                format = function(notif) return notif.msg end,
            },
            window = {
                winblend = 0,
            }
        },
        event = "VeryLazy",
    },
    {
        "kassio/neoterm",
        init = function()
            vim.g.neoterm_autoinsert = true
            vim.g.neoterm_default_mod = "botright"
        end,
        keys = {
            {
                "<A-CR>",
                "<Cmd>Ttoggle<CR>",
                mode = { "", "t" },
                desc = "Toggle the last active terminal buffer"
            }
        },
    },
    {
        "hedyhli/outline.nvim",
        opts = {
            outline_window = {
                position = "left",
                width = 30,
                auto_close = true,
            },
            symbol_folding = {
                autofold_depth = false
            }
        },
        keys = {
            {
                "<leader>o",
                "<Cmd>Outline<CR>",
                desc = "Toggle outline sidebar"
            }
        }
    },
    {
        "rolv-apneseth/tfm.nvim",
        opts = {
            file_manager = "lf",
            replace_netrw = true,
            enable_cmds = true,
            ui = {
                border = "single",
                height = 0.8,
                width = 0.9,
            }
        },
        lazy = false,
        keys = {
            {
                "<leader>fe",
                "<Cmd>Tfm<CR>",
                desc = "Open Terminal File Manager"
            }
        }
    },
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            icons = {
                breadcrumb = ">",
                separator = ">",
                group = "+",
            },
        },
        event = "VeryLazy",
    }
}
