-- OPTIONS
vim.o.colorcolumn = '80'
vim.o.winborder = 'single'
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

-- Behavior
vim.o.clipboard = 'unnamedplus'
vim.o.confirm = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 24
vim.o.splitright = true
vim.o.splitbelow = true

-- Indentation
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true

-- Line wrapping
vim.o.wrap = false
vim.o.breakindent = true
vim.o.linebreak = true

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Netrw
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3


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
-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            -- defer centering slightly so it's applied after render
            vim.schedule(function()
                vim.cmd("normal! zz")
            end)
        end
    end,
})

-- automatically resize splits when the terminal window is resized
vim.api.nvim_create_autocmd('VimResized', {
    command = 'wincmd ='
})

-- Make parent directories as needed when creating a new file.
-- Original code from <https://github.com/jghauser/mkdir.nvim>.
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')

        -- This handles URLs using netrw. See ':help netrw-transparent' for details.
        if dir:find('%l+://') == 1 then
            return
        end

        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end
})

-- Source mini_hues on SIGUSR1
vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    command = ":source ~/.config/nvim/plugin/99_mini_hues.lua"
})


-- PLUGINS
-- Automatically download mini.deps
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup()
