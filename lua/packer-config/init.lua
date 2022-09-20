local fn = vim.fn

vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

local fresh_install = false

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_dir) == "" then
  fresh_install = true

  -- Now we need to install packer.nvim first.
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)

  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

vim.cmd("packadd packer.nvim")

local packer = require("packer");
local packer_util = require("packer.util")

packer.startup {
  function(use) 
    use { 'wbthomason/packer.nvim',  opt = true }

    use { 'lewis6991/impatient.nvim'} 

    use {'glepnir/dashboard-nvim'}

    use { 'kyazdani42/nvim-web-devicons' } 

    use { "EdenEast/nightfox.nvim" } -- Packer

    use { 'kyazdani42/nvim-tree.lua' }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        'windwp/nvim-ts-autotag', -- Automatically end & rename tags
        -- Dynamically set commentstring based on cursor location in file
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/playground',
      },
    }

    use { 'nvim-lualine/lualine.nvim' }

    use { 'neoclide/coc.nvim', branch = 'release' }

    use {
	    'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} 
      end
    }  
    use { 'chrisbra/Colorizer' }
    use { 
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    } 
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
      cmd = "Telescope",         
      requires = { {'nvim-lua/plenary.nvim'} }
}

  end
}

if fresh_install then
  packer.sync()
end 
