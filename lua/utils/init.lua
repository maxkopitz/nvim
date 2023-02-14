local fn = vim.fn

local M = {}

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

--- Create a dir if it does not exist
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, 'p')
  end
end

function M.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format('%d.%d.%d', actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

-- Check if we are inside a Git repo.
function M.Inside_git_repo()
  local res = vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.fn.match(res, 'true') == 1 then
    return false
  else
    vim.cmd("doautocmd User InGitRepo")
    return true
  end
end
return M
