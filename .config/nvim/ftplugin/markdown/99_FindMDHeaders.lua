-- Plugin: markdown_headers
-- This plugin provides a command to jump to markdown headers

local M = {}

-- Returns a table containing all markdown headers in the current buffer.
function M.get_headers()
    local headers = {}
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    for idx, line in ipairs(lines) do
        -- Trim leading whitespace.
        local trimmed = line:match('^%s*(.-)$')
        if trimmed:match('^#+%s') then
            local level, header_text = trimmed:match('^(#+)%s+(.*)')
            table.insert(headers, {
                line_number = idx,
                level = #level,
                text = header_text
            })
        end
    end

    return headers
end

-- Use vim.ui.select to choose a header and jump to it.
function M.find_headers()
    local headers = M.get_headers()

    if vim.tbl_isempty(headers) then
        vim.notify('No markdown headers found.', vim.log.levels.INFO)
        return
    end

    -- Prepare the items for vim.ui.select.
    local items = {}
    for _, header in ipairs(headers) do
        local tabs = string.rep('    ', header.level - 1)
        local display = string.format('%s - %s', tabs, header.text)

        table.insert(items, {
            display = display,
            line_number = header.line_number
        })
    end

    vim.ui.select(
        items,
        {
            prompt = 'Headers',
            format_item = function(item) return item.display end
        },
        function(selection)
            if selection then
                vim.api.nvim_win_set_cursor(0, { selection.line_number, 0 })
            end
        end
    )
end

-- Define a user command to trigger the header jump.
vim.api.nvim_create_user_command(
    'FindMDHeaders',
    function() M.find_headers() end,
    {}
)

vim.keymap.set(
    'n',
    '<leader>fm',
    '<Cmd>FindMDHeaders<CR>',
    { desc = 'Find markdown headers' }
)
