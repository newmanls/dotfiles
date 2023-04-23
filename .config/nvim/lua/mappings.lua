vim.g.mapleader = ' '

-- Write and quit
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>quit<CR> ')

-- Move between visible lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Split window
vim.keymap.set('n', '<leader>s', ':split ')
vim.keymap.set('n', '<leader>v', ':vsplit ')

-- Reselect text after (un)indentation.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Remove highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Plugins mappings
vim.keymap.set('n', '<leader>c', '<Cmd>ColorizerToggle<CR>')
vim.keymap.set({ 'n', 'v' }, '<CR>', function()
    MiniJump2d.start(require('mini.jump2d').builtin_opts.single_character)
end)
