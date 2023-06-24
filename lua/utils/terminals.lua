-- https://alpha2phi.medium.com/neovim-for-beginners-3rd-party-tools-c4a5148e501c
local M = {}

local Terminal = require('toggleterm.terminal').Terminal

-- Tokei
local tokei = 'tokei'
local lazydocker = 'lazydocker'

local project_info = Terminal:new {
  cmd = tokei,
  dir = 'git_dir',
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  close_on_exit = false,
}
local dockerinfo_lazy = Terminal:new {
  cmd = lazydocker,
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  close_on_exit = false,
}
function M.project_info_toggle()
  project_info:toggle()
end
function M.dockerinfo_lazy()
  dockerinfo_lazy:toggle()
end
-- Open a terminal
local function default_on_open(term)
  vim.cmd 'stopinsert'
  vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
end

function M.open_term(cmd, opts)
  opts.size = opts.size or vim.o.columns * 0.5
  opts.direction = opts.direction or 'vertical'
  opts.on_open = opts.on_open or default_on_open
  opts.on_exit = opts.on_exit or nil

  local new_term = Terminal:new {
    cmd = cmd,
    dir = 'git_dir',
    auto_scroll = false,
    close_on_exit = false,
    start_in_insert = false,
    on_open = opts.on_open,
    on_exit = opts.on_exit,
  }
  new_term:open(opts.size, opts.direction)
end

------------------ Cheatsheet ----------------------------
local lang = ''
local function cht_on_open(term)
  vim.cmd 'stopinsert'
  vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_name(term.bufnr, 'cheatsheet-' .. term.bufnr)
  vim.api.nvim_buf_set_option(term.bufnr, 'filetype', 'cheat')
  vim.api.nvim_buf_set_option(term.bufnr, 'syntax', lang)
end

local function cht_on_exit(term)
  vim.cmd [[normal gg]]
end

function M.cht()
  lang = ''
  vim.ui.input({ prompt = 'cht.sh input: ' }, function(input)
    local cmd = ''
    if input == '' or not input then
      return
    elseif input == 'h' then
      cmd = ''
    else
      local search = ''
      local delimiter = ' '
      for w in (input .. delimiter):gmatch('(.-)' .. delimiter) do
        if lang == '' then
          lang = w
        else
          if search == '' then
            search = w
          else
            search = search .. '+' .. w
          end
        end
      end
      cmd = lang
      if search ~= '' then
        cmd = cmd .. '/' .. search
      end
    end
    cmd = 'curl cht.sh/' .. cmd
    M.open_term(cmd, { on_open = cht_on_open, on_exit = cht_on_exit })
  end)
end
return M
