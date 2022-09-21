-- Utils for config
local fn = vim.fn

local M = {}


function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

M.has = function(feature) 
  if fn.has(feature) == 1 then 
    return true
  end 

  return false
end

function M.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format("%d.%d.%d", actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

function M.add_pack(name)
  local status, error = pcall(vim.cmd, "packadd " .. name)

  return status
end


return M  
