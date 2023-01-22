-->Save key strokes, no longer need shift to enter command mode <--
vim.keymap.set({ 'n', 'x' }, ';', ':')

--> Switch windows <--
vim.keymap.set('n', '<Left>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<Right>', '<C-W>l', { silent = true })
vim.keymap.set('n', '<Up>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<Down>', '<C-W>j', { silent = true })

--> Quit all opened buffers <--
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<cr>', { silent = true, desc = 'quit nvim' })

--> Shortcut for faster save and quit <--
vim.keymap.set('n', '<leader>w', '<cmd>update<cr>', { silent = true, desc = 'save buffer' })

--> Saves the file if modified and quit <--
vim.keymap.set('n', '<leader>q', '<cmd>x<cr>', { silent = true, desc = 'quit current window' })

--> Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933 <--
vim.keymap.set('n', [[\d]], '<cmd>bprevious <bar> bdelete #<cr>', {
  silent = true,
  desc = 'delete buffer',
})

--> Split windows <--
vim.keymap.set('n', [[<leader>\]], '<cmd>vsplit <cr>', { silent = true, desc = 'Veritcal split' })
vim.keymap.set('n', [[<leader>|]], '<cmd>split <cr>', { silent = true, desc = 'Horizontal split' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
