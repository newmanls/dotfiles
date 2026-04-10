vim.opt_local.colorcolumn = '0'

vim.pack.add({'https://github.com/hat0uma/csvview.nvim'})

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
