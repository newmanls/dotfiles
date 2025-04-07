local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add({
        source = 'OXY2DEV/markview.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'echasnovski/mini.icons',
        }
    })

    local presets = require("markview.presets");
    local list_item = {
        add_padding = false,
        text = "•",
    }

    require("markview").setup({
        preview = {
            hybrid_modes = { "n" },
        },
        markdown = {
            headings = presets.headings.marker,
            horizontal_rules = presets.horizontal_rules.thin,
            list_items = {
                marker_minus = list_item,
                marker_plus = list_item,
                marker_star = list_item,
                marker_dot = {
                    add_padding = false,
                },
                marker_parenthasis = {
                    add_padding = false,
                }
            },
        },
        markdown_inline = {
            checkboxes = presets.checkboxes.nerd,
        },
    })

    vim.keymap.set(
        'n',
        '<leader>mr',
        '<Cmd>Markview toggle<CR>',
        {desc = "Toggle Markdown Rendering"}
    )
end)

now(function()
    add('bullets-vim/bullets.vim')
    vim.g.bullets_checkbox_markers = ' -x'
end)
