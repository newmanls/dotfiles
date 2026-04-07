vim.pack.add({
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/kassio/neoterm',
    'https://github.com/rolv-apneseth/tfm.nvim',
    'https://github.com/stevearc/oil.nvim',
})


require('nvim-highlight-colors').setup()


-- neoterm
vim.g.neoterm_autoinsert = true
vim.g.neoterm_default_mod = "botright"

vim.keymap.set(
    { '', 't' },
    '<A-CR>',
    '<Cmd>Ttoggle<CR>',
    { desc = 'Toggle the last active terminal buffer' }
)


-- tfm
---@diagnostic disable: missing-fields
require('tfm').setup({
    file_manager = 'lf',
    replace_netrw = false,
    enable_cmds = true,
    ui = {
        border = vim.o.winborder,
        height = 0.8,
        width = 0.9,
    }
})
---@diagnostic enable

vim.keymap.set(
    'n',
    '<leader>ee',
    '<Cmd>Tfm<CR>',
    { desc = "Open file explorer" }
)


-- oil
require('oil').setup({
    default_file_explorer = false,
    win_options = {
        colorcolumn = '0',
    }
})

vim.keymap.set(
    'n',
    '-',
    '<CMD>Oil<CR>',
    { desc = 'Open parent directory with Oil' }
)
