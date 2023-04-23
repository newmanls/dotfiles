require('colorizer').setup()
require('mini.align').setup()
require('mini.comment').setup()

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

require('onedark').setup({
    style = 'darker'
})

require('onedark').load()

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash', 'c', 'css', 'html', 'javascript', 'lua', 'markdown',
        'markdown_inline', 'python', 'vim', 'vimdoc'
    },
    highlight = { enable = true }
})
