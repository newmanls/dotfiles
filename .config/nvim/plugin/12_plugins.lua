local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
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

now(function()
    add('brenoprata10/nvim-highlight-colors')
    require('nvim-highlight-colors').setup()
end)

later(function() add('jghauser/mkdir.nvim') end)

later(function()
    add({
        source = 'OXY2DEV/helpview.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    })

    require('helpview').setup({
        vimdoc = {
            headings = { enable = false },
        }
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

later(function ()
    add({
        source = 'obsidian-nvim/obsidian.nvim',
        depends = {
            'nvim-lua/plenary.nvim',
            'OXY2DEV/markview.nvim',
            'bullets-vim/bullets.vim',
        },
    })

    local vault_path = '~/Documents/Obsidian/obsidian-vault'

    require('obsidian').setup({
        workspaces = {
            {
                name = 'obsidian-vault',
                path = vault_path,
            }
        },
        notes_subdir = '01-Fleeting Notes',
        new_notes_location = 'notes_subdir',
        note_id_func = function(title)
            local id = title ~= nil and title or tostring(os.time())
            return id
        end,
        disable_frontmatter = true,
        daily_notes = {
            folder = '05-Journal',
        },
        templates = {
            folder = '99-Templates'
        },
        ui = { enable = false },
        attachments = {
            img_folder = 'assets/img',
        }
    })

    require('plugins.obsidian-sync').setup({
        vault_path = vault_path,
        autosync = true,
    })

    -- KEYMAPS
    vim.keymap.set(
        '',
        '<leader>ob',
        '<Cmd>Obsidian backlinks<CR>',
        { desc = 'Find backlinks' }
    )

    vim.keymap.set(
        '',
        '<leader>od',
        '<Cmd>Obsidian dailies<CR>',
        { desc = 'Find daily notes' }
    )

    vim.keymap.set(
        '',
        '<leader>ol',
        '<Cmd>Obsidian links<CR>',
        { desc = 'Find links in the buffer' }
    )

    vim.keymap.set(
        '',
        '<leader>on',
        '<Cmd>Obsidian new<CR>',
        { desc = 'Create new note' }
    )

    vim.keymap.set(
        '',
        '<leader>oj',
        '<Cmd>Obsidian today<CR>',
        { desc = 'Open today daily note' }
    )

    vim.keymap.set(
        '',
        '<leader>of',
        '<Cmd>Obsidian search<CR>',
        { desc = 'Find notes' }
    )

    vim.keymap.set(
        '',
        '<leader>ot',
        '<Cmd>Obsidian tags<CR>',
        { desc = 'Find tags' }
    )
end)

later(function()
    add('rolv-apneseth/tfm.nvim')

    require('tfm').setup({
        file_manager = "lf",
        replace_netrw = true,
        enable_cmds = true,
        ui = {
            border = vim.opt.winborder:get(),
            height = 0.8,
            width = 0.9,
        }
    })

    vim.keymap.set(
        'n',
        '<leader>ee',
        '<Cmd>Tfm<CR>',
        { desc = "Open file explorer" }
    )
end)
