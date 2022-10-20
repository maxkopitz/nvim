--> My personal Nvim configuration <--
--> Email: mlkopitz@umich.edu <--
local api = vim.api
local utils = require("utils")

--> Checks for correct nvim veriosn <--
local expected_ver = "0.8.0"
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
	local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
	api.nvim_err_writeln(msg)
	return
end

local core_conf_files = {
  {"core.globals", "lua"},
  {"core.settings", "lua"},
	{"settings.vim", "vim"},
	{"autocommands.vim", "vim"},
  {"plugins.vim", "vim"},
  {"core.mappings", "lua"},
}

for _,contents in ipairs(core_conf_files) do
  if contents[2] == "vim" then
	  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), contents[1])
	  local source_cmd = "source " .. path
	  vim.cmd(source_cmd)
  else
    require(contents[1])
  end
end

