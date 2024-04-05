return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>ff",
                "<Cmd>Telescope find_files<CR>",
                desc = "List Files"
            },
            {
                "<leader>fg",
                "<Cmd>Telescope live_grep<CR>",
                desc = "Search for a string"
            },
            {
                "<leader>fb",
                "<Cmd>Telescope buffers<CR>",
                desc = "List buffers"
            },
            {
                "z=",
                "<Cmd>Telescope spell_suggest<CR>",
                desc = "List spelling suggestions"
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep"
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            }

            require("telescope").load_extension("ui-select")
        end
    }
}
