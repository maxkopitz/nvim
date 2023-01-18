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


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keymaps for for telescope
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
