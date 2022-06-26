require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Colorscheme
    {'folke/tokyonight.nvim', branch = 'main'};

    -- Syntax highlighting
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
    'lukas-reineke/indent-blankline.nvim';
    'norcalli/nvim-colorizer.lua';

    -- Completion
    'jiangmiao/auto-pairs';
    'tpope/vim-surround';
    'mattn/emmet-vim';

    -- Shortcuts
    'phaazon/hop.nvim';
    'numToStr/Comment.nvim';

    -- Utils
    'jghauser/mkdir.nvim';
    'godlygeek/tabular';

    -- Markdown
    'preservim/vim-markdown';
}
