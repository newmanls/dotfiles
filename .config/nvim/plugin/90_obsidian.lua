vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/OXY2DEV/markview.nvim',
    'https://github.com/bullets-vim/bullets.vim',
    'https://github.com/obsidian-nvim/obsidian.nvim',
})

local vault_path = '~/Documents/Obsidian'

require('obsidian').setup({
    legacy_commands = false,
    workspaces = {
        {
            name = 'obsidian-vault',
            path = vault_path,
        }
    },
    notes_subdir = '01-Fleeting Notes',
    new_notes_location = 'notes_subdir',
    note_id_func = function(title)
        local id = title ~= nil and title or tostring(os.time())
        return id
    end,
    frontmatter = {
        enabled = false,
    },
    daily_notes = {
        folder = '05-Journal',
    },
    templates = {
        folder = '99-Templates'
    },
    ui = { enable = false },
})

require('plugins.obsidian-sync').setup({
    vault_path = vault_path,
    autosync = false,
})

-- KEYMAPS
vim.keymap.set(
    '',
    '<leader>ob',
    '<Cmd>Obsidian backlinks<CR>',
    { desc = 'Find backlinks' }
)

vim.keymap.set(
    '',
    '<leader>od',
    '<Cmd>Obsidian dailies<CR>',
    { desc = 'Find daily notes' }
)

vim.keymap.set(
    '',
    '<leader>ol',
    '<Cmd>Obsidian links<CR>',
    { desc = 'Find links in the buffer' }
)

vim.keymap.set(
    '',
    '<leader>on',
    '<Cmd>Obsidian new<CR>',
    { desc = 'Create new note' }
)

vim.keymap.set(
    '',
    '<leader>oj',
    '<Cmd>Obsidian today<CR>',
    { desc = 'Open today daily note' }
)

vim.keymap.set(
    '',
    '<leader>of',
    '<Cmd>Obsidian search<CR>',
    { desc = 'Find notes' }
)

vim.keymap.set(
    '',
    '<leader>ot',
    '<Cmd>Obsidian tags<CR>',
    { desc = 'Find tags' }
)
