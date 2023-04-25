return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  opts = {
    options = {
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      numbers = 'both', --[[ | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string, ]]
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon', --[[  | 'underline' | 'none', ]]
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = 'nvim_lsp', --[[ | "nvim_lsp" | "coc", ]]
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
          return ''
        end
        return ''
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'Filetype',
          padding = 1,
        },
        filetype = 'vista',
        text = 'Vista',
        padding = 1,
      },
      custom_filter = function(bufnr)
        -- if the result is false, this buffer will be shown, otherwise, this
        -- buffer will be hidden.

        -- filter out filetypes you don't want to see
        local exclude_ft = { 'qf', 'fugitive', 'git', 'checkhealth' }
        local cur_ft = vim.bo[bufnr].filetype
        local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

        if should_filter then
          return false
        end

        return true
      end,
      color_icons = true, --[[  | false, -- whether or not to add the filetype icon highlights ]]
      show_buffer_close_icons = true, --[[ true | false, ]]
      show_close_icon = true, --[[  | false, ]]
      show_tab_indicators = true, --[[  | false, ]]
      show_duplicate_prefix = true, --[[  | false, -- whether to show duplicate buffer prefix ]]
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = 'slant', --[[  "slant" | "thick" | "thin" | { "any", "any" }, ]]
      enforce_regular_tabs = false, --[[  | true, ]]
      always_show_bufferline = true, --[[   | false, ]]
    },
  },
}