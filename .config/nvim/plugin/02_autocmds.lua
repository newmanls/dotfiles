vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function ()
        vim.opt_local.relativenumber=false
    end
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function ()
        vim.opt_local.relativenumber=true
    end
})
