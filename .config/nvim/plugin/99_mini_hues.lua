require('mini.hues').setup({
    background = '#221e24',
    foreground = '#e9e0e8',
    accent = 'fg',
})

vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', {
    bg = '#593a6e',
})

vim.api.nvim_set_hl(0, 'CursorLineNr', {
    fg = '#d2c1d9',
})
