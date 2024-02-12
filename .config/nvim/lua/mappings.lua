local map = vim.keymap.set

require('terminal')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move between visible lines
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Remove highlights
map('n', '<Esc>', '<Cmd>noh<CR>')

-- TermToggle
map({ '', 't' }, '<A-CR>', function() ToggleTerminal() end)
