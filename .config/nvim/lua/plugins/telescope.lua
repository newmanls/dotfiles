return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        },
        keys = {
            { '<leader>ff', '<Cmd>Telescope find_files<CR>' },
            { '<leader>fg', '<Cmd>Telescope live_grep<CR>' },
            { '<leader>fb', '<Cmd>Telescope buffers<CR>' },
        }
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        event = 'VeryLazy',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }

            require("telescope").load_extension("ui-select")
        end
    }
}
