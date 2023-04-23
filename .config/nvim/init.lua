require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
    'navarasu/onedark.nvim';
    'norcalli/nvim-colorizer.lua';

    -- Utils
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'mattn/emmet-vim';
}
