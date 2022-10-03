require('bufferline').setup  {
  options = {
    numbers = "buffer_id",
    tab_size = 10,
    max_name_length = 18,
    max_prefix_length = 15,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end

    return ''
    end,
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
        hightlight = "Directory",
        separator = true,
      }
    }

  }
}
