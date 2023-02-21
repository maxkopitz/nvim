return {
  'kyazdani42/nvim-web-devicons',
  {
    'jdhao/better-escape.vim',
    event = 'InsertEnter',
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require 'nvim-autopairs'
    end,
  },
  { 'windwp/nvim-ts-autotag' },
  { '907th/vim-auto-save', event = 'InsertEnter' },
  {
    'folke/which-key.nvim',
    event = 'BufWinEnter',
    config = function()
      require 'plugins.configs.which-key'
    end,
  },

  -- .tmux.conf syntax highlighting and setting check
  { 'tmux-plugins/vim-tmux', ft = { 'tmux' } },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require 'plugins.configs.toggleterm'
    end,
  },
}
