return {
    {
        "bullets-vim/bullets.vim",
        init = function()
            vim.g.bullets_checkbox_markers = ' -x'
        end,
        ft = "markdown",
    },
    {
        "toppair/peek.nvim",
        opts = {
            app = "browser"
        },
        build = "deno task --quiet build:fast",
        ft = "markdown",
        keys = {
            {
                "<leader>mp",
                function() require("peek").open() end,
                desc = "Open live preview"
            }
        },
    },
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons",
        },
        config = function()
            local presets = require("markview.presets");

            require("markview").setup({
                hybrid_modes = { "n" },
                headings = presets.headings.glow,
                horizontal_rules = presets.horizontal_rules.thin,
                list_items = {
                    marker_minus = {
                        add_padding = false,
                        text = "•",
                    },
                    marker_plus = {
                        add_padding = false,
                        text = "•",
                    },
                    marker_star = {
                        add_padding = false,
                        text = "•",
                    },
                    marker_dot = {
                        add_padding = false,
                    },
                    marker_parenthasis = {
                        add_padding = false,
                    }
                },
                checkboxes = presets.checkboxes.nerd,
            });
        end,
        keys = {
            {
                "<leader>mr",
                "<Cmd>Markview toggle<CR>",
                desc = "Toggle Markdown Rendering"
            },
        },
    },
}
