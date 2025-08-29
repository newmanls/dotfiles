local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add('sainnhe/gruvbox-material')

    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_better_performance = true

    vim.cmd.colorscheme('gruvbox-material')
end)
