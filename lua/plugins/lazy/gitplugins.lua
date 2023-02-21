return {
  {
    'tpope/vim-fugitive',
    config = function()
      require 'plugins.configs.vim-fugitive'
    end,
  },
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'plugins.configs.gitsigns'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'plugins.configs.indent_blankline'
    end,
  }, -- Add indentation guides even on blank lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require 'plugins.configs.comment'
    end,
  }, -- "gc" to comment visual regions/lines

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require 'plugins.configs.git-linker'
    end,
  },
}
