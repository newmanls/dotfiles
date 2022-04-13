require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    --disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  }
}
