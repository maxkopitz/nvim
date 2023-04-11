-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local utils = require 'utils'

--> Checks for correct nvim veriosn <--
local expected_ver = '0.9.0'
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
  local msg = string.format('Unsupported nvim version: expect %s, but got %s instead!', expected_ver, nvim_ver)
  vim.api.nvim_err_writeln(msg)
  return
end

require 'core.config'
require 'core.settings'
require 'core.autocmd'
require 'core.keymappings'

require 'core.lazy' {}

require('onedark').load()

vim.keymap.set('n', '<Leader>q', '<cmd>x<cr>', { silent = true, desc = 'quit current window' })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
