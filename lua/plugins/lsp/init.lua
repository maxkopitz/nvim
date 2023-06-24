return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    config = function()
      require('copilot').setup {}
    end,
  },
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
    },
    config = function()
      require 'plugins.lsp.config'
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
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
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
  { 'jose-elias-alvarez/null-ls.nvim' },
}
