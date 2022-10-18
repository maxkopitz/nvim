local fn = vim.fn
local api = vim.api;
local utils = require("utils")

-- Resize all windows when we resize the terminal
api.nvim_create_autocmd("VimResized", {
  group = api.nvim_create_augroup("win_autoresize", { clear = true }),
  desc = "autoresize windows on resizing operation",
  command = "wincmd =",
})


-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/plugins.lua",
  group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
  end,
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  group = api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(ctx)
    local dir = fn.fnamemodify(ctx.file, ":p:h")
    utils.may_create_dir(dir)
  end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
api.nvim_create_augroup("auto_read", { clear = true })
