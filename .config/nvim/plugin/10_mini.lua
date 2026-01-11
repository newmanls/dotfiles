local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require('mini.icons').setup()
    later(MiniIcons.mock_nvim_web_devicons())
    later(MiniIcons.tweak_lsp_kind())
end)

now(function()
    require('mini.statusline').setup()
    MiniStatusline.section_location = function() return '%3l:%-3v %P' end
    vim.o.showmode = false
end)

now(function() require('mini.completion').setup() end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.diff').setup() end)
later(function() require('mini.extra').setup() end)
later(function() require('mini.git').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.splitjoin').setup() end)

later(function()
    require('mini.notify').setup({
        content = {
            format = function(notification)
                return notification.msg
            end
        },
        lsp_progress = { enable = false },
        window = { winblend = 0 },
    })

    vim.notify = MiniNotify.make_notify()
end)

later(function()
    require('mini.pick').setup({
        window = {
            prompt_caret = '█',
        },
    })

    vim.ui.select = MiniPick.ui_select

    vim.keymap.set(
        'n',
        '<leader>ff',
        '<Cmd>Pick files<CR>',
        { desc = "Find files" }
    )
    vim.keymap.set(
        'n',
        '<leader>fb',
        '<Cmd>Pick buffers<CR>',
        { desc = "Find buffers" }
    )
    vim.keymap.set(
        'n',
        '<leader>fg',
        '<Cmd>Pick grep_live<CR>',
        { desc = "Find pattern in current project" }
    )
    vim.keymap.set(
        'n',
        '<leader>fd',
        '<Cmd>Pick diagnostic<CR>',
        { desc = "Find workspace diagnostics" }
    )
    vim.keymap.set(
        'n',
        '<leader>fh',
        '<Cmd>Pick help<CR>',
        { desc = "Find help tags" }
    )
end)

later(function()
    local miniclue = require('mini.clue')
    miniclue.setup({
        triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
        },
        clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
            { mode = 'n', keys = '<Leader>f', desc = '+Pick' },
            { mode = 'n', keys = '<Leader>e', desc = '+Explorer' },
            { mode = 'n', keys = '<Leader>o', desc = '+Obsidian' },
            { mode = 'v', keys = '<Leader>o', desc = '+Obsidian' },
        },
    })
end)

later(function()
    local indentscope = require("mini.indentscope")

    indentscope.setup({
        draw = {
            delay = 0,
            animation = indentscope.gen_animation.none()
        },
        symbol = "│"
    })
end)

later(function()
    require('mini.operators').setup({
        exchange = { prefix = '' },
        multiply = { prefix = '' },
        replace = { prefix = '' },
    })
end)

later(function()
    local snippets = require('mini.snippets')

    snippets.setup({
        snippets = {
            snippets.gen_loader.from_file('~/.config/nvim/after/snippets/_.json'),
            snippets.gen_loader.from_lang({
                lang_patterns = {
                    markdown_inline = { 'markdown.json' },
                }
            }),
        },
    })
end)

later(function()
    require('mini.trailspace').setup()

    vim.api.nvim_create_autocmd("BufWrite", {
        callback = function()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
        end
    })
end)
