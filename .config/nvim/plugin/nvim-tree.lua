vim.g.nvim_tree_symlink_arrow = ' > '

require'nvim-tree'.setup {
  hijack_cursor = true,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
}
