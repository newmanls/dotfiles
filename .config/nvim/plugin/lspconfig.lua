local lspconfig = require('lspconfig')

lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({ filetypes = { "html", "htmldjango" } })
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.sqlls.setup({})
lspconfig.lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
})
