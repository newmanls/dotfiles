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
    'markdown_oxide',
    'pylsp',
    'ts_ls',
})


-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
})


-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        -- Auto-format ("lint") on save and on manual action.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = ev.buf,
                        id = client.id,
                        timeout_ms = 1000,
                    })
                end,
            })

            vim.keymap.set('', 'grf', function() vim.lsp.buf.format() end)
        end
    end,
})
