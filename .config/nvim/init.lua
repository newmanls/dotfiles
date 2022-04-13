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

  -- Nvim Tree
  'kyazdani42/nvim-web-devicons';
  'kyazdani42/nvim-tree.lua';

  -- Shortcuts
  'phaazon/hop.nvim';
  'terrortylor/nvim-comment';

  -- Utils
  'drzel/vim-scrolloff-fraction';
  'jghauser/mkdir.nvim';
  'godlygeek/tabular';
  
  -- Markdown
  'preservim/vim-markdown';
}
