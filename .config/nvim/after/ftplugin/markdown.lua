vim.opt_local.colorcolumn = '0'
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.spelllang = 'es,en'

vim.b.pandoc_compiler_args = '--pdf-engine=lualatex --template apa7 --listings'
vim.cmd.compiler('pandoc')

-- Add bold, italics and link surrounds to 'mini.surround'
local has_mini_surround, mini_surround = pcall(require, 'mini.surround')

if has_mini_surround then
    vim.b.minisurround_config = {
        custom_surroundings = {
            -- Bold
            B = {
                input = { '%*%*().-()%*%*' },
                output = { left = '**', right = '**' }
            },

            -- Italics
            i = {
                input = { '%*().-()%*' },
                output = { left = '*', right = '*' }
            },

            -- Link
            l = {
                input = { '%[().-()%]%(.-%)' },
                output = function()
                    local link = mini_surround.user_input('Link')
                    return { left = '[', right = '](' .. link .. ')' }
                end,
            },
        },
    }
end


-- PLUGINS

vim.pack.add({
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/bullets-vim/bullets.vim',
    'https://github.com/brianhuster/live-preview.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/obsidian-nvim/obsidian.nvim',
})

-- render-markdown
require('render-markdown').setup({
    render_modes = true,
    latex = {
        position = 'replace',
    },
    heading = {
        icons = false,
    },
    bullet = {
        icons = false,
    },
    code = {
        border = 'thin',
    },
    pipe_table = {
        cell = 'trimmed',
    },
    checkbox = {
        checked = { scope_highlight = '@markup.strikethrough' },
        custom = {
            todo = {
                raw = '[-]',
                rendered = '⊟ ',
                highlight = 'RenderMarkdownUnchecked',
                scope_highlight = nil
            },
        },
    },
})

vim.keymap.set(
    'n',
    '<leader>mr',
    require('render-markdown').toggle,
    { desc = "Toggle Markdown Rendering" }
)


-- bullets.vim
vim.g.bullets_checkbox_markers = ' -x'


-- obsidian.nvim
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

vim.keymap.set(
    '',
    '<leader>on',
    '<Cmd>Obsidian new<CR>',
    { desc = 'Create new note' }
)

vim.keymap.set(
    '',
    '<leader>of',
    '<Cmd>Obsidian search<CR>',
    { desc = 'Find notes' }
)
