local M = {}
function M.ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)

  -- 0 Refers to global
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function M.get_nvim_version()
  local actual_ver = vim.version()
  local nvim_ver_str = string.format('%d.%d.%d', actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

return M
