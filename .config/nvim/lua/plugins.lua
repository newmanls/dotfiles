return {
    {
        'jghauser/mkdir.nvim',
        event = 'VeryLazy'
    },
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = true,
        cmd = 'Oil',
        keys = {
            { '-', '<Cmd>Oil<CR>' }
        },
        config = true
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        config = true
    },
    {
        'mattn/emmet-vim',
        lazy = true,
        ft = { 'html', 'htmldjango' }
    }
}
