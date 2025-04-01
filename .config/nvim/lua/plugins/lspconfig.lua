return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
        },
    },
    {
        "williamboman/mason.nvim",
        lazy = true,
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        opts = {
            ensure_installed = { "bashls", "html", "lua_ls", "ts_ls" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                ["pylsp"] = function()
                    require("lspconfig").pylsp.setup({
                        settings = {
                            pylsp = {
                                plugins = {
                                    -- Run :PylspInstall python-lsp-isort
                                    isort = { enabled = true }
                                }
                            }
                        }
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        }
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.completion.spell
                }
            })
        end,
        lazy = true,
    },
}
