vim.opt_local.colorcolumn = '0'
vim.opt_local.shiftwidth = 2
vim.opt_local.spell = true
vim.opt_local.spelllang = 'es'

vim.api.nvim_buf_set_keymap(0, 'n', '<F5>',
    '<Cmd>wa | !xelatex -shell-escape "%"<CR>', { noremap = true })
