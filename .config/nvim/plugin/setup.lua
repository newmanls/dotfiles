require('colorizer').setup(nil, { css = true, })
require('mason').setup()
require('nvim-tree').setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})
require('kanagawa').setup({
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
})

vim.cmd('colorscheme kanagawa')
