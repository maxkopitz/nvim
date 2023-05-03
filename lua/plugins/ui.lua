return {
  {'kyazdani42/nvim-web-devicons'},
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup
    {
      open_mapping = [[\\]],
      hide_numbers = true,
    }
    end
  },

}
