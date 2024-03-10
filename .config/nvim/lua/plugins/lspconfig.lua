return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "K",          vim.lsp.buf.hover },
            { "gd",         vim.lsp.buf.definition },
            { "[d",         vim.diagnostic.goto_prev },
            { "]d",         vim.diagnostic.goto_next },
            { "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" } },
            { "<leader>=",  vim.lsp.buf.format },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {}
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = { "bashls", "html", "lua_ls", "pylsp", "tsserver" },
                    handlers = {
                        function(server_name)
                            require("lspconfig")[server_name].setup({})
                        end,

                        ["html"] = function()
                            require("lspconfig").html.setup({
                                filetypes = { "html", "htmldjango" }
                            })
                        end,

                        ["lua_ls"] = function()
                            require("lspconfig").lua_ls.setup({
                                on_init = function(client)
                                    local path = client.workspace_folders[1].name
                                    if not vim.loop.fs_stat(path .. "/.luarc.json") and
                                        not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                                        client.config.settings = vim.tbl_deep_extend("force",
                                            client.config.settings, {
                                                Lua = {
                                                    runtime = { version = "LuaJIT" },
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
                }
            },
            {
                "nvimtools/none-ls.nvim",
                config = function()
                    local null_ls = require("null-ls")

                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.isort,
                        }
                    })

                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end,
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
        }
    },
}
