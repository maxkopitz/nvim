local M = {}
function M.ColorMyPencils(color)
  color = color or "rose-pine-main"
  vim.cmd.colorscheme(color)
end

return M
