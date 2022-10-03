require('bufferline').setup  {
  options = {
    numbers = "buffer_id",
    tab_size = 10,
    max_name_length = 18,
    max_prefix_length = 15,
    diagnostics = false,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      },
      {
        filetype = "Vista",
        text = "Vista",
        separator = true,
      }
    }

  }
}
