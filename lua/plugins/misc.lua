return {
  {
    'jdhao/better-escape.vim',
    event = 'InsertEnter',
  },
  {
    'windwp/nvim-autopairs',
    opts = {

      disable_filetype = { 'TelescopePrompt', 'vim' },
    }

  },
  {
    'windwp/nvim-ts-autotag'
  },
  { '907th/vim-auto-save', event = 'InsertEnter' },
  -- .tmux.conf syntax highlighting and setting check
  { 'tmux-plugins/vim-tmux', ft = { 'tmux' } },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
  char = '┊',
  show_trailing_blankline_indent = false,

    }
  }, -- Add indentation guides even on blank lines

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
}
