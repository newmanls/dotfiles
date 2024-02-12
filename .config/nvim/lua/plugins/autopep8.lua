return {
    'tell-k/vim-autopep8',
    ft = 'python',
    lazy = true,
    config = function()
        vim.g.autopep8_disable_show_diff = 1
        vim.g.autopep8_on_save = 1
    end
}
