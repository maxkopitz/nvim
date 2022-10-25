-- TODO, dont take up whole bottom leave room for filetree
local toggleterm = require('toggleterm')

toggleterm.setup {
  size = 13,
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  hide_numbers = true, -- Hide the number colun in toggleterm buffers
}

-- Terminal window mappings
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
