return require'packer'.startup(function() 
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use "EdenEast/nightfox.nvim" -- Packer
  use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-lualine/lualine.nvim'
  }


  use {'neoclide/coc.nvim', branch = 'release'}

  use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
  end
  }

  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup{}

  use 'chrisbra/Colorizer'

  use { 'romgrk/barbar.nvim' }
end)
