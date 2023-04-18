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
    'echasnovski/mini.align';
    'echasnovski/mini.comment';
    'echasnovski/mini.indentscope';
    'echasnovski/mini.jump2d';
    'echasnovski/mini.pairs';
    'echasnovski/mini.surround';
    'echasnovski/mini.trailspace';
    'jghauser/mkdir.nvim';
    'mattn/emmet-vim';
}
