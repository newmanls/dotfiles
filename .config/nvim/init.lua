require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' };
    { 'catppuccin/nvim', as = 'catppuccin' };

    -- Utils
    'mattn/emmet-vim';
    'derektata/lorem.nvim';
    { 'iamcco/markdown-preview.nvim', build = ':call mkdp#util#install' };
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'norcalli/nvim-colorizer.lua';
    'nvim-tree/nvim-tree.lua';
    'nvim-tree/nvim-web-devicons';
    'mzlogin/vim-markdown-toc';
}
