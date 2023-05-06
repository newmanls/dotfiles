-- Interface
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.laststatus = 1
vim.opt.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = 'on'
vim.opt.termguicolors = true

-- Behavior
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.scrolloff = 4
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Line wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Searching
vim.opt.smartcase = true

-- Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

vim.api.nvim_create_autocmd('BufWrite', {
    callback = function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'html',
    callback = function() vim.opt_local.shiftwidth = 2 end
})
