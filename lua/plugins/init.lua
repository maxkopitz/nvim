local default_plugins = {
  'kyazdani42/nvim-web-devicons',

  -------------- Themes  --------------
  'navarasu/onedark.nvim',
  'folke/tokyonight.nvim',
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- ful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      -- For formatting
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      require('plugins.configs.lsp')
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot')
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup {
        suggestion = { enable = false },
        panel = { enable = false },
      }
    end,
  },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-omni' },

  -------------- Navigation --------------
  { 'akinsho/bufferline.nvim', event = 'VimEnter', dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.configs.bufferline') end, },
  { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.configs.nvim-tree') end, },
  { 'jdhao/better-escape.vim', event = 'InsertEnter' },
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.configs.telescope') end, },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  -- Better Quick Fix
  { 'kevinhwang91/nvim-bqf', ft = 'qf', config = function() require('plugins.configs.bqf') end, },
  { 'nvim-lualine/lualine.nvim', config = function() require('plugins.configs.lualine') end, },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function() require('plugins.configs.nvim-treesitter') end,
  },

  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs") end,
  },
  { 'windwp/nvim-ts-autotag' },

  { 'MunifTanjim/prettier.nvim', config = function() require('plugins.configs.prettier') end },

  -------------- Git related plugins --------------
  { 'tpope/vim-fugitive', config = function() require('plugins.configs.vim-fugitive') end, },
  'tpope/vim-rhubarb',
  { 'lewis6991/gitsigns.nvim', config = function() require('plugins.configs.gitsigns') end, },

  { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.configs.indent_blankline') end }, -- Add indentation guides even on blank lines
  { 'numToStr/Comment.nvim', config = function() require('plugins.configs.comment') end, }, -- "gc" to comment visual regions/lines

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('plugins.configs.git-linker') end,
  },
  -- Spruce up the command bar
  { 'gelguy/wilder.nvim', config = function() require('plugins.configs.wilder') end, },

  -------------- General Plugins --------------
  { '907th/vim-auto-save', event = 'InsertEnter' },
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  --
  { 'folke/which-key.nvim', event = 'BufWinEnter', config = function() require('plugins.configs.which-key') end, },

  -- .tmux.conf syntax highlighting and setting check
  { 'tmux-plugins/vim-tmux', ft = { 'tmux' } },

  { "akinsho/toggleterm.nvim", version = '*', config = function() require('plugins.configs.toggleterm') end, },
}

local lazy_config = vim.tbl_deep_extend("force", require "plugins.configs.lazy_nvim", {})

require("lazy").setup(default_plugins, {})
