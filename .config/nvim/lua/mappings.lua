vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move between visible lines
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

-- Remove highlights
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')
