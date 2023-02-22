-- https://alpha2phi.medium.com/neovim-for-beginners-3rd-party-tools-c4a5148e501c
local M = {}

local Terminal = require("toggleterm.terminal").Terminal

-- Tokei
local tokei = "tokei"
local lazydocker = "lazydocker"

local project_info = Terminal:new({
  cmd = tokei,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
  })
local dockerinfo_lazy = Terminal:new({
  cmd = lazydocker,
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
  })
function M.project_info_toggle()
  project_info:toggle()
end
function M.dockerinfo_lazy()
  dockerinfo_lazy:toggle()
end
return M
