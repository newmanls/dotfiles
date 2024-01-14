require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- LSP
    'williamboman/mason.nvim';
    'williamboman/mason-lspconfig.nvim';
    'neovim/nvim-lspconfig';

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' };
    'navarasu/onedark.nvim';
    'norcalli/nvim-colorizer.lua';

    -- Autocompletion and formatting
    'mattn/emmet-vim';
    'derektata/lorem.nvim';
    'mzlogin/vim-markdown-toc';
    'tell-k/vim-autopep8';
    'lervag/vimtex';
    'dcampos/nvim-snippy';

    -- Utils
    { 'toppair/peek.nvim', build = 'deno task --quiet build:fast' };
    'echasnovski/mini.nvim';
    'jghauser/mkdir.nvim';
    'nvim-tree/nvim-web-devicons';
    'tpope/vim-dadbod';
}
