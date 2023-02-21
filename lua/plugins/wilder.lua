return {

  {
    'gelguy/wilder.nvim',
    config = function()
      local wilder = require 'wilder'

      wilder.setup({ modes = { ':', '/', '?' } }, { next_key = '<Tab>' }, { previous_key = '<S-Tab>' },
        { accept_key = '<C-y>' }, { reject_key = '<C-e>' })

      -- https://github.com/gelguy/wilder.nvim/issues/109
      -- Issue with python_difflib_sorter had to manually run :UpdateRemoteplugin
      -- TODO automate this?

      wilder.set_option(
        'renderer',
        wilder.popupmenu_renderer {
          highlighter = wilder.basic_highlighter(),
          max_height = 15,
          highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { {}, {}, { foreground = '#f4468f' } }),
          },
          left = { ' ', wilder.popupmenu_devicons() },
          right = { ' ', wilder.popupmenu_scrollbar() },
          apply_incsearch_fix = 0,
        }
      )
    end,
  },
}
