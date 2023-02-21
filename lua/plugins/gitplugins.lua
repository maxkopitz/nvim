return {
  {
    'tpope/vim-fugitive',
  },
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  },
  {
    'numToStr/Comment.nvim',
  }, -- "gc" to comment visual regions/lines

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
}
