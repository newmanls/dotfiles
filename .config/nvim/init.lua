require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';
    'williamboman/mason.nvim';

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' };
    'rebelot/kanagawa.nvim';
    'norcalli/nvim-colorizer.lua';

    -- Autocompletion and formatting
    'mattn/emmet-vim';
    'derektata/lorem.nvim';
    'mzlogin/vim-markdown-toc';
    'neovim/nvim-lspconfig';
    'tell-k/vim-autopep8';

    -- Utils
    { 'iamcco/markdown-preview.nvim', build = ':call mkdp#util#install' };
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'nvim-tree/nvim-tree.lua';
    'nvim-tree/nvim-web-devicons';
    'tpope/vim-dadbod';
}
