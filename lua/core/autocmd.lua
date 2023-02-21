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

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match

    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})
vim.api.nvim_create_autocmd('VimEnter DirChanged', {
  callback = function()
    utils.Inside_git_repo()
  end,
  group = vim.api.nvim_create_augroup('git_repo_check', { clear = true }),
  pattern = '*',
})

-- Resize all windows when we resize the terminal
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('win_autoresize', { clear = true }),
  desc = 'autoresize windows on resizing operation',
  command = 'wincmd =',
})
