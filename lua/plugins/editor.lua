return {
  -- toggleterm
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
