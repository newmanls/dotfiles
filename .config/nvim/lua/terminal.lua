local term_buf = nil
local term_win_id = nil

function ToggleTerminal()
    if vim.fn.win_gotoid(term_win_id) == 1 then
        -- Close Terminal
        vim.api.nvim_command('hide')
    else
        -- Open Terminal
        if vim.fn.bufexists(term_buf) ~= 1 then
            vim.api.nvim_command('split | terminal')
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            term_buf = vim.fn.bufnr('%')
        elseif vim.fn.win_gotoid(term_win_id) ~= 1 then
            vim.api.nvim_command('sbuffer ' .. term_buf)
        end

        vim.api.nvim_command('wincmd J | startinsert')
        vim.api.nvim_win_set_height(0, 16)
        term_win_id = vim.fn.win_getid()
    end
end
