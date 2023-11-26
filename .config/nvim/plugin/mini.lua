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
require('mini.surround').setup()
require('mini.trailspace').setup()
