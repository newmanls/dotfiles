function map(mode, shortcut, command, new_options)
    local options = { silent = true }
    if new_options then
        options = vim.tbl_extend("force", options, new_options)
    end
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

vim.g.mapleader = ' '

-- Move between visible lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Split window
map('n', '<leader>x', ':split ',  { silent = false })
map('n', '<leader>v', ':vsplit ', { silent = false })

-- Reselect text after (un)indentation.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Remove highlights
map('n', '<Esc>', ':noh<CR>')

-- Plugins mappings
map('n', '<leader>c', ':ColorizerToggle<CR>')
