vim.opt_local.formatprg = 'autopep8 %'

vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', '<Cmd>w | !python %<CR>', { noremap = true })
