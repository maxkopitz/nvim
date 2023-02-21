local utils = require 'utils'
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
  callback = function(ctx)
    local dir = vim.fn.fnamemodify(ctx.file, ':p:h')
    utils.may_create_dir(dir)
  end,
})

vim.api.nvim_create_autocmd('VimEnter DirChanged', {
  callback = function()
    utils.Inside_git_repo()
  end,
  group = vim.api.nvim_create_augroup('git_repo_check', { clear = true }),
  pattern = '*',
})

-- Auto-generate packer_compiled.lua file
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = '*/nvim/lua/core/plugins.lua',
  group = vim.api.nvim_create_augroup('packer_auto_compile', { clear = true }),
  callback = function(ctx)
    local cmd = 'source ' .. ctx.file
    vim.cmd(cmd)
    vim.cmd 'PackerCompile'
  end,
})

-- Resize all windows when we resize the terminal
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('win_autoresize', { clear = true }),
  desc = 'autoresize windows on resizing operation',
  command = 'wincmd =',
})
