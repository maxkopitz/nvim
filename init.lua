-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local utils = require 'utils'

require 'core.config'
require 'core.settings'
require 'core.autocmd'
require 'core.keymappings'
require 'core.plugins'

--> Checks for correct nvim veriosn <--
local expected_ver = '0.8.2'
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
  local msg = string.format('Unsupported nvim version: expect %s, but got %s instead!', expected_ver, nvim_ver)
  vim.api.nvim_err_writeln(msg)
  return
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
