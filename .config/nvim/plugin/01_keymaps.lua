-- Set <Space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move between visible lines
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

-- Remove highlights with <Esc>
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')
