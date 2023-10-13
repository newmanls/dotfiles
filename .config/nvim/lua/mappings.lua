require('terminal')

vim.g.mapleader = ' '

-- Write and quit
vim.keymap.set('', '<leader>w', '<Cmd>write<CR>')
vim.keymap.set('', '<leader>q', '<Cmd>quit<CR>')

-- Move between visible lines
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

-- Split window
vim.keymap.set('n', '<leader>s', ':split ')
vim.keymap.set('n', '<leader>v', ':vsplit ')

-- Reselect text after (un)indentation.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Remove highlights
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')

-- Plugins mappings
vim.keymap.set('', '<leader>c', '<Cmd>ColorizerToggle<CR>')
vim.keymap.set('', '<leader>l', '<Plug>Lorem')
vim.keymap.set('', '<leader>p', '<Plug>MarkdownPreviewToggle')
vim.keymap.set('', '<CR>', function()
    MiniJump2d.start(require('mini.jump2d').builtin_opts.single_character)
end)

-- TermToggle
vim.keymap.set({ '', 't' }, '<A-CR>', function() ToggleTerminal() end)
