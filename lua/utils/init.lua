local fn = vim.fn
local M = {}

M.root_patterns = { '.git', 'lua' }
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
  local res = vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.fn.match(res, 'true') == 1 then
    return false
  else
    vim.cmd 'doautocmd User InGitRepo'
    return true
  end
end

-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= '' and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end
return M
