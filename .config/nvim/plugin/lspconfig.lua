local lspconfig = require('lspconfig')
local servers = {
    'bashls',
    'cssls',
    'html',
    'pyright',
    'sqlls',
    'tsserver',
}

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = servers,
    handlers = {
        function (server_name)
            lspconfig[server_name].setup({})
        end,

        ['html'] = function ()
            lspconfig.html.setup({
                filetypes = { 'html', 'htmldjango' }
            })
        end,

        ['lua_ls'] = function ()
            lspconfig.lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and
                        not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force',
                            client.config.settings, {
                                Lua = {
                                    runtime = { version = 'LuaJIT' },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = { vim.env.VIMRUNTIME }
                                    }
                                }
                            }
                        )

                        client.notify("workspace/didChangeConfiguration", {
                            settings = client.config.settings
                        })
                    end
                    return true
                end
            })
        end
    }
})
