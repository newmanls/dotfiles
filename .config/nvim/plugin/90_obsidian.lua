vim.pack.add({ 'https://github.com/nvim-lua/plenary.nvim' })

require('plugins.obsidian-sync').setup({
    vault_path = '~/Documents/Obsidian',
    autosync = false,
})
