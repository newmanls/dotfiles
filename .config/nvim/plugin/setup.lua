require('colorizer').setup(nil, { css = true, })
require('kanagawa').setup({
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
})

vim.cmd('colorscheme kanagawa')
