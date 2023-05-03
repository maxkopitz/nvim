return {
  -- tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = true,
    config = function()
      require('tokyonight').setup {
        style = 'moon'
      }
    end
  },

  -- catppuccin
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
  },
  { 'navarasu/onedark.nvim', lazy = true },
}
