return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  opts = {
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    sort_by = 'name',
    open_on_tab = false,
    update_cwd = false,
    view = {
      width = 30,
      hide_root_folder = false,
      side = 'left',
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = '└ ',
          edge = '│ ',
          none = '  ',
        },
      },
      icons = {
        webdev_colors = true,
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 400,
    },
    filters = {
      custom = {
        '^.git$',
        '.DS_STORE',
      },
    },
    actions = {
      use_system_clipboard = true,
    },
    trash = {
      cmd = 'trash',
      require_confirm = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  },
}
