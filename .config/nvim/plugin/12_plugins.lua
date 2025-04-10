local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add('williamboman/mason.nvim')
    add({
        source = 'williamboman/mason-lspconfig.nvim',
        depends = { 'williamboman/mason.nvim' }
    })
    add({
        source = 'neovim/nvim-lspconfig',
        -- Supply dependencies near target plugin
        depends = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
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
    })
end)

later(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter',
        depends = { 'nvim-treesitter/nvim-treesitter-context' },
        hooks = {
            post_checkout = function() vim.cmd('TSUpdate') end
        },
    })

    require('nvim-treesitter.configs').setup({
        auto_install = true,
        ignore_install = { 'latex' },
        highlight = { enable = true },
        incremental_selection = { enable = true },
    })
end)

later(function ()
    add('ibhagwan/fzf-lua')

    require("fzf-lua").setup()
    FzfLua.register_ui_select()

    vim.keymap.set(
        'n',
        '<leader>ff',
        '<Cmd>FzfLua files<CR>',
        { desc = "Search files" }
    )
    vim.keymap.set(
        'n',
        '<leader>fb',
        '<Cmd>FzfLua buffers<CR>',
        { desc = "Search buffers" }
    )
    vim.keymap.set(
        'n',
        '<leader>fg',
        '<Cmd>FzfLua live_grep<CR>',
        { desc = "Search for a pattern" }
    )
    vim.keymap.set(
        'n',
        '<leader>fd',
        '<Cmd>FzfLua lsp_workspace_diagnostics<CR>',
        { desc = "Search workspace diagnostics" }
    )
end)

later(function() add('mattn/emmet-vim') end)

later(function()
    add({
        source = 'OXY2DEV/helpview.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    })
end)

later(function()
    add('kassio/neoterm')

    vim.g.neoterm_autoinsert = true
    vim.g.neoterm_default_mod = "botright"

    vim.keymap.set(
        { '', 't' },
        '<A-CR>',
        '<Cmd>Ttoggle<CR>',
        { desc = 'Toggle the last active terminal buffer' }
    )
end)

later(function()
    add('rolv-apneseth/tfm.nvim')

    require('tfm').setup({
        file_manager = "lf",
        replace_netrw = true,
        enable_cmds = true,
        ui = {
            border = "single",
            height = 0.8,
            width = 0.9,
        }
    })

    vim.keymap.set(
        '',
        '<leader>ee',
        '<Cmd>Tfm<CR>',
        { desc = "Open file manager" }
    )
end)

later(function() add('jghauser/mkdir.nvim') end)
