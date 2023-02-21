vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = 'Git add' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
vim.keymap.set('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })

-- convert git to Git in command line mode
--vim.fn['utils#Cabbrev']('git', 'Git')
