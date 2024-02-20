return {
    {
        'echasnovski/mini.align',
        version = false,
        event = 'VeryLazy',
        config = true
    },
    {
        'echasnovski/mini.comment',
        version = false,
        event = 'VeryLazy',
        config = true
    },
    {
        'echasnovski/mini.completion',
        version = false,
        config = true
    },
    {
        'echasnovski/mini.move',
        version = false,
        event = 'VeryLazy',
        config = true
    },
    {
        'echasnovski/mini.pairs',
        version = false,
        event = 'VeryLazy',
        config = true
    },
    {
        'echasnovski/mini.splitjoin',
        version = false,
        event = 'VeryLazy',
        keys = {
            { '<leader>ss', function() MiniSplitjoin.split() end },
            { '<leader>sj', function() MiniSplitjoin.join() end },
            { '<leader>st', function() MiniSplitjoin.toggle() end },
        },
        config = true
    },
    {
        'echasnovski/mini.surround',
        version = false,
        event = 'VeryLazy',
        config = true
    },
    {
        'echasnovski/mini.hipatterns',
        version = false,
        event = 'VeryLazy',
        config = function()
            require('mini.hipatterns').setup({
                highlighters = {
                    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
                }
            })
        end

    },
    {
        'echasnovski/mini.indentscope',
        version = false,
        event = 'VeryLazy',
        config = function()
            require('mini.indentscope').setup({
                draw = {
                    delay = 0,
                    animation = require('mini.indentscope').gen_animation.none()
                },
                symbol = '│'
            })
        end
    },
    {
        'echasnovski/mini.trailspace',
        version = false,
        event = 'VeryLazy',
        config = function()
            require('mini.trailspace').setup({})

            vim.api.nvim_create_autocmd('BufWrite', {
                callback = function()
                    MiniTrailspace.trim()
                    MiniTrailspace.trim_last_lines()
                end
            })
        end
    }
}
