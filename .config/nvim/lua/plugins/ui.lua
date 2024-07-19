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
                desc = "Search files"
            },
            {
                "<leader>fb",
                "<Cmd>FzfLua buffers<CR>",
                desc = "Search buffers"
            },
            {
                "<leader>fg",
                "<Cmd>FzfLua live_grep<CR>",
                desc = "Search for a pattern"
            },
            {
                "<leader>fd",
                "<Cmd>FzfLua lsp_workspace_diagnostics<CR>",
                desc = "Search workspace diagnostics"
            },
        },
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "│"
            })
        end,
        event = "VeryLazy",
    },
    {
        'echasnovski/mini.icons',
        init = function()
            require("mini.icons").mock_nvim_web_devicons()
        end,
        version = false,
        opts = {},
        event = "VeryLazy",
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
                desc = "Toggle outline"
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
                "<leader>ee",
                "<Cmd>Tfm<CR>",
                desc = "Open file manager"
            },
            {
                "<leader>es",
                "<Cmd>TfmSplit<CR>",
                desc = "Open file manager (horizontal split)"
            },
            {
                "<leader>ev",
                "<Cmd>TfmVsplit<CR>",
                desc = "Open file manager (vertical split)"
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
