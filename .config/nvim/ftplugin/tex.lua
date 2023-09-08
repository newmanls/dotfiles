vim.opt_local.colorcolumn = '0'
vim.opt_local.shiftwidth = 2
vim.opt_local.spell = true
vim.opt_local.spelllang = 'es'

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*.tex',
    command = '!xelatex -shell-escape %'
})
