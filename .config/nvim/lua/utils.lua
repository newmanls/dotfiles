function map(mode, shortcut, command, new_options)
    local options = { silent = true }
    if new_options then
        options = vim.tbl_extend("force", options, new_options)
    end
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

-- TermToggle
vim.cmd[[
    let g:term_buf = 0
    let g:term_win = 0

    function! TermToggle(height)
        if win_gotoid(g:term_win)
            hide
        else
            botright new
            exec "resize " . a:height
            try
                exec "buffer " . g:term_buf
            catch
                call termopen($SHELL, {"detach": 0})
                let g:term_buf = bufnr("")
                set nonumber
                set norelativenumber
                set signcolumn=no
            endtry
            startinsert!
            let g:term_win = win_getid()
        endif
    endfunction
]]
