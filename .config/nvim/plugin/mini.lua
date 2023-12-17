require('mini.align').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.indentscope').setup({
    draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none()
    },
    symbol = '│'
})

require('mini.jump2d').setup({
    view = { dim = true },
    mappings = { start_jumping = '' }
})

require('mini.pairs').setup()
require('mini.surround').setup({
    custom_surroundings = {
        ['c'] = {
            input = { '\\%a+%b{}', '^.-%{().*()%}$' },
            output = function()
                local command = MiniSurround.user_input('LaTeX command')
                if command == nil then return nil end
                return { left = '\\' .. command .. '{', right = '}' }
            end,
        },
        ['e'] = {
            input = { '\\begin(%b{}).-\\end%1', '^.-%s().*()%s.-$' },
            output = function()
                local command = MiniSurround.user_input('LaTeX environment')
                if command == nil then return nil end
                return {
                    left = '\\begin{' .. command .. '}\n',
                    right = '\n\\end{' .. command .. '}'
                }
            end,
        },
    },
})
require('mini.trailspace').setup()

vim.api.nvim_create_autocmd('BufWrite', {
    callback = function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
    end
})
