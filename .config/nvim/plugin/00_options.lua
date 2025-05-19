vim.opt.colorcolumn = '80'
vim.opt.winborder = 'single'
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = 'on'
vim.opt.termguicolors = true

-- Behavior
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.updatetime = 500
vim.opt.scrolloff = 4
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true

-- Line wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
})

-- Open floating diagnostic on cursor move
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

-- Autocmds
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
