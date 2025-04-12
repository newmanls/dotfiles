vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.laststatus = 2
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
    float = { border = 'rounded' },
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
