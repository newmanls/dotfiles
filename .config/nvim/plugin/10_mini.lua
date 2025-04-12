local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
    MiniIcons.tweak_lsp_kind()
end)

now(function() require('mini.completion').setup() end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.splitjoin').setup() end)

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
            { mode = 'n', keys = '<Leader>f', desc = '+FzfLua' },
            { mode = 'n', keys = '<Leader>e', desc = '+Explorer' },
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
            snippets.gen_loader.from_file('~/.config/nvim/snippets/_.json'),
            snippets.gen_loader.from_lang(),
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
