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

-- Plugins mappings
map('i', '<C-l>', '<Cmd>LoremIpsum<CR>')
map('n', '<leader>c', '<Cmd>ColorizerToggle<CR>')
map('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>')

map('', '<CR>', function()
    MiniJump2d.start(require('mini.jump2d').builtin_opts.single_character)
end)

-- LSP
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})
