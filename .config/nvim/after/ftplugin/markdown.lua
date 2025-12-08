vim.opt_local.colorcolumn = '0'
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.spelllang = 'es,en'

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
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add({
        source = 'OXY2DEV/markview.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    })

    local presets = require("markview.presets");
    local list_item = {
        add_padding = false,
        text = "•",
    }

    require("markview").setup({
        preview = {
            hybrid_modes = { "n" },
        },
        markdown = {
            headings = presets.headings.glow,
            horizontal_rules = presets.horizontal_rules.thin,
            list_items = {
                marker_minus = list_item,
                marker_plus = list_item,
                marker_star = list_item,
                marker_dot = {
                    add_padding = false,
                },
                marker_parenthasis = {
                    add_padding = false,
                }
            },
            tables = presets.tables.none,
        },
        markdown_inline = {
            checkboxes = presets.checkboxes.nerd,
        },
    })

    vim.keymap.set(
        'n',
        '<leader>mr',
        '<Cmd>Markview toggle<CR>',
        {desc = "Toggle Markdown Rendering"}
    )
end)

later(function()
    add('bullets-vim/bullets.vim')
    vim.g.bullets_checkbox_markers = ' -x'
end)

later(function() require('plugins.find-md-headers') end)
