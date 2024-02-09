require('mini.align').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.files').setup({
    mappings = {
        go_in_plus  = 'l',
        go_out_plus = 'h',
    },
    windows = {
        preview = true,
    }
})

require('mini.hipatterns').setup({
    highlighters = {
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
    }
})

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

require('mini.notify').setup()
require('mini.move').setup({
    mappings = {
        down = '<C-j>',
        up = '<C-k>',
        line_down = '<C-j>',
        line_up = '<C-k>',
    },
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
                local environment = MiniSurround.user_input('LaTeX environment')
                if environment == nil then return nil end
                return {
                    left = '\\begin{' .. environment .. '}\n',
                    right = '\n\\end{' .. environment .. '}'
                }
            end,
        },
    },
})

require('mini.trailspace').setup()

-- Autocommands
vim.api.nvim_create_autocmd('BufWrite', {
    callback = function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
    end
})

-- Mappings
vim.keymap.set('n', '<leader>e', function() MiniFiles.open() end)
vim.keymap.set('', '<CR>', function()
    MiniJump2d.start(require('mini.jump2d').builtin_opts.single_character)
end)
