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
        keys = {
            {
                "K",
                vim.lsp.buf.hover,
                desc = "Display information about the symbol under the cursor"
            },
            {
                "gd",
                vim.lsp.buf.definition,
                desc = "Go to definition"
            },
            {
                "crr",
                vim.lsp.buf.code_action,
                mode = { "n", "v" },
                desc = "List available code actions"
            },
            {
                "crn",
                vim.lsp.buf.rename,
                desc = "Renames all references to the symbol under the cursor"
            },
            {
                "<leader>=",
                vim.lsp.buf.format,
                desc = "Formats a buffer using the attached language server"
            },
        },
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

                -- Run :PylspInstall python-lsp-isort
                ["pylsp"] = function()
                    require("lspconfig").pylsp.setup({
                        settings = {
                            pylsp = {
                                plugins = {
                                    rope_autoimport = {
                                        enabled = true,
                                    }
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
