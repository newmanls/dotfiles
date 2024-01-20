local map = vim.keymap.set

require('terminal')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Write and quit
map('', '<C-s>', '<Cmd>write<CR>')

-- Move between visible lines
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Split window
map('n', '<leader>x', ':split ')
map('n', '<leader>v', ':vsplit ')

-- Reselect text after (un)indentation.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Remove highlights
map('n', '<Esc>', '<Cmd>noh<CR>')

-- TermToggle
map({ '', 't' }, '<A-CR>', function() ToggleTerminal() end)
