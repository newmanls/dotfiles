require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
    { 'catppuccin/nvim', as = 'catppuccin' };

    -- Utils
    'mattn/emmet-vim';
    'mbpowers/lorem-nvim';
    { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install' };
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'norcalli/nvim-colorizer.lua';
    'nvim-tree/nvim-tree.lua';
    'nvim-tree/nvim-web-devicons';
}
