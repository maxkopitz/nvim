-- bootstrap lazy.nvim!
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=main', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
---@param opts LazyConfig
return function(opts)
  opts = vim.tbl_deep_extend('force', {
    install = { colorscheme = { 'onedark' } },
    ui = {
      icons = {
        ft = '',
        lazy = '鈴 ',
        loaded = '',
        not_loaded = '',
      },
    },
    performance = {
      rtp = {
        disabled_plugins = {
          '2html_plugin',
          'tohtml',
          'getscript',
          'getscriptPlugin',
          'gzip',
          'logipat',
          'netrw',
          'netrwPlugin',
          'netrwSettings',
          'netrwFileHandlers',
          'matchit',
          'tar',
          'tarPlugin',
          'rrhelper',
          'spellfile_plugin',
          'vimball',
          'vimballPlugin',
          'zip',
          'zipPlugin',
          'tutor',
          'rplugin',
          'syntax',
          'synmenu',
          'optwin',
          'compiler',
          'bugreport',
          'ftplugin',
        },
      },
    },
  }, {})
  -- require("lazy").setup(default_plugins, opts)
  require('lazy').setup('plugins.lazy', opts)
end
