require('options')
require('mappings')
require('paq') {
    -- Plugin Manager
    'savq/paq-nvim';

    -- Colorscheme
    {'folke/tokyonight.nvim', branch = 'main'};

    -- Syntax highlighting
    'nvim-treesitter/nvim-treesitter';
    'lukas-reineke/indent-blankline.nvim';
    'norcalli/nvim-colorizer.lua';

    -- Completion
    'jiangmiao/auto-pairs';
    'mattn/emmet-vim';

    -- Shortcuts
    'kylechui/nvim-surround';
    'numToStr/Comment.nvim';
    'phaazon/hop.nvim';

    -- Utils
    'jghauser/mkdir.nvim';
    'godlygeek/tabular';

    -- Markdown
    'preservim/vim-markdown';
}
