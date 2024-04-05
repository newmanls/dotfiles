return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    keys = {
        {
            "<leader>fl",
            "<Cmd>Neotree left reveal toggle<CR>",
            desc = "Open file explorer at left"
        },
        {
            "<leader>ft",
            "<Cmd>Neotree float reveal toggle<CR>",
            desc = "Open file explorer as a floating window"
        },
    },
    opts = {
        close_if_last_window = true,
        enable_normal_mode_for_inputs = true,
        sort_case_insensitive = true,
        window = {
            position = "float",
            mappings = {
                ["h"] = "close_node",
                ["l"] = "open",
                ["d"] = "cut_to_clipboard",
                ["D"] = "delete",
                ["<C-s>"] = "open_split",
                ["<C-v>"] = "open_vsplit",
            }
        }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    }
}
