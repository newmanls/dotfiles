local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
end)

now(function() require('mini.completion').setup() end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.splitjoin').setup() end)

later(function ()
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
