require('mini.hues').setup({
    background = '{{ colors.surface_container.default.hex }}',
    foreground = '{{ colors.on_surface.default.hex }}',
    accent = 'fg',
})

vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', {
    bg = '{{ colors.primary_container.default.hex }}',
})

vim.api.nvim_set_hl(0, 'CursorLineNr', {
    fg = '{{ colors.secondary.default.hex }}',
})
