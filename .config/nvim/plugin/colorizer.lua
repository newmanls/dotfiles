require('colorizer').setup(nil, {
    css = true
})

vim.keymap.set('n', '<leader>c', '<Cmd>ColorizerToggle<CR>')
