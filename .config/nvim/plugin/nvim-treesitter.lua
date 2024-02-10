require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'css',
        'html',
        'ini',
        'javascript',
        'lua',
        'make',
        'python',
        'toml',
        'vim',
        'vimdoc',
        'yaml'
    },
    highlight = { enable = true }
})
