require('neoscroll').setup {
  easing_function = 'quadratic',
}

local t = {}

-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "20", [['cubic']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "20", [['cubic']] } }

require("neoscroll.config").set_mappings(t)
