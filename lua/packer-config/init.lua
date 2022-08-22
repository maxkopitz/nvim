local fn = vim.fn

-- Automatically install packer.nvim
local install_path = fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

return require'packer'.startup {
  function(use) 
    use { 'wbthomason/packer.nvim',  opt = true }
    use { 'lewis6991/impatient.nvim'} 

    use 'lewis6991/impatient.nvim'

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
    use { 'romgrk/barbar.nvim'} 
  end
}
