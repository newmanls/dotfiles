require('utils')

vim.g.mapleader = ' '

-- Save and quit
map('n' , '<leader>w'  , ':w<CR>')
map('n' , '<leader>wq' , ':wq<CR>')
map('n' , '<leader>q'  , ':q<CR>')
map('n' , '<leader>Q'  , ':qa<CR>')

-- Split window
map('n' , '<leader>x' , ':split '  , {silent=false})
map('n' , '<leader>v' , ':vsplit ' , {silent=false})

-- Reselect text after indent/unindent.
map('v' , '<' , '<gv')
map('v' , '>' , '>gv')

-- Remove highlights
map('n', '<Esc>', ':noh<CR>')

-- Navigating through splits
map('n' , '<C-h>' , ':wincmd h<CR>')
map('n' , '<C-j>' , ':wincmd j<CR>')
map('n' , '<C-k>' , ':wincmd k<CR>')
map('n' , '<C-l>' , ':wincmd l<CR>')

-- Move on commandline with 'hjkl'
map('c' , '<C-h>' , '<left>'  , {silent=false})
map('c' , '<C-j>' , '<down>'  , {silent=false})
map('c' , '<C-k>' , '<up>'    , {silent=false})
map('c' , '<C-l>' , '<right>' , {silent=false})

-- Toggle terminal on/off (neovim)
map('n' , '<A-CR>' , ':call TermToggle(12)<CR>')
map('i' , '<A-CR>' , '<Esc>:call TermToggle(12)<CR>')
map('t' , '<A-CR>' , '<C-\\><C-n>:call TermToggle(12)<CR>')

-- Terminal go back to normal mode
map('t' , '<Esc>' , '<C-\\><C-n>')
map('t' , ':q!'   , '<C-\\><C-n>:q!<CR>')

-- Plugins mappings
map('n' , '<leader>s'  , ':HopChar2<CR>')
map('n' , '<leader>t'  , ':NvimTreeToggle<CR>')
map('n' , '<leader>mt' , ':Toc<CR>')
