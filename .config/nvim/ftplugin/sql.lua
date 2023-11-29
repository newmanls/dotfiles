local map = vim.keymap.set

-- Make sure to configure the database connection in ~/.my.cnf first
map('n', '<F5>', '<Cmd>%DB mysql:<CR>', { buffer = true })
