vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })


-- Enable LSPs
vim.lsp.enable({
    'arduino_language_server',
    'bashls',
    'clangd',
    'cssls',
    'emmet_ls',
    'html',
    'lua_ls',
    'pylsp',
    'ts_ls',
})


-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
})


-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set(
            '',
            'grf',
            function() vim.lsp.buf.format() end,
            { desc = 'vim.lsp.buf.format()' }
        )
    end,
})
