require('utils')

vim.g.mapleader = ' '

-- Save and quit
map('n',  '<leader>w',   ':w<CR>')
map('n',  '<leader>W',   ':wa<CR>')
map('n',  '<leader>q',   ':q<CR>')
map('n',  '<leader>Q',   ':qa<CR>')

-- Move between visible lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Split window
map('n',  '<leader>x',  ':split ',   {silent=false})
map('n',  '<leader>v',  ':vsplit ',  {silent=false})

-- Reselect text after (un)indentation.
map('v',  '<',  '<gv')
map('v',  '>',  '>gv')

-- Remove highlights
map('n',  '<Esc>',  ':noh<CR>')

-- Navigating through splits
map('n',  '<C-h>',  ':wincmd h<CR>')
map('n',  '<C-j>',  ':wincmd j<CR>')
map('n',  '<C-k>',  ':wincmd k<CR>')
map('n',  '<C-l>',  ':wincmd l<CR>')

-- Toggle terminal on/off (neovim)
map('n',  '<A-CR>',  ':call TermToggle(12)<CR>')
map('i',  '<A-CR>',  '<Esc>:call TermToggle(12)<CR>')
map('t',  '<A-CR>',  '<C-\\><C-n>:call TermToggle(12)<CR>')

-- Terminal go back to normal mode
map('t',  '<Esc>',  '<C-\\><C-n>')
map('t',  ':q!',    '<C-\\><C-n>:q!<CR>')

-- Plugins mappings
map('n',  '<leader>f',   ':HopChar2<CR>')
map('n',  '<leader>mt',  ':Toc<CR>')
