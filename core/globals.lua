local fn = vim.fn
local api = vim.api

local utils = require('utils')

vim.g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac  = utils.has("macunix") and true or false

vim.g.logging_level = "info"

vim.g.mapleader =  ',' -- leader key


