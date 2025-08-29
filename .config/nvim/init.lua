-- OPTIONS
vim.o.colorcolumn = '80'
vim.o.winborder = 'single'
vim.o.cursorline = true
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.syntax = 'on'
vim.o.termguicolors = true

-- Behavior
vim.o.clipboard = 'unnamedplus'
vim.o.confirm = true
vim.o.scrolloff = 4
vim.o.splitright = true
vim.o.splitbelow = true

-- Indentation
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true

-- Line wrapping
vim.o.breakindent = true
vim.o.linebreak = true

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true


-- KEYMAPS
-- Set <Space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move between visible lines
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

-- Remove highlights with <Esc>
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')


-- AUTOCMDS
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})


-- PLUGINS
-- Automatically download mini.deps
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup()
