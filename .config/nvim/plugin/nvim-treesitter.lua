require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'css',
        'html',
        'javascript',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'vim',
        'vimdoc'
    },
    highlight = { enable = true }
})
