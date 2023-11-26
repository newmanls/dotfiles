local map = vim.keymap.set

vim.opt_local.colorcolumn = '0'
vim.opt_local.shiftwidth = 2
vim.opt_local.spell = true
vim.opt_local.spelllang = 'es'

map('n', '<leader>p', '<Cmd>wa | !latexmk -pdflua -pv<CR>', { buffer = true })
map('n', '<F5>', '<Cmd>wa | !latexmk -pdflua<CR>', { buffer = true })
