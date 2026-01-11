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
