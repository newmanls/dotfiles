require('colorizer').setup(nil, { css = true, })
require('mason').setup()
require('kanagawa').setup({
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
})

vim.cmd('colorscheme kanagawa')
