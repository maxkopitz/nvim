local utils = require 'utils'
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { 'kyazdani42/nvim-web-devicons' }

  -------------- Themes  --------------
  use { 'navarasu/onedark.nvim' } -- Theme inspired by Atom
  use { 'folke/tokyonight.nvim' }

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      -- For formatting
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = [[require('config.lsp')]],
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = [[require('config.copilot')]],
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup {
        suggestion = { enable = false },
        panel = { enable = false },
      }
    end,
  }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }

  -------------- Navigation --------------
  use { 'akinsho/bufferline.nvim', event = 'VimEnter', requires = { 'kyazdani42/nvim-web-devicons' }, config = [[require('config.bufferline')]] }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, config = [[require('config.nvim-tree')]] }
  use { 'jdhao/better-escape.vim', event = 'InsertEnter' }
  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' }, config = [[require('config.telescope')]] }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  -- Better Quick Fix
  use { 'kevinhwang91/nvim-bqf', ft = 'qf', config = "require('config.bqf')" }
  use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = [[require('config.nvim-treesitter')]],
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'windwp/nvim-autopairs',
    config = [[require("config.nvim-autopairs")]],
  }
  use { 'windwp/nvim-ts-autotag' }

  use { 'MunifTanjim/prettier.nvim', config = [[require('config.prettier')]] }

  -------------- Git related plugins --------------
  use { 'tpope/vim-fugitive', config = [[require('config.vim-fugitive')]] }
  use 'tpope/vim-rhubarb'
  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

  use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent_blankline')]] } -- Add indentation guides even on blank lines
  use { 'numToStr/Comment.nvim', config = [[require('config.comment')]] } -- "gc" to comment visual regions/lines

  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require('config.git-linker')]],
  }
  -- Spruce up the command bar
  use { 'gelguy/wilder.nvim', config = "require('config.wilder')" }

  -------------- General Plugins --------------
  use { '907th/vim-auto-save', event = 'InsertEnter' }
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  --
  use { 'folke/which-key.nvim', event = 'BufWinEnter', config = "require('config.which-key')" }

  if utils.executable 'tmux' then
    -- .tmux.conf syntax highlighting and setting check
    use { 'tmux-plugins/vim-tmux', ft = { 'tmux' } }
  end

  -------------- Custom Plugins ---------------
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
