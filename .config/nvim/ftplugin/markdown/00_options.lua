vim.opt_local.colorcolumn = '0'
vim.opt_local.spell = true
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
