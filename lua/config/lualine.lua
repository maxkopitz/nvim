local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  'filetype',
  icons_enabled = true,
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local location = {
  'location',
  padding = 1,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line '.'
  local total_lines = vim.fn.line '$'
  local chars = { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
local spacing = {
  function()
    return '%='
  end,
}

local lsp_info = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '  LSP:',
  color = { fg = '#56B6C2', gui = 'bold' },
}

local custom_auto = require 'lualine.themes.auto'
custom_auto.terminal.a.bg = '#1e90ff'
custom_auto.normal.a.bg = '#131313'
custom_auto.normal.a.fg = '#6d7275'
custom_auto.normal.c.fg = '#E2E5DC'
custom_auto.normal.c.bg = '#131313'
custom_auto.insert.c.fg = '#51A266'
custom_auto.command.a.bg = '#1e90ff'
custom_auto.command.b.fg = '#1e90ff'
custom_auto.replace.a.bg = '#C83434'
custom_auto.visual.a.bg = '#725191'
custom_auto.visual.b.fg = '#1e90ff'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_auto,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
    always_divide_middle = false,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { branch, diff, diagnostics },
    lualine_c = { 'filename', spacing, lsp_info },
    lualine_x = { 'encoding', 'fileformat', filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
