vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/neovim/nvim-lspconfig'
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'arduino_language_server',
        'bashls',
        'clangd',
        'cssls',
        'emmet_language_server',
        'html',
        'lua_ls',
        'pylsp',
        'ts_ls',
    }
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
