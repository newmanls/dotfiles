require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Syntax highlighting
    'navarasu/onedark.nvim';
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
    'norcalli/nvim-colorizer.lua';

    -- Utils
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'mattn/emmet-vim';
}
