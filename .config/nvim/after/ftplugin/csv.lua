vim.opt_local.colorcolumn = '0'

local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add('hat0uma/csvview.nvim')

    require('csvview').setup({
        view = {
            display_mode = 'border'
        }
    })

    vim.keymap.set(
        '',
        '<leader>pv',
        '<Cmd>CsvViewToggle<CR>',
        { desc = 'Toggle csv view' }
    )
end)
