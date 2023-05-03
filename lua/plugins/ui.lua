return {
  -- bufferline
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
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
        truncate_names = true,  -- whether or not tab names should be truncated
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
  },
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "auto",
          globalstatus = true,
          icons_enabled = false,
          component_separators = '|',
          section_separators = '',
          disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline', 'netrw' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      }
    end
  },
  -- indent guides for Neovim
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = '┊',
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    }
  },
  -- icons
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}
