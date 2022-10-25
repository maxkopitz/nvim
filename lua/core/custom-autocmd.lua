local fn = vim.fn
local api = vim.api
local utils = require 'utils'

-- Resize all windows when we resize the terminal
api.nvim_create_autocmd('VimResized', {
  group = api.nvim_create_augroup('win_autoresize', { clear = true }),
  desc = 'autoresize windows on resizing operation',
  command = 'wincmd =',
})

-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = '*/nvim/lua/plugins.lua',
  group = api.nvim_create_augroup('packer_auto_compile', { clear = true }),
  callback = function(ctx)
    local cmd = 'source ' .. ctx.file
    vim.cmd(cmd)
    vim.cmd 'PackerCompile'
  end,
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  group = api.nvim_create_augroup('auto_create_dir', { clear = true }),
  callback = function(ctx)
    local dir = fn.fnamemodify(ctx.file, ':p:h')
    utils.may_create_dir(dir)
  end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
api.nvim_create_augroup('auto_read', { clear = true })

api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
  pattern = '*',
  group = 'auto_read',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN, { title = 'nvim-config' })
  end,
})

api.nvim_create_autocmd({ 'FocusGained', 'CursorHold' }, {
  pattern = '*',
  group = 'auto_read',
  callback = function()
    if fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
})

-- Terminal Settings

api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = api.nvim_create_augroup('term_settings', { clear = true }),
  callback = function()
    vim.cmd 'setlocal norelativenumber nonumber'
    vim.cmd 'startinsert'
  end,
})

-- Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
api.nvim_create_augroup('dynamic_smartcase', { clear = true })

api.nvim_create_autocmd('CmdLineEnter', {
  pattern = ':',
  group = 'dynamic_smartcase',
  callback = function()
    vim.cmd 'set nosmartcase'
  end,
})

api.nvim_create_autocmd('CmdLineLeave', {
  pattern = ':',
  group = 'dynamic_smartcase',
  callback = function()
    vim.cmd 'set smartcase'
    -- vim.notify("leaving") just playing around, this is ran maybe too often
  end,
})

-- Number toggle
api.nvim_create_augroup('numbertoggle', { clear = true })

api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  group = 'numbertoggle',
  callback = function()
    vim.cmd 'if &nu | set rnu | endif'
  end,
})

api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  pattern = '*',
  group = 'numbertoggle',
  callback = function()
    vim.cmd 'if &nu | set nornu | endif'
  end,
})

-- Git repo check
api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  pattern = '*',
  group = api.nvim_create_augroup('git_repo_check', { clear = true }),
  callback = function()
    vim.cmd 'call utils#Inside_git_repo()'
  end,
})
